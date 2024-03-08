
'--- local/hybrids                                                    [mask.vbs]
'[2024-03-08][19:00:00] 002 Kartonagnick    
'[2024-02-23][06:50:00] 001 Kartonagnick
'  --- CastleOfDreams\hybrids                                         [mask.vbs]
'  [2022-02-06][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams\vbs                                           [mask.vbs]
'    [2021-08-08][19:00:00] 002 Kartonagnick
'    [2021-07-29][23:30:00] 001 Kartonagnick

' functions:
'   function maskToRegexp(mask)
'   function masksToRegexp(masks)
'   function matchByRegexp(text, regex)
'   function matchByInclude(text, list)
'   function matchByExclude(text, list)
'   function checkByRegexp(text, includes, excludes)

'   function matchByMask(text, mask)
'   function matchByMasks(text, masks)
'   function checkByMasks(text, includes, excludes)
'
'   function versionByRegexp(prefix, line)
'
' classes
'   class MaskExp
'     default function init(includes, excludes) 'списки масок
'     property Let include(masks) 'список масок нужного текста
'     property Let exclude(masks) 'список масок игнорируемого текста
'     property Get include()      'получение списка регулярок
'     property Get exclude()      'получение списка регулярок
'     property Get countInclude() 'получение количества регулярок
'     property Get countExclude() 'получение количества регулярок
'     function toRegexp(mask)     'преобразование маски в регулярку
'     function match(text)        'проверка соответсвия текста маскам

'===============================================================================
'===============================================================================

dim gMASK_LIB_INITIALISED
dim gMASK_CONVERTOR
dim gVERSION_REGEXP
dim gMASK_REGEXP

'===============================================================================
'===============================================================================

sub initMaskLibrary()
  if gMASK_LIB_INITIALISED then exit sub

  set gMASK_CONVERTOR = new RegExp
  gMASK_CONVERTOR.Pattern = "([\(\)\{\}\[\]\|\\\/\.\^\$])"
  gMASK_CONVERTOR.Global  = true

  set gMASK_REGEXP   = new RegExp
  gMASK_REGEXP.Global      = true
  gMASK_REGEXP.IgnoreCase  = true

  set gVERSION_REGEXP = new RegExp
  gVERSION_REGEXP.Pattern = "\b\d{1,3}\.\d{1,3}\.\d{1,3}\b"
  gVERSION_REGEXP.IgnoreCase = true
  gVERSION_REGEXP.Global = true

  gMASK_LIB_INITIALISED  = true
end sub

'===============================================================================
'===============================================================================

' for internal usage
sub exitByAssertMask_(from, desc1, desc2)
  WScript.Echo "[ERROR][ASSERT] " & from & ": " & desc1
  WScript.Echo "[ERROR][ASSERT] " & from & ": '" & desc2 & "'"
  WScript.Quit 1
end sub

function maskUnexpected_(mask)
  if typeName(mask) = "Folder" then
    exitByAssertMask_ "maskUnexpected", "unexpected <Folder>", mask.Path
  elseif typeName(mask) = "File" then
    exitByAssertMask_ "maskUnexpected", "unexpected <File>", mask.Path
  end if
  maskUnexpected_ = false
end function

'===============================================================================
'===============================================================================

' escaping service characters: ( ) { } [ ] | \ / . ^ \ $
' * -> .*
' ? -> .
' add ^ to the beginning: ^mask
' add an $ to the end: mask$
' example: "*.*" -> "^.*\..*$"

function maskToRegexp(mask)
  if mask = Empty then 
    maskToRegexp = ""
  elseif maskUnexpected_(mask) then
    ' nothing
  else
    dim tmp
    tmp = gMASK_CONVERTOR.Replace(mask, "\$1")
    tmp = Replace(tmp, "*", ".*")
    tmp = Replace(tmp, "?", ".")
    maskToRegexp = "^" + tmp + "$"
  end if
end function

'===============================================================================
'===============================================================================

' mask - string, array or System.Collections.ArrayList
' return System.Collections.ArrayList
function masksToRegexp(masks)
  dim collect
  set collect = CreateObject("System.Collections.ArrayList")
  if IsNull(masks) then
    set masksToRegexp = collect
  elseif vartype(masks) = vbEmpty then
    set masksToRegexp = collect
  elseif maskUnexpected_(masks) then
    ' nothing
  elseif vartype(masks) = vbString then
    if masks = Empty then 
      set masksToRegexp = collect
    else
      set masksToRegexp = masksToRegexp(split(masks, ";")) 
    end if
  else
    dim mask
    for each mask in masks
      if maskUnexpected_(mask) then
        ' nothing
      end if
      mask = trim(mask)
      if mask <> Empty then
        collect.Add(maskToRegexp(mask))
      end if
    next  
    set masksToRegexp = collect
  end if
end function

'===============================================================================
'===============================================================================

' IgnoreCase
' Empty VS Value -> check
' Empty VS Once --> false
' Empty VS Empty -> true
' Empty VS Any ---> true
' Value VS Any ---> true
' Value VS Empty -> true
' Value VS Once --> check
' Value VS Value -> check
function matchByRegexp(text, regex)
  if typeName(text) = "File" then
    matchByRegexp = matchByRegexp(text.Name, regex)
  elseif typeName(text) = "Folder" then
    matchByRegexp = matchByRegexp(text.Name, regex)
  else
    gMASK_REGEXP.Pattern = regex
    if gMASK_REGEXP.Test(text) then
      matchByRegexp = true
    else
      matchByRegexp = false
    end if
  end if
end function

'===============================================================================
'===============================================================================

'skip empty regexp
'if all list of regexp are skipped -> true
function matchByInclude(text, list)
  if vartype(list) = vbString then
    if list = Empty then
      matchByInclude = true
    else
      dim arr: arr = Split(list, ";", -1, 0)
      matchByInclude = matchByInclude(text, arr)
    end if
  else
    dim rx: matchByInclude = true
    for each rx in list
      rx = trim(rx)
      if rx <> Empty then
        if matchByRegexp(text, rx) then
          matchByInclude = true
          exit function
        else 
          matchByInclude = false
        end if
      end if
    next
  end if
end function

'skip empty regexp
'if all list of regexp are skipped -> false
function matchByExclude(text, list)
  if vartype(list) = vbString then
    if list = Empty then
      matchByExclude = false
    else
      dim arr: arr = Split(list, ";", -1, 0)
      matchByExclude = matchByExclude(text, arr)
    end if
  else
    dim rx: matchByExclude = false
    for each rx in list
      rx = trim(rx)
      if rx <> Empty then
        if matchByRegexp(text, rx) then
          matchByExclude = true
          exit function
        end if
      end if
    next
  end if
end function

'empty-exclude -> ignored
'empty-include -> always true
function checkByRegexp(text, includes, excludes)
  checkByRegexp = false
  if matchByInclude(text, includes) then
    if not matchByExclude(text, excludes) then
      checkByRegexp = true
    end if
  end if
end function

'===============================================================================
'===============================================================================

' IgnoreCase
' Empty VS Value -> check
' Empty VS Once --> false
' Empty VS Empty -> true
' Empty VS Any ---> true
' Value VS Any ---> true
' Value VS Empty -> true
' Value VS Once --> check
' Value VS Value -> check
function matchByMask(text, mask)
  dim rx: rx = maskToRegexp(mask)
  matchByMask = matchByRegexp(text, rx)
end function

'===============================================================================
'===============================================================================

'skip empty mask
'if all mask are skipped -> true
function matchByMasks(text, masks)
  dim rx_list: set rx_list = masksToRegexp(masks)
  matchByMasks = matchByInclude(text, rx_list)
end function

'===============================================================================
'===============================================================================

'empty-exclude -> ignored
'empty-include -> always true
function checkByMasks(text, includes, excludes)
  dim rx_includes: set rx_includes = masksToRegexp(includes)
  dim rx_excludes: set rx_excludes = masksToRegexp(excludes)
  checkByMasks = checkByRegexp(text, rx_includes, rx_excludes)
end function

'===============================================================================
'===============================================================================

class MaskExp
  private m_include
  private m_exclude

  private sub Class_Initialize()
    set m_include = CreateObject("System.Collections.ArrayList")
    set m_exclude = CreateObject("System.Collections.ArrayList")
  end sub

  public default function init(includes, excludes)
    me.include = includes
    me.exclude = excludes
    set init = me
  end function

  property Let include(masks) set m_include = masksToRegexp(masks) end property
  property Let exclude(masks) set m_exclude = masksToRegexp(masks) end property
  property Get include()      set include   = m_include            end property
  property Get exclude()      set exclude   = m_exclude            end property
  property Get countInclude() countInclude  = m_include.count      end property
  property Get countExclude() countExclude  = m_exclude.count      end property

  function match(text)
    match = checkByRegexp(text, m_include, m_exclude)
  end function

  function toRegexp(mask)
    toRegexp = maskToRegexp(mask)
  end function
end class

'===============================================================================
'===============================================================================

function versionByRegexp(prefix, line)
  dim matches
  gVERSION_REGEXP.Pattern = prefix
  set matches = gVERSION_REGEXP.Execute(line)
  if matches.Count = 0 then
    versionByRegexp = ""
  else
    gVERSION_REGEXP.Pattern = "(\bv?\d{1,3}\.\d{1,3}\.\d{1,3}\b)"
    set matches = gVERSION_REGEXP.Execute(line)
    if matches.Count = 0 then
      versionByRegexp = ""
      exit function
    end if
    dim ver: ver = matches.Item(0)
    ver = Replace(ver, "ver", "")
    ver = Replace(ver, "v"  , "")
    versionByRegexp = ver
  end if
end function

initMaskLibrary()
