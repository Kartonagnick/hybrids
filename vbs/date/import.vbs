
'--- local/hybrids                                             [date/import.vbs]
'[2024-08-29][19:00:00] 005 Kartonagnick PRE
'  --- CastleOfDreams/vbs                                      [date/import.vbs]
'  [2021-09-06][19:00:00] 004 Kartonagnick
'  [2021-08-28][18:00:00] 003 Kartonagnick
'  [2021-08-23][18:00:00] 002 Kartonagnick
'  [2021-08-19][18:00:00] 001 Kartonagnick
'
' includeVBS("../numeric.vbs")
' includeVBS("../padding.vbs")
' includeVBS("../errCode.vbs")
' includeVBS("../assert.vbs")
' includeVBS("../glob.vbs")
' includeVBS("value.vbs")

class DTSImport

  private m_dict     'Dictionary (internal work)
  private m_regexp   'RegExp (internal work)
  private m_format   'String (format-string)
  private m_tags     'ArrayList (names of tags: YY;MM;DD;hh;mm;ss;ms)

 'String               -> set format-string 
 'Null, Nothing, Empty -> use default format-string
 'by default           ->  YY-MM-DD hh:mm:ss.ms 
  public default function init(v)
    format = v
    set init = me
  end function

 'DTSImport, String, Null, Nothing, Empty 
  property Let format(v) input(v) end property
  property Set format(v) input(v) end property

 'String
  property Get format() format = m_format end property

 'return: DTSValue
 'text: format-string (example: 2024-08-15 05:43:47.234)
  function parse(text)
    dim src: src = adjustParse(text) 
    if not m_regexp.test(src) then
      dim reason: reason = "invalid sequence: '" & text & "'"
      call err.Raise(errorInvalidText, "DTSImport.parse", reason)
    end if

    makeDict src

    '                            def   min   max
    dim YY: YY = setValue("YY", 1970, 1000, 9999)
    dim MO: MO = setValue("MM",    1,    1,   12)
    dim DD: DD = setValue("DD",    1,    1,   31)
    dim hh: hh = setValue("hh",    0,    0,   23)
    dim mm: mm = setValue("mm",    0,    0,   59) 
    dim ss: ss = setValue("ss",    0,    0,   59)
    dim ms: ms = setValue("ms",    0,    0,  999)
    dim date_object: date_object = dateSerial(YY, MO, DD)
    dim time_serial: time_serial = timeserial(hh, mm, ss)
    dim stamp: stamp = date_object + time_serial
    set parse = (new DTSValue)(stamp, ms)
  end function

  function clone
    set clone = (new DTSImport)(m_format)
  end function

'---[PRIVATE]-------------------------

  private sub Class_Initialize()
    set m_tags   = CreateObject("System.Collections.ArrayList")  
    set m_dict   = CreateObject("Scripting.Dictionary")
    set m_regexp = CreateObject("VBScript.RegExp")   
    defValues()
  end sub
  
  private sub makeDict(text)
    dim matches, submatches, found, i, v, k 
    m_dict.RemoveAll(): i = 0
    set matches = m_regexp.Execute(text)
    set found = matches.item(0)
    set submatches = found.SubMatches
    for each v in submatches
      k = m_tags(i)
      if k = "ms" then 
        if v = Empty then
          m_dict(k) = "00"
        else
          m_dict(k) = replace(v, ".", "") 
        end if
      elseif v = Empty then
        dim reason: reason = "invalid sequence: '" & text & "'"
        call err.Raise(errorInvalidText, "DTSImport.makeDict", reason)
      else
        m_dict(k) = v
      end if
      i = i + 1
    next
  end sub

  private function setValue(tag, def, minv, vaxv)
    dim v: v = byDefault(tag, def)
    checkRange v, minv, vaxv, tag
    setValue = v 
  end function

  private function byDefault(key, def)
    if m_dict.Exists(key) then
      byDefault = m_dict.item(key)
    else
      byDefault = def
    end if
  end function

  private sub checkRange(v, min, max, token)
    dim reason, a: a = Cint(v)
    if a > max then
      reason = "token '" & token & "' out range: " & v & " (max: " & max & ")"
      call err.Raise(errorOutRange, "DTSImport.checkRange", reason)
    end if
    if a < min then
      reason = "token '" & token & "' out range: " & v & " (min: " & min & ")"
      call err.Raise(errorOutRange, "DTSImport.checkRange", reason)
    end if
  end sub

  private sub input(v)
    if isArray(v) then
      exitByAssert "DTSImport.input", "unexpected type: 'Array'"
    elseif IsObject(v) then
      if v is nothing then
        defValues()
      elseif typename(v) = "DTSImport" then
        format = v.format
      else
        exitByAssert "DTSImport.input", "unexpected object: '" & typename(v) & "'"
      end if
    elseif isNull(v) then
      defValues()
    elseif v = Empty then
      defValues()
    elseif vartype(v) = vbString then
      setFromString v
    else
      exitByAssert "DTSImport.input", "unexpected type: '" & typename(v) & "'"
    end if
  end sub

  private sub adjust(v)
    m_regexp.Global = true
    m_regexp.Pattern = "\bYYYY\b" : v = m_regexp.replace(v, "YY")    
    m_regexp.Pattern = "\bTIME\b" : v = m_regexp.replace(v, "hh:mm:ss")
    m_regexp.Pattern = "\bhms\b"  : v = m_regexp.replace(v, "hh:mm:ss")
    m_regexp.Pattern = "\bTT\b"   : v = m_regexp.replace(v, "hh:mm:ss.ms")
    m_format = v
  end sub

  private function adjustParse(text) 
    dim src: src = trim(text): src = Replace(src, "  ", "")
    g_regexp.Global = false
    g_regexp.Pattern = "(\d{4})y": src = g_regexp.replace(src, "$1")
    g_regexp.Pattern = "(\d{2})m": src = g_regexp.replace(src, "$1")
    g_regexp.Pattern = "(\d{2})d": src = g_regexp.replace(src, "$1")
    adjustParse = src
  end function

  private sub checkUnique(text, tag)
    dim matches, reason
    m_regexp.Pattern = tag
    set matches = m_regexp.Execute(text)
    if matches.Count > 1 then 
      reason = "duplicate token: '" & tag & "'"
      call err.Raise(errorInvalidTag, "DTSImport.setFromString", reason)
    end if
  end sub

  private sub checkUniqueArray(text, tags)
    dim tag
    for each tag in tags
      checkUnique text, tag
    next
  end sub

  private sub setFromString(text)
    dim p, v: v = trim(text)
    if v = Empty then
      defValues()
      exit sub
    end if
    adjust v
    checkUniqueArray v, array("YY","MM","DD","hh","mm","ss","ms")
    makeListTags v
    m_regexp.Pattern = "([\(\)\{\}\[\]\|\\\/\.\^\$])"
    p = m_regexp.Replace(v, "\$1")
    m_regexp.Global = false

    m_regexp.Pattern = "\\.ms"
    p = m_regexp.replace(p, "(\.\d+|)")

    makePattern p, array("YY","MM","DD","hh","mm","ss","ms")
    m_regexp.Pattern = "^" & p & "$"
  end sub

  private sub makeListTags(v)
    dim matches, tag
    m_tags.Clear(): m_regexp.Pattern = "YY|MM|DD|hh|mm|ss|ms"
    set matches = m_regexp.Execute(v)
    for each tag in matches
      m_tags.add tag
    next
  end sub
  
  private sub makePattern(v, tokens)
    dim t 
    for each t in tokens
      m_regexp.Pattern = t
      v = m_regexp.replace(v, "(\d*)")
    next
  end sub

  private sub defValues()
    m_regexp.Global = false
    m_regexp.Pattern = "^(\d*)-(\d*)-(\d*) (\d*):(\d*):(\d*)(\.\d+|)$"
    m_format = "YY-MM-DD hh:mm:ss.ms"
    m_tags.clear()
    m_tags.add "YY": m_tags.add "MM": m_tags.add "DD"
    m_tags.add "hh": m_tags.add "mm": m_tags.add "ss"
    m_tags.add "ms"
  end sub
end class
