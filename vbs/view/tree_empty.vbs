
'--- local/hybrids                                          [vbs/tree_empty.vbs]
'[2024-04-11][19:00:00] 001 Kartonagnick    
'  based on the story:
'  --- local/hybrids                                              [vbs/tree.vbs]
'  [2024-04-05][23:50:00] 001 Kartonagnick
'    based on the story:
'    --- local/hybrids                                           [vbs/value.vbs]
'    [2024-03-20][13:00:00] 001 Kartonagnick
'
'  class TreeShort
'    public sub show(deep, title, v)
'    function getText(text)
'
' includeVBS("../echo.vbs")
' includeVBS("../traits.vbs")

class TreeEmpty

  public sub show(deep, title, v)
    dim txt: dim result: set result = CreateObject("System.Collections.ArrayList")
    make_ 0, title, result
    for each txt in result
      echo deep, txt
    next
  end sub
          
  public function getText(v)
    dim result: set result = CreateObject("System.Collections.ArrayList")
    make_ -1, v, result
    set getText = result
  end function
'---
  private sub make_(deep, v, result)
    dim tn: tn = typename(v)
    dim vt: vt = vartype(v)
    if isNull(v) then
      novalue_ deep, result
    elseif isArray(v) then
      container_ deep, v, UBound(v) + 1, "Array", result
    elseif isObject(v) then
      if v is nothing then
        novalue_ deep, result
      elseif has_method_count(v) then
        container_ deep, v, v.count, tn, result
      else
        obj_ deep, tn, result
      end if
    elseif vt = vbBoolean then
      result.add bool_(deep, v)
    elseif vt = vbEmpty then
      novalue_ deep, result
    elseif vt = vbString then
      if v = Empty then
        novalue_ deep, result
      else 
        value_ deep, v, result
      end if
    elseif vt = vbSingle or vt = vbDouble then
      result.add double_(deep, v, tn)
    else
      value_ deep, v, result
    end if
  end sub
'---

  private sub novalue_(deep, result)
    result.add make_indent(deep) & "(empty)"
  end sub

  private sub value_(deep, v, result)
    result.add make_indent(deep) & v
  end sub

  private sub obj_(deep, tn, result)
    result.add make_indent(deep) & "(" & tn & ")"
  end sub

  private function bool_(deep, v)
    bool_ = make_indent(deep) & boolean_to_string(v)
  end function

  private function double_(deep, v, tn)
    double_ = make_indent(deep) & double_to_string(v)
  end function

  private function is_primitive_(v)
    if isArray(v) then
      is_primitive_ = (UBound(v) + 1) = 0
    elseif has_method_count(v) then
      is_primitive_ = v.count = 0
    else
      is_primitive_ = true
    end if
  end function          

  private sub container_(deep, cont, cnt, tn, result)
    if cnt = 0 then
      result.add make_indent(deep) & "(empty)"
      exit sub
    else
      if tn = "SortedList" then
        foreach_sortedlist_ deep + 1, cont, result
      elseif tn = "Hashtable" then
        foreach_hashtable_ deep, cont, result
      elseif tn = "Dictionary" then
        foreach_map_ deep + 1, cont, result
      else 
        foreach_vec_ deep + 1, cont, result
      end if             
    end if
  end sub

  private sub foreach_vec_(deep	, vec, result)
    dim el
    for each el in vec
      make_ deep, el, result
    next
  end sub

  private function key_(deep, key)
    key_ = make_indent(deep) & key & ":"
  end function

  private sub last_(deep, key, val, result)
    dim tmp: set tmp = CreateObject("System.Collections.ArrayList")
    make_ 0, val, tmp
    result.add key_(deep, key) & " " & tmp(0)
  end sub

  private sub foreach_map_(deep, map, result)
    dim key
    for each key in map.keys()
      if is_primitive_(map(key)) then
        last_ deep, key, map(key), result
      else
        result.add key_(deep, key)
        make_ deep, map(key), result
      end if
    next
  end sub

  private sub foreach_sortedlist_(deep, list, result)
    dim i: dim key: dim val
    for i = 0 to list.count - 1
      if isObject(list.GetKey(i)) then
        set key = list.GetKey(i)
      else
        key = list.GetKey(i)
      end if
      if isObject(list.GetByIndex(i)) then
        set val = list.GetByIndex(i)
      else
        val = list.GetByIndex(i)
      end if
      if is_primitive_(val) then
        last_ deep, key, val, result
      else
        result.add key_(deep, key)
        make_ deep, val, result
      end if
    next
  end sub

  private sub foreach_hashtable_(deep, map, result)
    result.add make_indent(deep) & "(Hashtable: " & map.count & ")"
  end sub
end class
