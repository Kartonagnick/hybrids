
'--- local/hybrids                                             [date/export.vbs]
'[2024-09-03][19:00:00] 005 Kartonagnick PRE
'  --- CastleOfDreams/vbs                                      [date/export.vbs]
'  [2021y-09m-06d][19:00:00] 004 Kartonagnick
'  [2021y-08m-27d][18:00:00] 003 Kartonagnick
'  [2021y-08m-24d][18:00:00] 002 Kartonagnick
'  [2021y-08m-20d][18:00:00] 001 Kartonagnick
'
' includeVBS("../assert.vbs")
' includeVBS("value.vbs")

class DTSExport

 'default: "YY-MM-DD hh:mm:ss.ms"
  private m_format 'String (format-string)

 'DTSExport, String, Null, Nothing, Empty
  public default function init(v) 
    me.format = v
    set init = me
  end function

 'DTSExport, String, Nothing, Null, Empty
  property Let format(v) input(v) end property 'String
  property Set format(v) input(v) end property 'Object
  property Get format() format = m_format end property

 'out: String
 'in: Date, Numeric, DTSValue, DTStamp
  function stamp(dt) 
    dim dtv, v, n: n = typename(dt)
    if n = "DTSValue" or n = "DTStamp" then
      v = m_format
      v = Replace(v, "YY" , Right("00" & dt.YY, 4))
      v = Replace(v, "MM" , Right("00" & dt.MO, 2))
      v = Replace(v, "DD" , Right("00" & dt.DD, 2))
      v = Replace(v, "hh" , Right("00" & dt.hh, 2))
      v = Replace(v, "mm" , Right("00" & dt.mm, 2))
      v = Replace(v, "ss" , Right("00" & dt.ss, 2))
      v = Replace(v, "ms" , Right("00" & dt.ms, 3))
      stamp = v
    else
      set dtv = (new DTSValue)(dt, nothing)
      stamp = stamp(dtv)
    end if
  end function

  function clone
    set clone = (new DTSExport)(m_format)
  end function

'---[PRIVATE]-------------------------
  private sub input(v)
    if isArray(v) then
      exitByAssert "DTSExport.input", "unexpected type: 'Array'"
    elseif IsObject(v) then
      if v is nothing then
        defValues()
      elseif typename(v) = "DTSExport" then
        m_format = v.format
      else
        exitByAssert "DTSExport.input", "unexpected object: '" & typename(v) & "'"
      end if
    elseif isNull(v) then
      defValues()
    elseif v = Empty then
      defValues()
    elseif vartype(v) = vbString then
      setFromString v
    else
      exitByAssert "DTSExport.input", "unexpected type: '" & typename(v) & "'"
    end if
  end sub

  private sub adjust(v)
    g_regexp.Global = true
    g_regexp.Pattern = "\bTIME\b": v = g_regexp.replace(v, "hh:mm:ss")
    g_regexp.Pattern = "\bhms\b" : v = g_regexp.replace(v, "hh:mm:ss")
    g_regexp.Pattern = "\bTT\b"  : v = g_regexp.replace(v, "hh:mm:ss.ms")
    m_format = v    
  end sub

  private sub setFromString(text)
    dim v: v = trim(text)
    if v = Empty then
      defValues()
    else 
      adjust v
    end if
  end sub

  private sub defValues()
    m_format = "YY-MM-DD hh:mm:ss.ms"
  end sub

  private sub Class_Initialize()
    defValues()
  end sub
end class
