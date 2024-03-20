
'--- local/hybrids                                               [vbs/value.vbs]
'[2024-03-20][13:00:00] 001 Kartonagnick    
'
'  class Value
'    default function init(v)   'enable/disable show empty values
'    property Let show_empty(v) 'enable/disable show empty values
'    function to_string(text)   'convert value to string

class Value
  private mSHOW_EMPTY

  public default function init(v)
    show_empty = v
    set init = me
  end function

  property Let show_empty(v) mSHOW_EMPTY = v end property

  function to_string(v)
    if mSHOW_EMPTY then
      to_string = show_empty_value(v)    
    else
      to_string = hide_empty_value(v)
    end if
  end function  

  function has_count(v)
    dim tn: tn = typename(v)
    if tn = "ArrayList" then
      has_count = true
    elseif tn = "Stack" then
      has_count = true
    elseif tn = "SortedList" then
      has_count = true
    elseif tn = "Dictionary" then
      has_count = true
    elseif tn = "Hashtable" then
      has_count = true
    elseif tn = "Queue" then
      has_count = true
    else
      has_count = false  
    end if
  end function          

  function has_stamp(v)
    dim tn: tn = typename(v)
    if tn = "DTSValue" or tn = "DTStamp" then
      has_stamp = true
    else
      has_stamp = false
    end if
  end function          

  function is_empty(v)
    if isNull(v) then
      is_empty = true
    elseif isArray(v) then
      if UBound(v) + 1 > 0 then
        is_empty = false
      else
        is_empty = true
      end if
    elseif isObject(v) then
      dim tn: tn = typename(v)
      if v is nothing then
        is_empty = true
      elseif has_count(v) then       
        if v.count > 0 then
          is_empty = false
        else
          is_empty = true
        end if
      else
        is_empty = false
      end if
    elseif v = Empty then
      is_empty = true
    else
      is_empty = false
    end if
  end function

'---

  private function hide_empty_value(v)
    dim vt: vt = vartype(v)
    if isNull(v) then
      hide_empty_value = ""
    elseif isArray(v) then
      hide_empty_value = "(Array: " & Ubound(v) + 1 & ")"
    elseif isObject(v) then
      if v is nothing then
        hide_empty_value = ""
      else
        hide_empty_value = for_object(v)      
      end if
    elseif vt = vbBoolean then
      hide_empty_value = for_boolean(v)
    elseif vt = vbEmpty then
      hide_empty_value = ""
    elseif vt = vbString then
      if v = Empty then
        hide_empty_value = ""
      else 
        hide_empty_value = v
      end if
    elseif vt = vbSingle or vt = vbDouble then
      hide_empty_value = for_double(v)
    else
      hide_empty_value = "" & v
    end if
  end function

  private function show_empty_value(v)
    dim vt: vt = vartype(v)
    if isNull(v) then
      show_empty_value = "(Null)"
    elseif isArray(v) then
      show_empty_value = "(Array: " & Ubound(v) + 1 & ")"
    elseif isObject(v) then
      if v is nothing then
        show_empty_value = "(Nothing)"
      else 
        show_empty_value = for_object(v)
      end if
    elseif vt = vbBoolean then
      show_empty_value = for_boolean(v)
    elseif vt = vbEmpty then
      show_empty_value = "(Empty)"
    elseif vt = vbString then
      if v = Empty then
        show_empty_value = "(Empty-String)"
      else 
        show_empty_value = v
      end if
    elseif vt = vbSingle or vt = vbDouble then
      show_empty_value = for_double(v)
    else
      show_empty_value = "" & v
    end if
  end function

  private function for_boolean(v)
    if v then
      for_boolean = "true"
    else
      for_boolean = "false"
    end if
  end function

  private function for_double(v)
    for_double = Replace(v, ",", ".")
  end function

  private function for_object(v)
    dim tn: tn = typename(v)        
    if has_count(v) then       
      for_object = "(" & tn & ": " & v.count & ")"
    elseif has_stamp(v) then
        for_object = v.stamp()
    else
        for_object = "(" & tn & ")"
    end if
  end function          

  private sub Class_Initialize()
    mSHOW_EMPTY = false
  end sub
end class
