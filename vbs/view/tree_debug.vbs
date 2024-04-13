
'--- local/hybrids                                          [vbs/tree_debug.vbs]
'[2024-04-13][19:00:00] 001 Kartonagnick    
'  based on the story:
'  --- local/hybrids                                              [vbs/tree.vbs]
'  [2024-04-05][23:50:00] 001 Kartonagnick
'    based on the story:
'    --- local/hybrids                                           [vbs/value.vbs]
'    [2024-03-20][13:00:00] 001 Kartonagnick
'
'  class TreeDebug
'    public sub show(deep, title, v)
'    function getText(text)
'
' includeVBS("../echo.vbs")
' includeVBS("../traits.vbs")

class TreeDebug

  public sub show(deep, title, v)
    dim txt: dim result: set result = CreateObject("System.Collections.ArrayList")
    make_ 0, title, result
    for each txt in result
      echo deep, txt
    next
  end sub
          
  public function getText(v)
    dim result: set result = CreateObject("System.Collections.ArrayList")
    make_ 0, v, result
    set getText = result
  end function
'---
  private sub make_(deep, v, result)
    dim tn: tn = typename(v)
    dim vt: vt = vartype(v)
    if isNull(v) then
      novalue_ deep, tn, result
    elseif isArray(v) then
      container_ deep, v, UBound(v) + 1, "Array", result
    elseif isObject(v) then
      if v is nothing then
        novalue_ deep, tn, result
      elseif has_method_count(v) then
        container_ deep, v, v.count, tn, result
      else
        obj_ deep, tn, result
      end if
    elseif vt = vbBoolean then
      result.add bool_(deep, v)
    elseif vt = vbEmpty then
      novalue_ deep, tn, result
    elseif vt = vbString then
      if v = Empty then
        novalue_ deep, tn, result
      else 
        value_ deep, v, tn, result
      end if
    elseif vt = vbSingle or vt = vbDouble then
      result.add double_(deep, v, tn)
    else
      value_ deep, v, tn, result
    end if
  end sub
'---
  private function type_(deep, tn)
    type_ = make_indent(deep) & "<" & tn & ">"
  end function

  private sub novalue_(deep, tn, result)
    result.add type_(deep, tn) & " (empty)"
  end sub

  private sub value_(deep, v, tn, result)
    result.add type_(deep, tn) & " " & v
  end sub

  private sub obj_(deep, tn, result)
    result.add type_(deep, tn)
  end sub

  private function bool_(deep, v)
    bool_ = type_(deep, "Bool")
    bool_ = bool_ & " " & boolean_to_string(v)
  end function

  private function double_(deep, v, tn)
    double_ = type_(deep, tn)
    double_ = double_ & " " & double_to_string(v)
  end function

  private function title_(deep, tn, cnt)
    if cnt = 0 then
      title_ = type_(deep, tn) & " (empty)"
    else
      title_ = make_indent(deep) & "<" & tn & ": " & cnt & ">"
    end if
  end function

  private sub container_(deep, cont, cnt, tn, result)
    result.add title_(deep, tn, cnt)
    if cnt = 0 then
      exit sub
    else
      if tn = "SortedList" then
        foreach_sortedlist_ deep + 1, cont, result
      elseif tn = "Hashtable" then
        'foreach_hashtable_ deep + 1, cont, result
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
    dim tn: tn = typename(key)
    key_ = make_indent(deep) & "key <" & tn & "> " & key
  end function

  private sub foreach_map_(deep, map, result)
    dim key
    for each key in map.keys()
      result.add key_(deep, key)
      make_ deep + 1, map(key), result
    next
  end sub

  private sub foreach_sortedlist_(deep, list, result)
    dim i 
    for i = 0 to list.count - 1
      result.add key_(deep, list.GetKey(i))
      make_ deep + 1, list.GetByIndex(i), result
    next
  end sub
end class
