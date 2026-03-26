::'@echo off & call :'checkParent || exit /b 1
::'set "xDEBUG=ON"
::'set "eLOG.FLUSH=ON"
::'set "eLOG.APPEND=OFF"
::'set "xLOG.SYSTEM_LOCALE"
::'cscript //nologo //e:vbscript "%~f0" %*
::'exit /b

'--- local/hybrids                                         [script][eolcode.bat]
'[2026-03-26][19:20:00] 001 Kartonagnick    
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

'-----------------------------------------------------------[vbs/logging.vbs]---

'--- local/hybrids                                                 [logging.vbs]
'[2026-01-29][19:30:00] 001 Kartonagnick    
'  based on the story:
'  --- local/entrepot                                   [bat/work/03-rename.bat]
'  [2025-10-23][05:10:00] 013 Kartonagnick
'  [2024-12-06][13:40:00] 012 Kartonagnick
'  [2024-11-24][04:20:00] 011 Kartonagnick
'  [2024-01-03][21:10:00] 010 Kartonagnick
'  [2023-12-26][14:00:00] 009 Kartonagnick
'  [2023-12-18][05:30:00] 008 Kartonagnick
'  [2023-10-13][21:30:00] 007 Kartonagnick
'  [2023-10-05][07:00:00] 006 Kartonagnick
'    --- media/bat                                               [03-rename.bat]
'    [2023-09-04][00:41:42] 005 Kartonagnick
'    [2023-08-04][08:29:30] 004 Kartonagnick
'    [2023-07-13][01:01:59] 003 Kartonagnick
'    [2021-12-08][19:00:00] 002 Kartonagnick
'    [2021-12-07][11:00:00] 002 Kartonagnick
'

class CFileLogger

  private TRISTATE_USE_DEFAULT
  private FOR_APPENDING
  private RECREATE

  private m_stream
  private m_flush
  private m_utf8
  private m_path

  property Get path() path = m_path end property

  sub echo(deep, msg)
    dim text: text = indent(deep) & msg  
    WScript.Echo text

    if m_stream is nothing then exit sub
    if m_utf8 then 
      dim i, ch
      for i = 1 to len(text)
        ch = Mid(text, i, 1)
        ch = ascW(ch)
        ch = utf8(ch)
        m_stream.Write ch
      next
      m_stream.WriteLine ""
   else
     m_stream.WriteLine text
   end if 
  end sub

  function utf8(ByVal c)
    dim b1, b2, b3
    if c < 128 then
      utf8 = chr(c)
    elseif c < 2048 then
      b1 = c mod 64
      b2 = (c - b1) / 64
      utf8 = chr(&hc0 + b2) & chr(&h80 + b1)
    elseif c < 65536 then
      b1 = c mod 64
      b2 = ((c - b1) / 64) mod 64
      b3 = (c - b1 - (64 * b2)) / 4096
      utf8 = chr(&he0 + b3) & chr(&h80 + b2) & chr(&h80 + b1)
    else
      WScript.Echo "fuck: "  & typename(c)
    end if
  end function

  sub close
    m_stream.close
    set m_stream = nothing 
  end sub

'---[PRIVATE]-------------------------

  private sub Class_Initialize()

    TRISTATE_USE_DEFAULT = -2 ' Use system default encoding
    FOR_APPENDING = 8
    RECREATE = true

    m_utf8 = g_env.Item("eLOG.SYSTEM_LOCALE")
    if m_utf8 = "ON" or m_flush = "1" then
      m_utf8 = false
    else 
      m_utf8 = true
    end if

    m_flush = g_env.Item("eLOG.FLUSH")
    if m_flush = "ON" or m_flush = "1" then
      m_flush = true
    else 
      m_flush = false
    end if

    m_path = g_env.Item("eLOG.PATH")
    if m_path = empty then 
      dim fname: fname = g_fso.GetBaseName(WScript.ScriptFullName) 
      m_path = fname & ".log"
    end if

    dim app: app = g_env.Item("eLOG.APPEND")
    if app = "ON" or app = "1" then
      'nothing
    else
      if g_fso.FileExists(m_path) Then
        g_fso.DeleteFile m_path
      end if
    end if

    set m_stream = g_fso.OpenTextFile(m_path, FOR_APPENDING, RECREATE, TRISTATE_USE_DEFAULT)
  end sub

  private sub Class_Terminate()
    if m_stream is nothing then exit sub
    m_stream.Close
  end sub

end class

dim g_logg: set g_logg = new CFileLogger

sub echo(deep, msg)
  if gSILENCE then exit sub
  g_logg.echo deep, msg
end sub
        
sub dbg(deep, msg)
  if not gDEBUG then exit sub
  g_logg.echo deep, msg
end sub 

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

'-----------------------------------------------------------[vbs/errCode.vbs]---

'--- local/hybrids                                                 [errCode.vbs]
'[2024-02-19][15:00:00] 002 Kartonagnick    
'  --- CastleOfDreams\hybrids                                      [errcode.vbs]
'  [2022-02-22][19:00:00] 002 Kartonagnick
'  [2021-12-26][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams\vbs                                        [errcode.vbs]
'    [2021-08-15][15:00:00] 001 Kartonagnick

' functions:
'   function errorString(code)

dim errorAssertFailed    : errorAssertFailed    = vbObjectError + 1
dim errorTestFailed      : errorTestFailed      = vbObjectError + 2
dim errorFuncFailed      : errorFuncFailed      = vbObjectError + 3
dim errorExecFailed      : errorExecFailed      = vbObjectError + 4
dim errorInvalidTag      : errorInvalidTag      = vbObjectError + 5
dim errorInvalidType     : errorInvalidType     = vbObjectError + 6
dim errorInvalidSize     : errorInvalidSize     = vbObjectError + 7
dim errorInvalidToken    : errorInvalidToken    = vbObjectError + 8
dim errorInvalidOrder    : errorInvalidOrder    = vbObjectError + 9
dim errorInvalidArgument : errorInvalidArgument = vbObjectError + 10
dim errorInvalidSequence : errorInvalidSequence = vbObjectError + 11
dim errorInvalidText     : errorInvalidText     = vbObjectError + 12
dim errorEmptyData       : errorEmptyData       = vbObjectError + 13
dim errorOutRange        : errorOutRange        = vbObjectError + 14
dim errorNotFound        : errorNotFound        = vbObjectError + 15
dim errorNotExists       : errorNotExists       = vbObjectError + 16
dim errorAlreadyExists   : errorAlreadyExists   = vbObjectError + 17
dim errorLogick          : errorLogick          = vbObjectError + 18

dim gERRCODE: set gERRCODE = CreateObject("Scripting.Dictionary")

sub initErrorCodeLibrary()
  gERRCODE.add 0                    , "success"
  gERRCODE.add errorAssertFailed    , "errorAssertFailed"
  gERRCODE.add errorTestFailed      , "errorTestFailed"
  gERRCODE.add errorFuncFailed      , "errorFuncFailed"
  gERRCODE.add errorExecFailed      , "errorExecFailed"
  gERRCODE.add errorInvalidTag      , "errorInvalidTag"
  gERRCODE.add errorInvalidType     , "errorInvalidType"
  gERRCODE.add errorInvalidSize     , "errorInvalidSize"
  gERRCODE.add errorInvalidToken    , "errorInvalidToken"
  gERRCODE.add errorInvalidOrder    , "errorInvalidOrder"
  gERRCODE.add errorInvalidArgument , "errorInvalidArgument"
  gERRCODE.add errorInvalidSequence , "errorInvalidSequence"
  gERRCODE.add errorInvalidText     , "errorInvalidText"
  gERRCODE.add errorEmptyData       , "errorEmptyData"
  gERRCODE.add errorOutRange        , "errorOutRange"
  gERRCODE.add errorNotFound        , "errorNotFound"
  gERRCODE.add errorNotExists       , "errorNotExists"
  gERRCODE.add errorAlreadyExists   , "errorAlreadyExists"
  gERRCODE.add errorLogick          , "errorLogick"
end sub

function errorString(v)
  if not gERRCODE.Exists(v) then
    errorString = "errorUnknown"
  else
    errorString = gERRCODE.item(v)
  end if
end function

initErrorCodeLibrary()

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
  private mHIDE_PARAMS
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

  property Get dirs()    set dirs  = mFOUND_D   end property
  property Get files()   set files = mFOUND_F   end property
  property Let hideSkip(v)   mHIDE_SKIP   = v   end property
  property Let hideScan(v)   mHIDE_SCAN   = v   end property
  property Let hideParams(v) mHIDE_PARAMS = v   end property
  property Let debug(v)      mDEBUG       = v   end property
  property Let once(v)       mONCE        = v   end property

  property Let scanDirs(v) setList mDIRS_START, v end property

  property Let includeS(v) mRegexpS.include = v end property
  property Let excludeS(v) mRegexpS.exclude = v end property
  property Let includeF(v) mRegexpF.include = v end property
  property Let excludeF(v) mRegexpF.exclude = v end property
  property Let includeD(v) mRegexpD.include = v end property
  property Let excludeD(v) mRegexpD.exclude = v end property

  sub useDefault
    mRegexpS.exclude = "_*;.git;.vs"
    mRegexpF.exclude = "_*"
    mRegexpD.exclude = "_*"
    mHIDE_PARAMS = true
    mHIDE_SKIP   = true
    debug = gDEBUG
  end sub  

  sub showParams(deep)
    if mHIDE_PARAMS then exit sub
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
      elseif typename(v) = "Folder" then
         dst.add v.path
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
    mHIDE_PARAMS = false
    mHIDE_SKIP   = false
    mHIDE_SCAN   = false
    mDEBUG       = false

    set mDIRS_START = CreateObject("System.Collections.ArrayList")
    set mFOUND_S    = CreateObject("System.Collections.ArrayList")
    set mFOUND_D    = CreateObject("System.Collections.ArrayList")
    set mFOUND_F    = CreateObject("System.Collections.ArrayList")

    set mRegexpF = new MaskExp
    set mRegexpD = new MaskExp
    set mRegexpS = new MaskExp
  end sub
end class

'-----------------------------------------------------------[vbs/unquote.vbs]---

'--- local/hybrids                                                 [unquote.vbs]
'[2026-01-28][18:10:00] 001 Kartonagnick    

function unquote(str)
  dim quot: quot = """"
  if left(str, 1) & right(str, 1) = quot & quot then 
    unquote = mid(str, 2, len(str) - 2)
  else
    unquote = str
  end if
end function

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

  private m_content        'ArrayList: content of file
  private m_eol            'eol mode: CRLF | LF | CR
  private m_checker_txt    'MaskExp: postfix of text files
  private m_checker_bin    'MaskExp: postfix of binary files

  property get CRLF() CRLF = adCRLF end property
  property get LF()   LF   = adLF   end property

  function detectEOL(path)
    dim limit: limit = 10000
    dim f_stream, content, symbol, pos
    if g_fso.GetFile(path).size = 0 then    
      detectEOL = adCRLF
      exit function
    end if
    set f_stream = g_fso.OpenTextFile(path, FOR_READING)
    content = f_stream.Read(limit)
    if isNull(content) then
      content = ""
    end if
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

  function EOL_to_string(value)
    if value = adLF then
      EOL_to_string = "LF"
    elseif value = adCR then
      EOL_to_string = "CR"
    else
      EOL_to_string = "CRLF"
    end if
  end function

  function string_to_EOL(text)
    dim txt: txt = UCase(text)
    if txt = "LF" then
      string_to_EOL = adLF
    elseif txt = "CR" then
      string_to_EOL = adCR
    else
      string_to_EOL = adCRLF
    end if
  end function

  function checkEOL(path, text_etalon, text_result)
    dim r: r = detectEOL(path)
    dim v: v = string_to_EOL(text_etalon)
    text_result = EOL_to_string(r)
    if v = r then
      checkEOL = true
    else 
      checkEOL = false
    end if
  end function

  function checkValidUtf8(path)
    dim a, r0, r1, r2, r3, r4, s, i, l, ret, n: n = 0
    dim limit: limit = 10000
    dim stream: set stream = CreateObject("ADODB.Stream")
    stream.Type = 1 ' Binary
    stream.Open

    on error resume next 
    stream.LoadFromFile path
    if err.Number <> 0 Then
      WScript.Echo "Error occurred: " & Err.Description & " (Error Number: " & Err.Number & ")"
      err.Clear
      checkValidUtf8 = false
      on error goto 0
      exit function
    end if    

    s = stream.Read(limit)
    stream.Close
    l = LenB(s)
    if isNull(l) then l = 0

    ret = True
    for i = 1 To l
      a = AscB(MidB(s, i, 1))
      r0 = a and &H80
      r1 = a and &HC0
      r2 = a and &HE0
      r3 = a and &HF0
      r4 = a and &HF8
      if n > 0 then
        if r1 = &H80 then
          n = n - 1
        else
          ret = false
        end If
      elseif r4 = &HF8 then
        n = 3
      elseif r3 = &HE0 then
        n = 2
      elseif r2 = &HC0 then
        n = 1
      elseif r0 = 0 then
        n = 0
      end if
    next
    checkValidUtf8 = ret
  end function

  function isTextHeuristic(f_path)
    isTextHeuristic = true
    if isBinaryHeuristic(f_path) then
      isTextHeuristic = false
    end if
  end function   

  function isBinaryHeuristic(f_path)
    dim known 
    isBinaryHeuristic = isBinaryHeuristic2(f_path, known)
  end function   

  function isTextHeuristic2(f_path, known)
    isTextHeuristic2 = true
    if isBinaryHeuristic2(f_path, known) then
      isTextHeuristic2 = false
    end if
  end function   

  function isBinaryHeuristic2(f_path, known)
    dim fname, arr_txt, arr_bin
    fname = g_fso.Getfilename(f_path)
    known = true
    if m_checker_txt.match(fname) then
      isBinaryHeuristic2 = false
    elseif m_checker_bin.match(fname) then
      isBinaryHeuristic2 = true
    else
      known = false
      if isBinaryDetect(f_path) then
        isBinaryHeuristic2 = true
      else
        isBinaryHeuristic2 = false
      end if
    end if
  end function

  function load(path, func)
    dim content: set content = CreateObject("System.Collections.ArrayList")
    if not g_fso.FileExists(path) then
      set load = content
      exit function
    end if

    dim f_stream, line, callback, result, stop_load
    set f_stream = CreateObject("ADODB.Stream")
    m_eol = detectEOL(path)
    with f_stream
      .LineSeparator = m_eol
      .CharSet = "utf-8"
      .Open
      .LoadFromFile(path)
    end with

    stop_load = false: set callback = GetRef(func)
    do while not f_stream.EOS
      line = f_stream.ReadText(READ_LINE)
      result = callback(line, stop_load)
      if vartype(result) = vbEmpty then
        content.add line
      elseif result then
        content.add line
      end if
      if stop_load then exit do
    loop
    f_stream.close
    set load = content
  end function 

  sub saveEndl(path, content)
    dim eol, line, utf8
    if m_eol = 0 then
      m_eol = detectEOL(path)
    end if
    eol = getStreamEOL()
    set utf8 = getStreamUTF8()

    for each line in content
      utf8.WriteText(line & eol)
    next
    saveNoBom utf8, path
  end sub

  sub save(path, content)
    dim i, eol, line, utf8

    if m_eol = 0 then
      m_eol = detectEOL(path)
    end if
    eol = getStreamEOL()
    set utf8 = getStreamUTF8()

    if content.count > 0 then
      for i = 0 to content.count - 2
        line = content(i)
        utf8.WriteText(line & eol)
      next
      line = content(content.count - 1)
      utf8.WriteText(line)
    end if
    saveNoBom utf8, path
  end sub

'---[PRIVATE]-------------------------

  private function getStreamUTF8()
    dim utf8: set utf8 = CreateObject("ADODB.Stream")
    with utf8
      .LineSeparator = m_eol
      .CharSet = "utf-8"
      .Type = TYPE_TXT
      .Open
    end with
    set getStreamUTF8 = utf8
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
    no_bom.LineSeparator = m_eol
    no_bom.Type = TYPE_BIN
    no_bom.Open
    utf8.CopyTo no_bom
    no_bom.SaveToFile path, CREATE_OVERWRITE
    no_bom.close
    utf8.close
  end sub

  private function isBinaryDetect(f_path)
    dim reader, line, count, i, s 
    set reader = g_fso.OpenTextFile(f_path, 1)
    do while not reader.AtEndOfStream
      line  = reader.Readline
      count = len(line)
      for i = 1 to count
        s = Mid(line, i, 1)
        if Asc(s) = 0 then 
          isBinaryDetect = true
          exit function
        end if
      next
    loop
    reader.Close
    isBinaryDetect = false 
  end function

  private sub apply_mask(txt)
    dim res, el, arr: arr = Split(txt, ";", -1, 0)
    txt = ""
    for each el in arr
      el = trim(el) 
      if el <> empty then
        txt = txt & "; *." & el
      end if
    next
    dim length: length = len(txt)
    if length > 0 then
      txt = right(txt, length - 1)
    end if
  end sub

  private sub Class_Initialize()

    dim txt, bin

    txt = "cpp; hpp; h; c; cxx; hxx; " & _
      "bat; cmd; vbs; wsf; sh; bash; txt; md; rs; " & _
      "cmake; sln; vcproj; vcxproj; csproj; props; vcxproj.user; vcxproj.filters; rc; natvis; def; " & _
      "html; httml; graphml; cs; css; json; xml; yml; yaml; svg; " & _
      "asm; swift; js; kt; go; lua; java; php; py; dart; razor; jnfo; sql"
    apply_mask txt
    txt = txt & "; makefile; CHANGELOG; CREDITS; LICENSE; .gitmodules; .gitignore; project.root"

    bin = "lib; dll; exe; pdb; mod; a; so; o; jpg; png; bmp; gif; mp4; avi; ttf; tar.gz; 7z; zip; tlb; dat"

    apply_mask bin

    set m_checker_txt = (new MaskExp)(txt, "")
    set m_checker_bin = (new MaskExp)(bin, "")

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
    m_eol            = 0
  end sub
end class

'--------------------------------------------------------------[vbs/path.vbs]---

'--- local/hybrids                                                    [path.vbs]
'[2024-02-21][12:30:00] 001 Kartonagnick    
'  --- CastleOfDreams\hybrids                                         [path.vbs]
'  [2022-02-10][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams\vbs                                           [path.vbs]
'    [2021-08-08][19:00:00] 002 Kartonagnick
'    [2021-07-24][20:00:00] 001 Kartonagnick

' functions:
'   isAbsolutePath(path)
'   relativePath(general, target)
'   canonicalPathList(path)
'   canonicalPath(path)

' example:
'   isAbsolutePath("C:\") -----> true
'   isAbsolutePath("C:/") -----> true
'   isAbsolutePath("\path") ---> true
'   isAbsolutePath("\\path") --> true
'   isAbsolutePath("/path") ---> true
'   isAbsolutePath("//path") --> true
'   isAbsolutePath("path") ----> false
'   isAbsolutePath("./path") --> false

function isAbsolutePath(path)
  isAbsolutePath = true
  dim a: a = UCase(Left(path, 1))
  if (a >= "A" and a <= "Z") or (a >= "a" and a <= "z") then 
    dim b: b = UCase(Mid(path, 2, 2))
    if b = ":\" or b = ":/" then 
      exit Function
    end if
  end if
  if a = "\" or a = "/" then exit function
  isAbsolutePath = false
end function

' make normalized Windows`s path:
' 1. convert slash: '/' --> '\'
' 2. remove points.
' example:
'   a/b/../c/d          --> a\c\d
'   a/b/../../c/d       --> c\d
'   a/b/../../../c/d    --> ..\c\d
'   a/b/../../../../c/d --> ..\..\c\d

function canonicalPathList(path)
  dim winpath: dim collect: dim elem

  winpath = Replace(path, "/", "\")
  dim arr: arr = Split(winpath, "\", -1, 0)
  set collect = CreateObject("System.Collections.ArrayList")

  for each elem in arr
    if elem <> Empty and elem <> "." then
      if collect.Count = 0 or elem <> ".." then
        collect.Add(elem)
      else
        dim last: last = collect.Count - 1
        if collect.Item(last) = ".." then 
          collect.Add(elem)
        else
          collect.RemoveAt(last)
        end if
      end if
    end if
  next
  set canonicalPathList = collect
end function

function canonicalPath(path)
  dim lst: set lst = canonicalPathList(path)
  dim arr: arr = lst.toArray
  canonicalPath = Join(arr, "\")
end function

'===============================================================================
'===============================================================================

' this function make relative path:
'   target = general + relative
'   relative = target - general
'
' example:
'   relativePath("a/b", "a/b/c/d") ------------------------> "c\d"
'   relativePath("a/b", "a/b/c/d/../../") -----------------> ""
'   relativePath("a/b", "a/b/c/d/../../f") ----------------> "f"
'   relativePath("a/b/../c", "a/c/f/h") -------------------> "f/h"

'   relativePath("a/b", "a/b/c/d/../../../f") -------------> "..\f"
'   relativePath("a/b", "a/b/c/d/../../../../../f") -------> "..\..\..\f"
'   relativePath("a/b/../c", "a/b/c/d/../../../../../f") --> "..\..\..\f"

'   relativePath("a/c"  , "../f") -------------------------> "..\..\..\f"
'   relativePath("a/c"  , "f") ----------------------------> "..\..\f"
'   relativePath("a/b/c", "a/f") --------------------------> "..\..\f"
'   relativePath("a/b/c", "b/f") --------------------------> "..\..\..\b\f"
               
function relativePath(general, target)

  dim g_list: set g_list = canonicalPathList(general)
  dim t_list: set t_list = canonicalPathList(target)

  if g_list.count = 0 then
    relativePath = relativeA_(t_list)
    exit function
  end if

  if t_list.count = 0 then
    relativePath = relativeA_(g_list)
    exit function
  end if

  dim g_bound: g_bound = g_list.count - 1
  dim t_bound: t_bound = t_list.count - 1
  dim bound: bound = minElementPath_(g_bound, t_bound)

  dim i
  for i = 0 to bound
    if g_list(i) <> t_list(i) then
      exit for
    end if
  next

  if i > bound and bound = t_bound then
    exit function
  end if

  dim l_part: l_part = relativeL_(g_bound - i)
  dim r_part: r_part = relativeR_(i, t_bound, t_list)
  relativePath = l_part & r_part
end function

function minElementPath_(a, b)
  if a > b then
    minElementPath_ = b
  else
    minElementPath_ = a
  end if
end function

function relativeL_(bound)
  dim i
  for i = 0 to bound
    relativeL_ = relativeL_ & "..\"
  next
end function

function relativeR_(beg, bound, collect)
  dim i: dim re: re = ""
  for i = beg to bound
    re = re & collect(i) & "\"
  next
  if len(re) > 0 then
    relativeR_ = left(re, len(re) - 1)
  else 
    relativeR_ = ""
  end if
end function

function relativeA_(collect)
  if collect.count = 0 then
    relativeA_ = ""
    exit function
  end if 
  dim el: dim re: re = ""
  for each el in collect
    re = re & el & "\"
  next
  relativeA_ = left(re, len(re) - 1)
end function

'------------------------------------------------------[sources/settings.vbs]---

'--- local/hybrids                                   [dev/eolcode][settings.vbs]
'[2026-03-26][19:20:00] 001 Kartonagnick    

class CSettings

  private m_name       'string: name of repo
  private m_dir_work   'string: work  directory
  private m_dir_repo   'string: repo  directory
  private m_dir_stash  'string: stash directory

  property get dir_repo()  dir_repo  = m_dir_repo  end property
  property get dir_stash() dir_stash = m_dir_stash end property
  property get name_repo() name_repo = m_name      end property

  sub showDebug(deep)
    if not gDEBUG then exit sub
    echo deep, "settings: " & m_name
    echo deep + 1, "NAME ........ " & m_name
    echo deep + 1, "DIR WORK .... " & m_dir_work
    echo deep + 1, "DIR STASH ... " & m_dir_stash
    echo deep + 1, "DIR REPO .... " & m_dir_repo
  end sub

'---[PRIVATE]-------------------------

  private function initStashD()

    if not g_fso.FolderExists(m_dir_work) then 
      call err.Raise(errorNotFound, "CSettings.initStashD", "directory not exist. check: '" & m_dir_work & "'")
    end if

    dim oFolderFound: set oFolderFound = checkD(g_fso.GetFolder(m_dir_work))
    if oFolderFound is nothing then 
      m_name = g_fso.GetFileName(m_dir_work)
      m_dir_stash = ""
      exit function
    else
      m_dir_stash = oFolderFound.Path
    end if

    m_dir_stash = g_fso.GetAbsolutePathName(m_dir_stash)
    if not g_fso.FolderExists(m_dir_stash) then 
      call err.Raise(errorNotFound, "CSettings.initStashD", "stash not exist. check: '" & m_dir_stash & "'")
    end if
    m_name = g_fso.GetFileName(m_dir_stash)
  end function 

  private function checkD(oFolder)
    if oFolder.IsRootFolder then
      set checkD = nothing
      exit function
    end if
    dim parent:  set parent = oFolder.ParentFolder
    if parent.Name = "_stash" then
      set checkD = oFolder
      exit function
    end if
    set checkD = checkD(parent)
  end function

  private sub initRepoD()

    if m_dir_stash = empty then 
      m_dir_repo = m_dir_work
    else
      m_dir_repo = m_dir_stash & "\..\..\" & m_name
    end if

    m_dir_repo = g_fso.GetAbsolutePathName(m_dir_repo)
    if not g_fso.FolderExists(m_dir_repo) then 
      call err.Raise(errorNotFound, "CSettings.initRepoD", "repo not found. check: '" & m_dir_repo & "'")
    end if
  end sub 

  private sub initWorkD()
    m_dir_work = g_shell.CurrentDirectory
    m_dir_work = g_fso.GetAbsolutePathName(m_dir_work)
    m_dir_work = fromEnvironment("eDIR_WORK", m_dir_work)
  end sub 

  private sub Class_Initialize()
   initWorkD
   initStashD
   initRepoD
  end sub
end class

'-------------------------------------------------------[sources/scanner.vbs]---

'--- local/hybrids                                    [dev/eolcode][scanner.vbs]
'[2026-03-26][19:20:00] 001 Kartonagnick    

class CScanner
  private m_win       'Array: list of extension of typical Windows files
  private m_lin       'Array: list of extension of typical Linux files
  private m_checker   'FileContent: checker
  private m_exclude   'string: mask of excludes directories
  private m_totalD    'UINT: total directories checked
  private m_totalF    'UINT: total files checked

  sub run(deep, d_repo)
    echo deep, "scan: running..."
    m_totalD = 0
    m_totalF = 0
    dim curD: set curD = makeScanD(deep + 1, d_repo)
    nextD deep + 1, curD
    echo deep, "scan: done! (dirs: " & m_totalD & ", files: " & m_totalF & ")"
  end sub

'---[PRIVATE]-------------------------

  private function nextD(deep, scanD)

    m_totalD = m_totalD + scanD.dirs.count
    m_totalF = m_totalF + scanD.files.count

    dim curD, d, f 
    for each f in scanD.files
      checkFile deep, f
    next 

    for each d in scanD.dirs
      dbg deep, "[d] " & d
      set curD = makeScanD(deep, d)
      nextD deep + 1, curD 
    next 

  end function

  private function makeScanD(deep, dir)
    set makeScanD = (new Find_in)(dir)
    makeScanD.excludeS   = "*"
    makeScanD.excludeD   = m_exclude
    makeScanD.excludeF   = "_*"
    makeScanD.hideParams = true
    makeScanD.hideSkip   = true
    makeScanD.run deep
  end function

  private sub checkFile(deep, f)
    dim re, known, fname, i: i = 0
    if gDEBUG then i = 1 

    re = m_checker.isTextHeuristic2(f, known)
    if known then
      dbg deep, "[f] " & f
    else
      echo deep, "[u] " & f
    end if

    if re then
      mustBeUTF8 deep + i, f
      fname = g_fso.GetFilename(f)
      if contain(fname, m_win) then
        checkEOL deep + i, f, "CRLF"
      elseif contain(fname, m_lin) then
        checkEOL deep + i, f, "LF"
      else 
        checkEOL deep + i, f, "LF"
      end if
    end if
  end sub

  private sub mustBeUTF8(deep, path)
    if m_checker.checkValidUtf8(path) then 
      exit sub
    end if
    echo deep, "[WARNING] invalid utf8: " & path
  end sub

  private sub checkEOL(deep, path, etalon)
    dim result
    if m_checker.checkEOL(path, etalon, result) then 
      exit sub
    end if
    echo deep, "[WARNING] invalid eol: " & path & " (must be " & etalon & ", but real is " & result & ")"
  end sub

  function contain(filename, list)
    dim e, e_len, f_len: f_len = len(filename)
    for each e in list
      e_len = len(e)
      if f_len >= e_len Then
        if lcase(right(filename, e_len)) = lcase(e) then
          contain = true
          exit function
        end if
      end if
    next
    contain = false
  end function

  private sub initialize(deep, d_repo) 
  end sub

  private sub Class_Initialize()
    m_exclude = "_*;.git;.vs;temp;output;debug;release;boost"
    m_win = array("bat", "cmd", "vbs", "wsf", "sln", "sln.all", "sln.bld", "user", "vcxproj.filters")
    m_lin = array("sh", "bash")
    set m_checker = new FileContent
  end sub
end class

'-------------------------------------------------------[sources/eolcode.vbs]---

'--- local/hybrids                                    [dev/eolcode][eolcode.vbs]
'[2026-03-26][19:20:00] 001 Kartonagnick    

'...............................................................................

sub main()
  dim deep: deep = 0

  echo deep, "beg: " & datestamp()
  dim mark: set mark = new Elapsed  

  dim setup: set setup = new CSettings
  setup.showDebug deep + 1

  echo deep, "scan..."

  dim scanner: set scanner = new CScanner
  scanner.run deep + 1, setup.dir_repo

  echo deep, "end: " & datestamp() 
  echo deep, "elapsed: " & mark.value()
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
