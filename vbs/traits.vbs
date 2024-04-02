
'--- local/hybrids                                              [vbs/traits.vbs]
'[2024-04-02][06:10:00] 001 Kartonagnick PRE
'
'  functions:
'    has_method_count(v)
'    has_method_stamp(v)
'    is_empty_value(v)
'    boolean_to_string(v)
'    double_to_string(v)

function has_method_count(v)
  dim tn: tn = typename(v)
  if tn = "ArrayList" then
    has_method_count = true
  elseif tn = "Stack" then
    has_method_count = true
  elseif tn = "SortedList" then
    has_method_count = true
  elseif tn = "Dictionary" then
    has_method_count = true
  elseif tn = "Hashtable" then
    has_method_count = true
  elseif tn = "Queue" then
    has_method_count = true
  else
    has_method_count = false  
  end if
end function          

function has_method_stamp(v)
  dim tn: tn = typename(v)
  if tn = "DTSValue" or tn = "DTStamp" then
    has_method_stamp = true
  else
    has_method_stamp = false
  end if
end function          

function is_empty_value(v)
  if isNull(v) then
    is_empty_value = true
  elseif isArray(v) then
    if UBound(v) + 1 > 0 then
      is_empty_value = false
    else
      is_empty_value = true
    end if
  elseif isObject(v) then
    dim tn: tn = typename(v)
    if v is nothing then
      is_empty_value = true
    elseif has_method_count(v) then       
      if v.count > 0 then
        is_empty_value = false
      else
        is_empty_value = true
      end if
    else
      is_empty_value = false
    end if
  elseif v = Empty then
    is_empty_value = true
  else
    is_empty_value = false
  end if
end function

function boolean_to_string(v)
  if v then
    boolean_to_string = "true"
  else
    boolean_to_string = "false"
  end if
end function

function double_to_string(v)
  double_to_string = Replace(v, ",", ".")
end function
