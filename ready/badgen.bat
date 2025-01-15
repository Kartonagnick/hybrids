::'@echo off & call :'checkParent || exit /b 1
::'set "eDEBUG=ON"
::'set "eINCLUDE_FILE=*.md"
::'set "eEXCLUDE_FILE=_*"
::'set "xINCLUDE_SCAN=resources*"
::'set "eEXCLUDE_SCAN=_*"
::'cscript //nologo //e:vbscript "%~f0" %*
::'exit /b

'--- local/hybrids                                          [script][badgen.bat]
'[2025-01-15][19:00:00] 001 Kartonagnick PRE
'===============================================================================
'--------------------------------------------------------------[vbs/glob.vbs]---

'--- local/hybrids                                                    [glob.vbs]
'[2024-02-17][20:30:00] 001 Kartonagnick    
'  --- CastleOfDreams\hybrids                                      [initial.vbs]
'  [2022-01-11][19:00:00] 001 Kartonagnick

dim g_list   : set g_list   = CreateObject("System.Collections.ArrayList")
dim g_fso    : set g_fso    = CreateObject("Scripting.FileSystemObject")
dim g_regexp : set g_regexp = CreateObject("VBScript.RegExp")
dim g_shell  : set g_shell  = CreateObject("WScript.Shell")
dim g_env    : set g_env    = g_shell.Environment("PROCESS")

'--------------------------------------------------------------[vbs/echo.vbs]---

'--- local/hybrids                                                    [echo.vbs]
'[2024-04-02][08:30:00] 003 Kartonagnick    
'[2024-02-18][02:00:00] 002 Kartonagnick
'  --- CastleOfDreams\hybrids                                         [echo.vbs]
'  [2022-01-26][19:00:00] 001 Kartonagnick

' procedures:
'   sub echo(deep, msg)
'   sub dbg(deep, msg)
'

dim gSILENCE
dim gINDENT
dim gSPACES
dim gDEBUG

sub initEchoLibrary()
  if g_env.Item("eDEBUG") = "ON" then
    gDEBUG = true
  end if
  if g_env.Item("eSILENCE") = "ON" then
    gSILENCE = true
  end if
  gINDENT = g_env.Item("eINDENT")
  if gINDENT = Empty then 
    gINDENT = 0
  else
    gINDENT = gINDENT + 1
  end if  
  gSPACES = Space(gINDENT * 2)
end sub

function make_indent(deep)
  if deep < 0 then deep = 0
  make_indent = Space(deep * 2)
end function

function indent(deep)
  indent = make_indent(deep) & gSPACES
end function

sub echo(deep, msg)
  if gSILENCE then exit sub
  WScript.Echo indent(deep) & msg
end sub
        
sub dbg(deep, msg)
  if not gDEBUG then exit sub
  echo deep, msg
end sub 

initEchoLibrary()

'------------------------------------------------------------[vbs/assert.vbs]---

'--- local/hybrids                                                  [assert.vbs]
'[2024-02-19][19:00:00] 003 Kartonagnick    
'  --- CastleOfDreams\hybrids                                       [assert.vbs]
'  [2022-01-26][19:00:00] 002 Kartonagnick
'  [2021-12-20][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams\vbs                                         [assert.vbs]
'    [2021-07-20][16:00:00] 001 Kartonagnick

' procedures:
'   sub exitByAssert(from, desc)
'   sub assert(from, desc, v)

sub exitByAssert(from, desc)
  WScript.Echo "[ERROR][ASSERT] " & from & ": " & desc
  WScript.Quit 1
end sub

sub assert(from, desc, v)
  if IsNull(v) then
    exitByAssert from, desc
  elseif isArray(v) then
    exitByAssert "assert", "unexpected <Array: " & UBound(v) + 1 & ">"
  elseif IsObject(v) then
    if v is nothing then
      exitByAssert from, desc
    else
      exitByAssert "assert", "unexpected <Object>"
    end if
  elseif vartype(v) = vbString then
    dim a: a = UCase(v)
    if a = "1" or a = "ON" or a = "YES" or a = "TRUE" then 
      'test has been successfully passed
    else
      exitByAssert from, desc
    end if
  elseif v = Empty then  'or false
    exitByAssert from, desc
  end if
  'test has been successfully passed
end sub

'------------------------------------------------------------[env/string.vbs]---

'--- local/hybrids                                              [env/string.vbs]
'[2024-09-30][19:00:00] 001 Kartonagnick    

function fromStringEnv(text)
  dim v
  if not vartype(text) = vbString then
    v = typename(text)
    dim info: info = "[ERROR][ASSERT] fromStringEnv(invalid type): "
    WScript.Echo info & "'" & v & "' (must be string)"
    WScript.Quit 1
  end if
  if text = "" or text = "0" then 
    fromStringEnv = false
  elseif text = "1" then
    fromStringEnv = true
  else
    v = lcase(text)
    if v = "false" or v = "off" or v = "no" then 
      fromStringEnv = false
    elseif v = "true" or v = "on" or v = "yes" then 
      fromStringEnv = true
    else
      fromStringEnv = text
    end if
  end if
end function

'-------------------------------------------------------[vbs/environment.vbs]---

'--- local/hybrids                                             [environment.vbs]
'[2024-09-30][19:00:00] 001 Kartonagnick    

function fromEnvironment(name, def)
  dim v: v = g_env.Item(name)
  if v = empty then
    fromEnvironment = fromStringEnv(def)
  else
    fromEnvironment = fromStringEnv(v)
  end if
end function

'--------------------------------------------------------[date/datestamp.vbs]---

'--- local/hybrids                                          [date/datestamp.vbs]
'[2024-09-24][19:00:00] 001 Kartonagnick    

function datestamp()
  dim dt: dt = now()
  dim tt: tt = timer()
  dim yy: yy = year(dt)
  dim mo: mo = right("0" & month(dt) , 2)
  dim dd: dd = right("0" & day(dt)   , 2) 
  dim hh: hh = right("0" & hour(dt)  , 2)
  dim mm: mm = right("0" & minute(dt), 2) 
  dim ss: ss = right("0" & second(dt), 2) 
  dim ms: ms = int((tt - int(tt)) * 1000 + 0.5): ms = right("0" & ms, 3)
  datestamp = "[" & yy & "-" & mo & "m-" & dd & "][" & hh & ":" & mm & ":" & ss & "." & ms & "]"
end function

'----------------------------------------------------------[date/elapsed.vbs]---

'--- local/hybrids                                            [date/elapsed.vbs]
'[2024-09-26][19:00:00] 001 Kartonagnick    

class Elapsed
  function start()
    begT = Timer()
  end function 
  
  function value()
    dim sec: sec = Round(Timer() - begT, 2)
    value = description(sec)
  end function 

  function description(sec)
    dim ms, ss, mm, hh, dd, ww, re1, re2
    const SECONDS_IN_WEEK   = 604800
    const SECONDS_IN_DAY    = 86400
    const SECONDS_IN_HOUR   = 3600
    const SECONDS_IN_MINUTE = 60
    ms = int((sec - int(sec)) * 1000 + 0.5)    
    if sec < SECONDS_IN_MINUTE then
      ss = int(sec)
    elseif sec < SECONDS_IN_HOUR Then 
      mm = int(sec / SECONDS_IN_MINUTE)
      ss = sec mod SECONDS_IN_MINUTE
    elseif sec < SECONDS_IN_DAY Then
      hh = int(sec / SECONDS_IN_HOUR)
      mm = int((sec mod SECONDS_IN_HOUR) / SECONDS_IN_MINUTE)
      ss = (sec mod SECONDS_IN_HOUR) mod SECONDS_IN_MINUTE
    elseif sec < SECONDS_IN_WEEK Then
      dd = int(sec / SECONDS_IN_DAY)
      hh = int((sec mod SECONDS_IN_DAY)  / SECONDS_IN_HOUR)
      mm = int((sec mod SECONDS_IN_HOUR) / SECONDS_IN_MINUTE)
      ss = int((sec mod SECONDS_IN_HOUR) mod SECONDS_IN_MINUTE)
    else
      ww = int(sec / SECONDS_IN_WEEK)
      dd = int((sec mod SECONDS_IN_WEEK) / SECONDS_IN_DAY) 
      hh = int((sec mod SECONDS_IN_DAY ) / SECONDS_IN_HOUR)
      mm = int((sec mod SECONDS_IN_HOUR) / SECONDS_IN_MINUTE)
      ss = int((sec mod SECONDS_IN_HOUR) mod SECONDS_IN_MINUTE)
    end if
    re1 = w_(ww, "week") & w_(dd, "day") & w_(hh, "hour")
    re2 = s_(mm, "min")  & s_(ss, "sec") & s_(ms, "ms")
    description = trim(re1 & re2)
    if description = Empty then
      description = "0 ms"
    end if
  end function

  private function w_(v, dsc)
    if v = 0 then 
      w_ = ""
    elseif v = 1 then 
      w_ = "1 " & dsc & " "
    else              
      w_ = v & " " & dsc & "s "
    end if
  end function

  private function s_(v, dsc)
    if v = 0 then 
      s_ = ""
    else          
      s_ = v & " " & dsc & " "
    end if
  end function

  private sub Class_Initialize()
    begT = Timer()
  end sub

  private begT
end class

'--------------------------------------------------------------[vbs/mask.vbs]---

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

'--------------------------------------------------------------[vbs/trim.vbs]---

'--- local/hybrids                                                    [trim.vbs]
'[2024-02-21][01:30:00] 001 Kartonagnick    
'  --- CastleOfDreams\hybrids                                         [trim.vbs]
'  [2021-12-11][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams\vbs                                           [trim.vbs]
'    [2021-08-08][19:00:00] 002 Kartonagnick
'    [2021-07-22][19:00:00] 001 Kartonagnick

' functions:
'   function trimFront(text, chars)
'   function trimBack(text, chars)
'   function trimBoth(text, chars)
'   function trimList(lst)

'example: 
'  trimBack("path\ \ \\ ", "\ ")
'  result: path

function trimBack(text, chars)
  dim back, pos
  if text = empty then 
    trimBack = ""
    exit function
  end if
  back = Right(text, 1)
  pos = Instr(1, chars, back, 0)
  if pos > 0 then
    dim tmp: tmp = Left(text, Len(text) - 1)
    trimBack = trimBack(tmp, chars)
  else 
    trimBack = text
  end if
end function

'example:
'  trimFront(" \\ \  \ \  path", "\ ")
'  result: path

function trimFront(text, chars)
  dim front, pos
  if text = empty then 
    trimFront = ""
    exit function
  end if
  front = Left(text, 1)
  pos = Instr(1, chars, front, 0)
  if pos > 0 then
    dim tmp: tmp = Right(text, Len(text) - 1)
    trimFront = trimFront(tmp, chars)
  else
    trimFront = text
  end if
end function

'example:
'  trimFront(" \\ \  \ \  path\ \ \\ ", "\ ")
'  result: path

function trimBoth(text, chars)
  dim t: t = trimBack(text, chars)
  trimBoth = trimFront(t, chars)
end function

' trim each element of the collection
'   lst: array or array-compatible-object
'   return System.Collections.ArrayList
function trimmed(lst)
  dim el: dim cpy
  set cpy = CreateObject("System.Collections.ArrayList")
  for each el in lst
    el = trim(el)
    if el <> empty then
      cpy.add el
    end if
  next
  set trimmed = cpy
end function

' trim each element of the collection
'   lst: can be string, array, or array-compatible-object
function trimList(lst)
  if isArray(lst) then
    trimList = trimmed(lst).toArray()
  elseif vartype(lst) = vbString then
    dim arr: arr = trimmed(split(lst, ";")).toArray()
    trimList = join(arr, ";")
  else
    set trimList = trimmed(lst)
  end if
end function

'-----------------------------------------------------------[vbs/find_in.vbs]---

'--- local/hybrids                                                 [find_in.vbs]
'[2024-03-09][04:10:00] 003 Kartonagnick    
'[2024-03-07][23:50:00] 002 Kartonagnick
'  --- CastleOfDreams\hybrids                                       [finder.vbs]
'  [2022-03-02][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams\vbs                                        [Find_in.vbs]
'    [2021-08-08][19:00:00] 002 Kartonagnick
'    [2021-08-04][23:30:00] 001 Kartonagnick


class Find_in
  private mDEBUG
  private mHIDE_SKIP
  private mHIDE_SCAN
  private mDIRS_START
  private mFOUND_S
  private mFOUND_D
  private mFOUND_F
  private mRegexpF
  private mRegexpD
  private mRegexpS
  private mONCE
  private mDONE
  private mDEEP
  private mSELF

  public default function init(paths)
    scanDirs = paths
    set init = me
  end function

  property Get dirs()  set dirs  = mFOUND_D     end property
  property Get files() set files = mFOUND_F     end property
  property Let hideSkip(v) mHIDE_SKIP = v       end property
  property Let hideScan(v) mHIDE_SCAN = v       end property
  property Let debug(v)    mDEBUG     = v       end property
  property Let once(v)     mONCE      = v       end property

  property Let scanDirs(v) setList mDIRS_START, v end property

  property Let includeS(v) mRegexpS.include = v end property
  property Let excludeS(v) mRegexpS.exclude = v end property
  property Let includeF(v) mRegexpF.include = v end property
  property Let excludeF(v) mRegexpF.exclude = v end property
  property Let includeD(v) mRegexpD.include = v end property
  property Let excludeD(v) mRegexpD.exclude = v end property

  sub showParams(deep)
    dim dp: dp = deep + 1
    echo deep, ">----------[" & mSELF & "]----------<"
    showArray dp, "DIRS_START", mDIRS_START
    if mHIDE_SKIP then echo dp, "HIDE_SKIP: ON"
    if mHIDE_SCAN then echo dp, "HIDE_SCAN: ON"
    if mDEBUG     then echo dp, "DEBUG: ON"
    if mONCE      then echo dp, "ONCE: ON"
    if noEmpty(mRegexpF.include) then showArray dp, "INCLUDE_F", mRegexpF.include
    if noEmpty(mRegexpF.exclude) then showArray dp, "EXCLUDE_F", mRegexpF.exclude    
    if noEmpty(mRegexpD.include) then showArray dp, "INCLUDE_D", mRegexpD.include
    if noEmpty(mRegexpD.exclude) then showArray dp, "EXCLUDE_D", mRegexpD.exclude    
    if noEmpty(mRegexpS.include) then showArray dp, "INCLUDE_S", mRegexpS.include
    if noEmpty(mRegexpS.exclude) then showArray dp, "EXCLUDE_S", mRegexpS.exclude    
    echo deep, ">----------------------------<"
  end sub

  function run(deep)
    if mDEBUG then showParams deep
    dbgPrint deep, mSELF & ": running..."
    dim d: dim mydeep: mydeep = clear(deep)
    for each d in mDIRS_START
      scan mydeep, d
      if mDONE then 
        dbgScan mydeep, "done"
        exit for
      end if
    next
    dbgPrint deep, mSELF & ": finished"
  end function

'------------------------------------

  private function scan(deep, d_path)
    dim dir: dir = d_path
    dim dp: dp = deep - mDEEP 
    dbgScan deep, "scan(" & dp & "): '" & dir & "'"
    if dir = Empty then
      dbgScan deep, "empty value -> skip"
      exit function
    end if
    
    if not g_fso.FolderExists(dir) then
      dbgScan deep, "not exists"
      exit function
    end if
    
    dim d: set d = g_fso.GetFolder(dir)
    addFiles deep, d
    addDirs  deep, d
    addScan  deep, d
    runMore  deep + 1
    dbgScan  deep, "done(" & dp & ")"
  end function

  private sub addFiles(deep, odir)
    if mDONE then exit sub
    dim f
    for each f in odir.Files
       if mRegexpF.match(f) then
        dbgPrint deep + 1, "f: add: " & f
        mFOUND_F.Add f
        if mONCE then
          mDONE = true
          exit sub
        end if
      else
        dbgSkip deep + 1, "f: skip: " & f
      end if
    next
  end sub

  private sub addDirs(deep, odir)
    if mDONE then exit sub
    dim d
    for each d in odir.SubFolders
       if mRegexpD.match(d) then
        dbgPrint deep + 1, "d: add: " & d
        mFOUND_D.Add d
        if mONCE then
          mDONE = true
          exit sub
        end if
      else
        dbgSkip deep + 1, "d: skip: " & d
      end if
    next
  end sub

  private sub addScan(deep, odir)
    if mDONE then exit sub
    dim d
    for each d in odir.SubFolders
       if mRegexpS.match(d) then
        dbgScan deep + 1, "s: add: " & d
        mFOUND_S.Add(d)
      else
        dbgSkip deep + 1, "s: skip: " & d
      end if
    next
  end sub

  private sub runMore(deep)
    if mFOUND_S.Count = 0 then exit sub
    dbgScan deep, "more: " & mFOUND_S.Count
    dim cur: dim dir: set cur = mFOUND_S.Clone()
    mFOUND_S.Clear
    for each dir in cur
      scan deep, dir
      if mDONE then 
        dbgScan deep + 1, "done."
        exit sub
      end if
    next
  end sub
'---
  sub exitByAssert(from, desc)
    WScript.Echo "[ERROR][ASSERT] Find_IN: " & from & ": " & desc
    WScript.Quit 1
  end sub
'---
  private sub setList(dst, v)
    dst.clear
    if IsNull(v) then
      exit sub
    elseif isArray(v) then
       trimList dst, v
    elseif IsObject(v) then
      if v is nothing then
        exit sub
      elseif typename(v) = "ArrayList" then
         trimList dst, v
      else
        exitByAssert "Find_IN.setlist", "unexpected: " & typename(v)
      end if
    elseif vartype(v) = vbEmpty then
      exit sub
    elseif vartype(v) = vbString then
      if v = Empty then
        exit sub
      else
        setList dst, split(v, ";")
        exit sub
      end if
    else                                      
      exitByAssert "Find_IN.setlist", "unexpected: " & typename(v)
    end if
  end sub

  private sub trimList(dst, lst)
    dim el: dim map: set map = CreateObject("Scripting.Dictionary")
    for each el in lst
      el = trim(el)
      if el <> Empty then
        map(el) = 1
      end if
    next
    dst.clear
    for each el in map
      dst.add el 
    next 
  end sub

  private function noEmpty(collect)
    if collect.count <> 0 then
      noEmpty = true
    else
      noEmpty = false
    end if
  end function
  
  private sub showArray(deep, name, collect)
    echo deep, name
    if collect.count = 0 then
      echo deep + 1, "(empty)"
    else
      dim el: dim idx: idx = 1
      for each el in collect
        echo deep + 1, idx & ") " & el
        idx = idx + 1
      next
    end if
  end sub

  private function dbgPrint(deep, text)
    if mDEBUG then 
      echo deep, text  
    end if
  end function

  private function dbgScan(deep, text)
    if mDEBUG and not mHIDE_SCAN then 
      echo deep, text  
    end if
  end function

  private function dbgSkip(deep, text)
    if mDEBUG and not mHIDE_SKIP then 
      echo deep, text  
    end if
  end function

  private function clear(deep)
    mFOUND_S.Clear
    mFOUND_D.Clear
    mFOUND_F.Clear
    mDONE = false
    mDEEP = deep
    if mHIDE_SCAN then
      clear = deep
    else
      clear = deep + 1
    end if
  end function

  private sub Class_Initialize()
    mSELF = typename(me)
    mHIDE_SKIP = false
    mHIDE_SCAN = false
    mDEBUG     = false

    set mDIRS_START = CreateObject("System.Collections.ArrayList")
    set mFOUND_S    = CreateObject("System.Collections.ArrayList")
    set mFOUND_D    = CreateObject("System.Collections.ArrayList")
    set mFOUND_F    = CreateObject("System.Collections.ArrayList")

    set mRegexpF = new MaskExp
    set mRegexpD = new MaskExp
    set mRegexpS = new MaskExp
  end sub
end class

'----------------------------------------------------------[vbs/fcontent.vbs]---

'--- local/hybrids                                                [fcontent.vbs]
'[2025-01-13][13:00:00] 001 Kartonagnick    

class FileContent
  private adCRLF            ' -1 Default. Carriage return line feed 
  private adLF              ' 10 Line feed only
  private adCR              ' 13 Carriage return only
  private FOR_READING       '  1
  private FOR_WRITING       '  2
  private CREATE_NOT_EXIST  '  1
  private CREATE_OVERWRITE  '  2
  private READ_LINE         ' -2
  private READ_ALL          ' -1
  private TYPE_BIN          '  1
  private TYPE_TXT          '  2

  private m_content  'ArrayList: content of file
  private m_eol      'eol mode: CRLF | LF | CR

  function load(path, func)
    set content = CreateObject("System.Collections.ArrayList")
    if not g_fso.FileExists(path) then
      set load = content
      exit function
    end if

    dim f_stream, line, content, callback
    set f_stream = CreateObject("ADODB.Stream")

    m_eol = detectEOL(path)
    with f_stream
      .LineSeparator = m_eol
      .CharSet = "utf-8"
      .Open
      .LoadFromFile(path)
    end with

    set callback = GetRef(func)

    do while not f_stream.EOS
      line = f_stream.ReadText(READ_LINE)
      if callback(line) then
        content.add line
      end if
    loop
    f_stream.close
    set load = content
  end function 

  sub saveEndl(path, content)
    dim eol, line, utf8
    set utf8 = getStream()
    eol = getStreamEOL()
    for each line in content
      utf8.WriteText(line & eol)
    next
    saveNoBom utf8, path
  end sub

  sub save(path, content)
    dim i, eol, line, utf8
    set utf8 = getStream()
    eol = getStreamEOL()

    if content.count > 0 then
      for i = 0 to content.count - 2
        line = content(i)
'        echo 1, "WriteText: '" & line & "' (endl)"
        utf8.WriteText(line & eol)
      next
      line = content(content.count - 1)
'      echo 1, "WriteText: '" & line & "'"
      utf8.WriteText(line)
    end if
    saveNoBom utf8, path
  end sub

'---[PRIVATE]-------------------------

  private function getStream()
    dim utf8: set utf8 = CreateObject("ADODB.Stream")
    with utf8
      .LineSeparator = m_eol
      .CharSet = "utf-8"
      .Type = TYPE_TXT
      .Open
    end with
    set getStream = utf8
  end function

  private function getStreamEOL()
    if m_eol = adCRLF then
      getStreamEOL = vbCrLf
    else
      getStreamEOL = vbLf
    end if
  end function

  private sub saveNoBom(utf8, path)
    dim no_bom
    utf8.Position = 3
    set no_bom = CreateObject("ADODB.Stream")
    no_bom.Type = TYPE_BIN
    no_bom.Open
    utf8.CopyTo no_bom
    no_bom.SaveToFile path, CREATE_OVERWRITE
    no_bom.close
    utf8.close
  end sub

  private function detectEOL(path)
    dim f_stream, content, symbol, pos
    if g_fso.GetFile(path).size = 0 then    
      detectEOL = adCRLF
      exit function
    end if
    set f_stream = g_fso.OpenTextFile(path, FOR_READING)
    content = f_stream.ReadAll()
    pos = instr(content, vbLF)
    if pos = 1 then
      detectEOL = adLF
    elseif pos > 0 then
      symbol = Mid(content, pos - 1, 1)
      if symbol = vbCR then
        detectEOL = adCRLF
      else
        detectEOL = adLF
      end if
    else
      detectEOL = adCRLF
    end if
  end function

  private sub Class_Initialize()
    CREATE_NOT_EXIST = 1
    CREATE_OVERWRITE = 2
    FOR_READING      = 1
    FOR_WRITING      = 2
    READ_LINE        = -2
    READ_ALL         = -1
    TYPE_BIN         = 1
    TYPE_TXT         = 2
    adCRLF           = -1
    adLF             = 10
    adCR             = 13
    m_eol = adCRLF
  end sub
end class

'------------------------------------------------------[sources/settings.vbs]---

'--- local/hybrids                                    [dev/badgen][settings.vbs]
'[2025-01-15][19:00:00] 001 Kartonagnick PRE

class CSettings

  private m_dir_work     'string:  work directory (current by default)
  private m_hide_skip    'boolean: do not show skipped files or directories
  private m_hide_scan    'boolean: do not show scan-process
  private m_dirs_start   'string:  directories to scan
  private m_exclude_scan 'string:  ignore directories when scanning
  private m_exclude_file 'string:  ignored files
  private m_exclude_dir  'string:  ignored directories
  private m_include_scan 'string:  scan this directories
  private m_include_file 'string:  add this files to result
  private m_include_dir  'string:  add this directory to result
  private m_find_once    'boolean: stop scanning on first successful detection

  private m_style        'string: shields | badgen (badgen by default)

  property get style() style = LCase(m_style) end property     

  property get files(deep)   
    if g_fso.FileExists(m_dir_work) then
      set files = CreateObject("System.Collections.ArrayList")
      files.add m_dir_work
      exit property
    end if

    dim find: set find = (new Find_in)(m_dirs_start)
    with find
      .includeS = m_include_scan
      .excludeS = m_exclude_scan
      .includeD = m_include_dir
      .excludeD = m_exclude_dir
      .includeF = m_include_file
      .excludeF = m_exclude_file
      .hideSkip = m_hide_skip
      .hideScan = m_hide_scan
      .once     = m_find_once
      .debug    = false
    end with
    find.run deep 
    set files = find.files()
  end property

  sub showDebug(deep)
    if not gDEBUG then exit sub
    showOnce deep, "STYLE"       , m_style    
    showOnce deep, "DIR WORK"    , m_dir_work
    showList deep, "DIRS SCAN"   , m_dirs_start
    showList deep, "INCLUDE_SCAN", m_include_scan
    showList deep, "EXCLUDE_SCAN", m_exclude_scan
   'showList deep, "INCLUDE_DIR" , m_include_dir
   'showList deep, "EXCLUDE_DIR" , m_exclude_dir
    showList deep, "INCLUDE_FILE", m_include_file
    showList deep, "EXCLUDE_FILE", m_exclude_file
   'showOnce deep, "FIND ONCE"   , m_find_once
    showOnce deep, "HIDE SKIP"   , m_hide_skip
    showOnce deep, "HIDE SCAN"   , m_hide_scan
    showOnce deep, "DEBUG"       , gDEBUG    
  end sub

'---[PRIVATE]-------------------------

  private sub showOnce(deep, dsc, value)
    dim len_descript, len_maximum, len_left, prefix
    len_descript = len(dsc)
    len_maximum = len("EXCLUDE_SCAN")
    len_left = len_maximum - len_descript
    prefix = String(len_left, ".")
    echo deep, dsc & " " & prefix & "... " & value
  end sub

  private sub showList(deep, dsc, text)
    dim el, cnt, arr: arr = split(text, ";")
    cnt = UBound(arr) + 1
    if cnt = 0 then
      showOnce deep, dsc, "empty"
    elseif cnt = 1 then
      showOnce deep, dsc, arr(0)
    else
      echo deep, dsc & ":"
      for each el in arr
        echo deep + 1, "- " & el
      next
    end if
  end sub

  private function getDirectoryWrk()
    dim cur
    cur = g_shell.CurrentDirectory
    cur = fromEnvironment("eDIR_WORK", cur)
    cur = g_fso.GetAbsolutePathName(cur)
    getDirectoryWrk = cur
  end function 

  private sub reset
    m_style = fromEnvironment("eMAKE_STYLE", "badgen")

    m_dir_work   = getDirectoryWrk()
    m_dirs_start = fromEnvironment("eDIRS_START", m_dir_work)
   'm_find_once  = fromEnvironment("eFIND_ONCE" , "0")
    m_find_once  = false

    m_hide_skip = fromEnvironment("eHIDE_SKIP", "1")
    m_hide_scan = fromEnvironment("eHIDE_SCAN", "1")

    m_include_scan = trim(g_env.Item("eINCLUDE_SCAN"))
    m_exclude_scan = trim(g_env.Item("eEXCLUDE_SCAN"))

   'm_include_dir  = trim(g_env.Item("eINCLUDE_DIR"))
   'm_exclude_dir  = trim(g_env.Item("eEXCLUDE_DIR"))

    m_include_file = trim(g_env.Item("eINCLUDE_FILE"))
    m_exclude_file = trim(g_env.Item("eEXCLUDE_FILE"))
    if m_include_file = empty then
      m_include_file = "*.md"
    end if

    m_include_scan = trimList(m_include_scan)
    m_exclude_scan = trimList(m_exclude_scan)

   'm_include_dir  = trimList(m_include_dir)
   'm_exclude_dir  = trimList(m_exclude_dir)
    m_exclude_dir  = "*"

    m_include_file = trimList(m_include_file)
    m_exclude_file = trimList(m_exclude_file)
  end sub 

  private sub Class_Initialize()
    reset
  end sub
end class

'---------------------------------------------------------[sources/image.vbs]---

'--- local/hybrids                                       [dev/badgen][image.vbs]
'[2025-01-15][19:00:00] 001 Kartonagnick PRE

function makeImage(txt)
  dim front, yy, mo, dd, hh, mm, ss, back
  dim pos, expand, matches
  dim dat, tim, url

  makeImage = true
  if not gREGEXP2.test(txt) then 
    exit function
  end if

  set matches = gREGEXP2.Execute(txt)
  if matches.Count < 1 then
    exit function
  end if

  set expand = matches.Item(0).Submatches
  front = expand.Item(0)
  yy = expand.Item(1): mo = expand.Item(2): dd = expand.Item(3)
  hh = expand.Item(4): mm = expand.Item(5): ss = expand.Item(6)
  back = expand.Item(7)

  dat = yy & "-" & mo & "-" & dd 
  tim = hh & ":" & mm & ":" & ss 
  txt = front & "![" & dat & " " & tim & "]" & back
end function

'--------------------------------------------------------[sources/badgen.vbs]---

'--- local/hybrids                                      [dev/badgen][badgen.vbs]
'[2025-01-15][19:00:00] 001 Kartonagnick PRE

function makeBadgen(txt)
  dim yy, mo, dd, hh, mm, ss
  dim pos, expand, matches
  dim dat, tim, url

  makeBadgen = true

  pos = instr(1, txt, "https://img.shields.io/static/v1?label", 0)
  if pos < 1 then
    makeBadgen = makeImage(txt)
    exit function
  end if

  if not gREGEXP.test(txt) then 
    exit function
  end if

  set matches = gREGEXP.Execute(txt)
  if matches.Count < 1 then
    exit function
  end if

  set expand = matches.Item(0).Submatches
  yy = expand.Item(0): mo = expand.Item(1): dd = expand.Item(2)
  hh = expand.Item(3): mm = expand.Item(4): ss = expand.Item(5)

  dat = yy & "-" & mo & "-" & dd 
  tim = hh & ":" & mm & ":" & ss 
  url = "https://badgen.net/static/v1/" & tim & "/orange?label=" & dat
  txt = "[" & dat & " " & tim & "]: " & url
end function 

'-------------------------------------------------------[sources/shields.vbs]---

'--- local/hybrids                                     [dev/badgen][shields.vbs]
'[2025-01-15][19:00:00] 001 Kartonagnick PRE

function makeShields(txt)
  dim yy, mo, dd, hh, mm, ss
  dim pos, expand, matches
  dim dat, tim, url

  makeShields = true

  pos = instr(1, txt, "https://badgen.net/static/", 0)
  if pos < 1 then
    makeShields = makeImage(txt)
    exit function
  end if

  if not gREGEXP.test(txt) then 
    exit function
  end if

  set matches = gREGEXP.Execute(txt)
  if matches.Count < 1 then
    exit function
  end if

  set expand = matches.Item(0).Submatches
  yy = expand.Item(0): mo = expand.Item(1): dd = expand.Item(2)
  hh = expand.Item(3): mm = expand.Item(4): ss = expand.Item(5)

  dat = yy & "-" & mo & "-" & dd 
  tim = hh & ":" & mm & ":" & ss 
  url = "https://img.shields.io/static/v1?label=" & dat & "&message=" & tim & "&color=yellowgreen"
  txt = "[" & dat & " " & tim & "]: " & url
end function 

'----------------------------------------------------------[sources/main.vbs]---

'--- local/hybrids                                        [dev/badgen][main.vbs]
'[2025-01-15][19:00:00] 001 Kartonagnick PRE

dim gSetup, gREGEXP, gREGEXP2

sub initial()
  set gSetup   = new CSettings
  set gREGEXP = new RegExp
  with gREGEXP
    'example text: [2025-01m-01 12:26:41]
    .Pattern    = "\[(\d{4})-(\d{2})m?-(\d{2}) (\d{2}):(\d{2}):(\d{2})\]"
    .IgnoreCase = true
    .Global     = false
    .Multiline  = false
  end with

  set gREGEXP2 = new RegExp
  with gREGEXP2
    'example text: [![2025-01m-10 23:06:16]][H] ololo
    .Pattern    = "(.*)!\[(\d{4})-(\d{2})m?-(\d{2}) (\d{2}):(\d{2}):(\d{2})\](.*)"
    .IgnoreCase = true
    .Global     = false
    .Multiline  = false
  end with
end sub

sub main()
  dim mark, files, f, loader, content, method
  echo 0, "beg: " & datestamp()

  set mark = new Elapsed

  initial

  gSetup.showDebug 1
  if gSetup.style = "shields" then
    method = "makeShields"
  else
    method = "makeBadgen"
  end if

  set files = gSetup.files(1)
  set loader = new FileContent
  for each f in files
    echo 1, "process: " & f
    set content = loader.load(f, method)
    loader.saveEndl f, content
  next

  echo 0, "end: " & datestamp() 
  echo 0, "elapsed: " & mark.value()
end sub

main()

'===============================================================================
'===============================================================================

:'checkParent
::'  if errorlevel 1 (echo [ERROR] was broken at launch & exit /b 1)
::'  if defined eDIR_OWNER (exit /b)
::'  cls & call :'normalizeD eDIR_OWNER "%~dp0."
::'exit /b
:'normalizeD
rem^  set "%~1=%~dpfn2"
::'exit /b
