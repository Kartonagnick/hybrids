
'--- local/hybrids                                              [vbs/toggle.vbs]
'[2024-04-14][19:00:00] 001 Kartonagnick PRE
'
'  class Toogle
'    default function init(v)   'set: 1/0 true/false ON/OFF YES/NO
'    property Let value(v)      'set: 1/0 true/false ON/OFF YES/NO
'    property Get disabled()    'if false -> return true
'    property Get enabled()     'if true  -> return true
'    function to_string(text)   'return string: ON/OFF
'    sub environment(name, def) 'set value from environment
'
'    function to_bool(v) 
'      if Null, Nothing, 0, false, OFF, NO, Toogle.disabled then 
'        return false   
'      if 1, true, ON, YES, Toogle.enabled then 
'        return true
'
'    function fromString(text)
'      true : 1, true , on , yes,
'      false: 0, false, off, no
'
'    function fromEnvironment(name, def) 
'      loaded value from environment
'      return true/false 
'
' includeVBS("glob.vbs")

class Toggle
  public default function init(v)
    value = v
    set init = me
  end function

  property Let value(v) 
    mValue = to_bool(v)    
  end property

  property Get disabled() 
    if mValue then 
      disabled = false
    else
      disabled = true
    end if
  end property

  property Get enabled() 
    if mValue then 
      enabled = true
    else
      enabled = false
    end if
  end property

  function to_string()
    if mValue Then
      to_string = "ON"
    else
      to_string = "OFF"
    end if
  end function  
             
  sub environment(name, def)
    mValue = fromEnvironment(name, def)
  end sub

  function to_bool(v)
    if isNull(v) then
      to_bool = false
    elseif isArray(v) then
      assertFromBool "unexpected array type"
    elseif isObject(v) then
      if v is nothing then
        to_bool = false
      elseif typename(v) = "Toggle" then
        to_bool = v.enabled
      else
        assertFromBool "unexpected object: '" & typename(v) & "'"
      end if
    elseif v = Empty then
      to_bool = false
    else
      if vartype(v) = vbString then
        to_bool = fromString(v)
      else
        to_bool = true
      end if
    end if
  end function

  function fromString(text)
    if not vartype(text) = vbString then
      assertFromString "invalid type: '" & typename(text) & "' (must be string)"
    end if
    if text = "" or text = "0" then 
      fromString = false
    elseif text = "1" then
      fromString = true
    else
      dim v: v = lcase(text)
      if v = "false" or v = "off" or v = "no" then 
        fromString = false
      elseif v = "true" or v = "on" or v = "yes" then 
        fromString = true
      else
        assertFromString "invalid value: '" & v & "'"
      end if
    end if
  end function

  function fromEnvironment(name, def)
    dim v: v = g_env.Item(name)
    if v = empty then
      fromEnvironment = fromString(def)
    else
      fromEnvironment = fromString(v)
    end if
  end function

'---

  private sub assertFromBool(desc)
    exitByAssert "Toogle.to_bool", desc
  end sub

  private sub assertFromString(desc)
    exitByAssert "Toogle.fromString", desc
  end sub

  private sub exitByAssert(from, desc)
    WScript.Echo "[ERROR][ASSERT] " & from & ": " & desc
    WScript.Quit 1
  end sub

  private sub Class_Initialize()
    mValue = false
  end sub

  private mValue
end class
