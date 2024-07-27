
'--- local/hybrids                                              [date/value.vbs]
'[2024-08-01][19:00:00] 002 Kartonagnick PRE
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

' includeVBS("../numeric.vbs")
' includeVBS("../padding.vbs")
' includeVBS("../errCode.vbs")
' includeVBS("../assert.vbs")
' includeVBS("../glob.vbs")
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
