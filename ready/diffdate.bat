::'@echo off & call :'checkParent || exit /b 1
::'set "xDEBUG=ON"
::'set "eBEG_DATE=2026-01-28 10:00:00"
::'set "eEND_DATE=2026-01-28 12:01:02"
::'cscript //nologo //e:vbscript "%~f0" %*
::'exit /b

'--- local/hybrids                                        [script][diffdate.bat]
'[2026-01-28][15:40:00] 001 Kartonagnick PRE
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

'-----------------------------------------------------------[vbs/padding.vbs]---

'--- local/hybrids                                                 [padding.vbs]
'[2024-02-20][22:50:00] 002 Kartonagnick    
'  --- CastleOfDreams\hybrids                                      [padding.vbs]
'  [2022-01-26][19:00:00] 002 Kartonagnick
'  [2021-12-23][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams\vbs                                        [padding.vbs]
'    [2021y-01m-30d][19:00:00] 001 Kartonagnick

function padding(text, count, symbol)

  if count < 0 then
    WScript.Echo "[ERROR][ASSERT] padding: text: '" & text & "'"
    WScript.Echo "[ERROR][ASSERT] padding: count: '" & count & "'"
    WScript.Echo "[ERROR][ASSERT] padding: 'count' can not be < 0" 
    WScript.Quit 1
  end if

  if count > 20 then
    WScript.Echo "[ERROR][ASSERT] padding: text: '" & text & "'"
    WScript.Echo "[ERROR][ASSERT] padding: count: '" & count & "'"
    WScript.Echo "[ERROR][ASSERT] padding: 'count' can not be > 20" 
    WScript.Quit 1
  end if

  if len(symbol) > 1 then
    WScript.Echo "[ERROR][ASSERT] padding: text: '" & text & "'"
    WScript.Echo "[ERROR][ASSERT] padding: symbol: '" & symbol & "'"
    WScript.Echo "[ERROR][ASSERT] padding: len(symbol) must be = 1"
    WScript.Quit 1
  end if

  dim len_text: len_text = len(text)
  if len_text >= count then
    padding = "" & text
  else
    dim pd: pd = string(count - len_text, symbol)
    padding = pd & text
  end if  

end function

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

'-----------------------------------------------------------[vbs/numeric.vbs]---

'--- local/hybrids                                                 [numeric.vbs]
'[2024-07-24][19:00:00] 001 Kartonagnick    
'
'
' functions:
'   function toNumeric(v)
'   function toDouble(v)

' if v: String -> correct point or comma
' if v: Nothing, Empty, Null -> 0
' if v: Bool -> 1 or 0
function toNumeric(v)
  if vartype(v) = vbBoolean then
    if(v) then toNumeric = 1 else toNumeric = 0
  elseif IsNumeric(v) then
    toNumeric = v
  elseif IsObject(v) then
    if v is nothing then
      toNumeric = 0
    else
      assertNumeric "unexpected object: '" & typename(v) & "'"
    end if
  elseif isArray(v) then
    assertNumeric "unexpected type: 'Array'"
  elseif IsNull(v) or v = Empty then
    toNumeric = 0
  elseif vartype(v) = vbString then
    dim txt: txt = replace(v, ".", ",")
    if IsNumeric(txt) then
      toNumeric = txt
    else
      txt = replace(v, ",", ".")
      if IsNumeric(txt) then
        toNumeric = txt
      else
        dim errorInvalidText: errorInvalidText = vbObjectError + 12
        dim reason: reason = "invalid string: '" & v & "'"
        err.Raise errorInvalidText, "toNumeric", reason
      end if
    end if
  else
    assertNumeric "unexpected type: '" & typename(v) & "'"
  end if
end function

function toDouble(v)
  toDouble = Cdbl(toNumeric(v))
end function

sub assertNumeric(desc)
  WScript.Echo "[ERROR][ASSERT] toNumeric: " & desc
  WScript.Quit 1
end sub

'------------------------------------------------------------[date/value.vbs]---

'--- local/hybrids                                              [date/value.vbs]
'[2024-08-01][19:00:00] 002 Kartonagnick    
'  --- CastleOfDreams/hybrids                                   [date/value.vbs]
'   [2022-03-06][19:00:00] 001 Kartonagnick
'      --- CastleOfDreams/vbs                                   [date/value.vbs]
'     [2021-09-06][19:00:00] 007 Kartonagnick
'     [2021-09-03][18:00:00] 006 Kartonagnick
'     [2021-08-31][18:00:00] 005 Kartonagnick
'     [2021-08-30][18:00:00] 004 Kartonagnick
'     [2021-08-29][18:00:00] 003 Kartonagnick
'     [2021-08-22][18:00:00] 002 Kartonagnick
'     [2021-08-18][18:00:00] 001 Kartonagnick

'
' class DTSValue
'     datetime     : DTStamp, DTSValue, Date, Numeric, String
'     milliseconds : Numeric, Nothing, Null, Empty
'   public default function init(datetime, milliseconds)
'
'   property Set date(v)       'DTStamp, DTSValue
'   property Let date(v)       'Date, Numeric, String
'   property Let ms(v)         'Numeric, String
'   property Let posix(sec)    'Numeric : seconds since the epoch
'
'   property Get posix()       'Int     : seconds since the epoch
'   property Get date()        'Date    : date
'   property Get ms()          'String  : milliseconds
'   property Get hh()          'String  : hours
'   property Get mm()          'String  : minuts
'   property Get ss()          'String  : seconds
'   property Get yy()          'String  : years
'   property Get mo()          'String  : months
'   property Get dd()          'String  : days
'   property Get timeOnly()    'String  : 23:19:55
'   property Get timeStamp()   'String  : 23:19:55.123
'   property Get dateStamp()   'String  : 2024-08-09
'   property Get logsStamp()   'String  : [2024-08-09][23:19:55.123]
'   property Get fileStamp()   'String  : [2024-08m-09][23h-19m]
'
'   sub addSeconds(v)          'Numeric, String, Nothing, Null, Empty 
'   sub addMilliseconds(v)     'Numeric, String, Nothing, Null, Empty 
'   sub now()                  'Data-Time-milliseconds
'   function clone             'DTSValue : deep copy

class DTSValue

  private m_date  'Date: date + time
  private m_ms    'Int : milliseconds from begin of day

 'datetime: DTStamp, DTSValue, Date, Numeric, String
 'milliseconds: Numeric, String, Nothing, Null, Empty 
  public default function init(dt_val, ms_val)
    date = dt_val: ms = ms_val: set init = me
  end function

 'DTStamp, DTSValue, Date, Numeric, String
  property Let date(v) parseDate v end property
  property Set date(v) parseDate v end property

 'Numeric, String, Nothing, Null, Empty 
  property Let ms(v) 
    if IsNull(v) or vartype(v) = vbEmpty then
      exit property
    elseif IsObject(v) then
      if v is nothing then exit property
    end if
    m_ms = 0: addMilliseconds(v)
  end property

  property Get date() date = m_date end property
  property Get ms() ms = padding(m_ms, 3, "0")           end property
  property Get hh() hh = padding(Hour  (m_date), 2, "0") end property
  property Get mm() mm = padding(Minute(m_date), 2, "0") end property
  property Get ss() ss = padding(Second(m_date), 2, "0") end property
  property Get yy() yy = padding(Year  (m_date), 2, "0") end property
  property Get mo() mo = padding(Month (m_date), 2, "0") end property
  property Get dd() dd = padding(Day   (m_date), 2, "0") end property

  property Get timeOnly() 'String: 23:19:55
    timeOnly = hh() & ":" & mm() & ":" & ss()
  end property

  property Get timeStamp() 'String: 23:19:55.123
    timeStamp = timeOnly & "." & ms()
  end property

  property Get dateStamp() 'String: 2024-08-09
    dateStamp = yy() & "-" & mo() & "-" & dd() 
  end property

  property Get logsStamp() 'String: [2024-08-09][23:19:55.123]
    logsStamp = "[" & dateStamp & "][" & timeStamp & "]"
  end property

  property Get fileStamp() 'String: [2024-08m-09][23h-19m]
    dim ymd: ymd = yy() & "-" & mo() & "m-" & dd() 
    dim tim: tim = hh() & "h-" & mm() & "m"
    fileStamp = "[" & ymd & "][" & tim & "]"
  end property

  property Get posix() 'Int
    dim from: from = #1970-01-01 00:00:00#
    posix = DateDiff("s", from, m_date)
  end property

  property Let posix(v) 'Numeric
    if vartype(v) = vbBoolean then
      exitByAssert "DTSValue.posix", "unexpected type: 'Boolean'"  
    end if
    dim from: from = #1970-01-01 00:00:00#
    dim sec: sec = CLng(toNumeric(v)): m_ms = 0
    m_date = DateAdd("s", sec, from)
  end property

  sub addSeconds(v) 'Numeric, String, Null, Nothing, Empty
    if vartype(v) = vbBoolean then
      exitByAssert "DTSValue.addSeconds", "unexpected type: 'Boolean'"  
    end if
    dim sec: sec = CLng(toNumeric(v))
    m_date = DateAdd("s", sec, m_date)
  end sub

  sub addMilliseconds(v) 'Numeric, String, Null, Nothing, Empty
    if vartype(v) = vbBoolean then
      exitByAssert "DTSValue.addMilliseconds", "unexpected type: 'Boolean'"  
    end if
    dim total: total = CLng(toNumeric(v))
    if total = 0 then exit sub
    total = total + m_ms
    m_ms = total Mod 1000
    dim secs: secs = fix(total / 1000)
    if total < 0 then
      m_ms = 1000 + m_ms
      secs = secs - 1
    end if
    m_date = DateAdd("s", secs, m_date)
  end sub

  sub now()
    dim sec: sec = timer()
    assert "now", "assert(t < 86400): t = " & sec, sec < 86400
    m_date = curDate__hj32h423jh4j23h()
    m_date = DateAdd("s", sec, m_date)
    m_ms = int((sec - int(sec)) * 1000 + 0.5)    
  end sub

  function clone
    set clone = (new DTSValue)(m_date, m_ms)
  end function

'---[PRIVATE]-------------------------

  private sub parseDate(v) 'DTStamp, DTSValue, Date, Numeric, String
    dim tn: tn = typename(v)
    dim vt: vt = vartype(v)
    if vt = vbBoolean then
      exitByAssert "DTSValue.parseDate", "unexpected type: 'Boolean'"  
    elseif vt = vbDate then
      m_date = v: m_ms = 0
    elseif tn = "DTSValue" then
      m_date = v.date: m_ms = v.ms
    elseif tn = "DTStamp" then
      m_date = v.date: m_ms = v.ms
    elseif isNumeric(v) then
      posix = v: m_ms = 0
    elseif vt = vbString then
      fromString v
    elseif isArray(v) then
      exitByAssert "DTSValue.parseDate", "unexpected type: 'Array'"
    elseif isObject(v) then
      exitByAssert "DTSValue.parseDate", "unexpected object: '" & tn & "'"  
    else
      exitByAssert "DTSValue.parseDate", "unexpected type: '" & tn & "'"  
    end if
  end sub

  private sub fromString(text) 'String
    dim v: v = trim(text)

    if v = Empty then
      defValues: exit sub
    end if

    adjustParse v 
    if v = Empty then exit sub

    g_regexp.Global = false

    dim YY_val: YY_val = 0
    dim MO_val: MO_val = 0
    dim DD_val: DD_val = 0

    dim hh_val: hh_val = 0
    dim mm_val: mm_val = 0
    dim ss_val: ss_val = 0
    dim ms_val: ms_val = 0

    extractMS1  v, ms_val
    extractMS2  v, ms_val
    extractTIME v, hh_val, mm_val, ss_val
    extractDATE v, YY_val, MO_val, DD_val

    v = trim(v)
    if v <> Empty then
      throwException "fromString", "invalid string: '"& text & "'", errorInvalidText
    end if

    if YY_val = 0 and MO_val = 0 and DD_val = 0 then
      YY_val = Year(m_date)
      MO_val = Month(m_date)
      DD_val = Day(m_date)
    end if

    dim oDate: oDate = dateSerial(YY_val, MO_val, DD_val)
    dim oTime: oTime = timeserial(hh_val, mm_val, ss_val)
    m_date = oDate + oTime
    m_ms = ms_val
  end sub

  private sub adjustParse(v) 
   'example: 2021y-08m-25d -> 2021-08-25
    v = trim(v): v = Replace(v, "  ", "")
    g_regexp.Global = false
    g_regexp.Pattern = "(\d{4})y": v = g_regexp.replace(v, "$1")
    g_regexp.Pattern = "(\d{2})m": v = g_regexp.replace(v, "$1")
    g_regexp.Pattern = "(\d{2})d": v = g_regexp.replace(v, "$1")
  end sub

  private sub extractMS1(v, ms_dst) 
    g_regexp.Pattern = "\d{2}:\d{2}:\d{2}\.(\d{3})"
    if g_regexp.Test(v) then
      dim smth: set smth = g_regexp.Execute(v).Item(0).Submatches
      ms_dst = smth.Item(0)
      g_regexp.Pattern = "\.\d{3}"
      v = g_regexp.Replace(v, "")
    end if
  end sub

  private sub extractMS2(v, ms_dst) 
    g_regexp.Pattern = "\s.(\d{3})"
    if g_regexp.Test(v) then
      dim smth: set smth = g_regexp.Execute(v).Item(0).Submatches
      ms_dst = smth.Item(0)
      v = g_regexp.Replace(v, "")
    end if
  end sub

  private sub extractTIME(v, hh_val, mm_val, ss_val) 
    g_regexp.Pattern = "(\d{2}):(\d{2}):(\d{2})"
    if g_regexp.Test(v) then
      dim smth: set smth = g_regexp.Execute(v).Item(0).Submatches
      hh_val = setValue(smth.Item(0), 0, 23, "hh")
      mm_val = setValue(smth.Item(1), 0, 59, "mm")
      ss_val = setValue(smth.Item(2), 0, 59, "ss")
      v = g_regexp.Replace(v, "")
    end if
  end sub

  private sub extractDATE(v, YY_val, MO_val, DD_val) 
    g_regexp.Pattern = "(\d{4})-(\d{2})-(\d{2})"
    if g_regexp.Test(v) then
      dim smth: set smth = g_regexp.Execute(v).Item(0).Submatches
      YY_val = setValue(smth.Item(0), 1000, 9999, "YY")
      MO_val = setValue(smth.Item(1),    1,   12, "MM")
      DD_val = setValue(smth.Item(2),    1,   31, "DD")
      v = g_regexp.Replace(v, "")
    end if
  end sub

  private function setValue(v, minvalue, maxvalue, descript)
    setValue = CLng(v)
    checkRange setValue, minvalue, maxvalue, descript
  end function

  private sub checkRange(v, min, max, token)
    dim reason
    if v > max then
      reason = "token '" & token & "' out range: " & v & " (max: " & max & ")"
      throwException "checkRange", reason, errorOutRange
    end if
    if v < min then
      reason = "token '" & token & "' out range: " & v & " (min: " & min & ")"
      throwException "checkRange", reason, errorOutRange
    end if
  end sub

  private sub throwException(from, reason, err_code)
    err.Raise err_code, "DTSValue." & from, reason
  end sub

  private sub defValues()  
    now
  end sub

  private sub Class_Initialize()
    defValues
  end sub
end class

function curDate__hj32h423jh4j23h
  curDate__hj32h423jh4j23h = date()
end function

'---------------------------------------------------------[date/duration.vbs]---

'--- local/hybrids                                           [date/duration.vbs]
'[2024-09-20][19:00:00] 002 Kartonagnick    
'  --- CastleOfDreams/vbs                                    [date/duration.vbs]
'  [2021-09-06][19:00:00] 002 Kartonagnick
'  [2021-09-04][18:00:00] 001 Kartonagnick

function durationFrom(ms, sec, min, hours, byval days)
  dim years, result

  years  = days / 365
  days   = days mod 365
  result = ""   

  if(years = 1) then
    result = ", 1 year"
  elseif(years > 1) Then
    result = ", " & years & " years"
  end if

  if(days = 1) then
    result = result & ", 1 day"
  elseif(days > 1) then
    result = result & ", " & days & " days"
  end if

  if(hours = 1) then
    result = result & ", 1 hour"
  elseif(hours > 1) then
    result = result & ", " & hours & " hours"
  end if

  if(min <> 0) then
    result = result & ", " & min & " min"
  end if

  if(sec <> 0) then
    result = result & ", " & sec & " sec"
  end if

  if(ms <> 0) then
   result = result & ", " & ms & " ms"
  end if

  if(result <> "") then
    result = right(result, len(result) - 2)
  end if

  durationFrom = result
end function

function durationFromSeconds(seconds)
  dim v, s, m, h, d
  v = int(seconds / 60)
  s = seconds     mod 60
  m =     v       mod 60
  h = int(v / 60) mod 24
  d = int(v / 60 / 24)
  durationFromSeconds = durationFrom(0, s, m, h, d)
  if(durationFromSeconds = Empty) then
    durationFromSeconds = "0 sec"
  end if
end function

function durationFromMS(milliseconds)
  dim v, ms, s, m, h, d
  v = int(milliseconds / 1000)
  ms = milliseconds mod 1000
  s  =     v            mod 60
  m  = int(v / 60)      mod 60
  h  = int(v / 60 / 60) mod 24
  d  = int(v / 60 / 60 / 24)
  durationFromMS = durationFrom(ms, s, m, h, d)
  if(durationFromMS = Empty) then
    durationFromMS = "0 ms"
  end if
end function

'------------------------------------------------------[sources/diffdate.vbs]---

'--- local/hybrids                                       [sources][diffdate.vbs]
'[2026-01-28][15:40:00] 001 Kartonagnick PRE


'...............................................................................

sub main()
  dim d_txt, b_txt, e_txt 
  dim d_obj, b_obj, e_obj
  dim b_sec, e_sec
  dim allow_negative
  dim diff, result

  set d_obj = new DTSValue
  d_txt = d_obj.dateStamp  & " " &  d_obj.timeOnly

  b_txt = fromEnvironment("eBEG_DATE" , d_txt)
  e_txt = fromEnvironment("eEND_DATE" , d_txt)
  allow_negative = fromEnvironment("eALLOW_NEGATIVE", "")

  set b_obj = (new DTSValue)(b_txt, nothing)
  set e_obj = (new DTSValue)(e_txt, nothing)

  b_sec = b_obj.posix
  e_sec = e_obj.posix

  if b_sec <= e_sec then
    diff = e_sec - b_sec
    result = ""
  elseif allow_negative then
    diff = b_sec - e_sec
    result = "- "
  else
    exitByAssert "main", "beg_date must be <= end_date"  
  end if

  result = result & durationFromSeconds(diff)

  dbg 1, "beg: " & b_obj.logsStamp() 
  dbg 1, "end: " & e_obj.logsStamp()

  if gDEBUG then 
    echo 1, "duration: " &  result
  else
    echo 0, result
  end if

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
