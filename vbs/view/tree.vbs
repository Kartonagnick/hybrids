
'--- local/hybrids                                                [vbs/tree.vbs]
'[2024-04-05][23:50:00] 001 Kartonagnick    
'  based on the story:
'  --- local/hybrids                                             [vbs/value.vbs]
'  [2024-03-20][13:00:00] 001 Kartonagnick
'
'  class Tree
'    public default function init(enable_empty, enable_type)
'    property Let show_type(v)
'    property Let show_empty(v)
'    sub show(deep, title, v)
'    function getText(text)
'
' includeVBS("../echo.vbs")
' includeVBS("../traits.vbs")

class Tree

  private mSHOW_TYPE
  private mSHOW_EMPTY

  public default function init(enable_empty, enable_type)
    show_empty = enable_empty
    show_type  = enable_type
    set init = me
  end function

  property Let show_type(v)  mSHOW_TYPE  = v end property  
  property Let show_empty(v) mSHOW_EMPTY = v end property

  public sub show(deep, title, v)
    dim txt: dim deep_start: deep_start = getStartDeep()
    dim result: set result = CreateObject("System.Collections.ArrayList")
    make_ deep_start, title, result
    for each txt in result
      echo deep, txt
    next
  end sub
          
  public function getText(v)
    dim result: set result = CreateObject("System.Collections.ArrayList")
    dim deep: deep = getStartDeep()
    make_ deep, v, result
    set getText = result
  end function

'---

  private function getStartDeep()
    if mSHOW_TYPE then
      getStartDeep = 0
    else
      getStartDeep = -1
    end if
  end function

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
    if mSHOW_EMPTY then
      if mSHOW_TYPE then
        result.add type_(deep, tn) & " (empty)"
      else 
        result.add make_indent(deep) & "(empty)"
      end if
    end if
  end sub

  private sub value_(deep, v, tn, result)
    if mSHOW_TYPE then
      result.add type_(deep, tn) & " " & v
    else 
      result.add make_indent(deep) & v
    end if
  end sub

  private sub obj_(deep, tn, result)
    if mSHOW_TYPE then
      result.add type_(deep, tn)
    else 
      result.add make_indent(deep) & "(" & tn & ")"
    end if
  end sub

  private function bool_(deep, v)
    if mSHOW_TYPE then
      bool_ = type_(deep, "Bool") & " " & boolean_to_string(v)
    else
      bool_ = make_indent(deep) & boolean_to_string(v)
    end if
  end function

  private function double_(deep, v, tn)
    if mSHOW_TYPE then
      double_ = type_(deep, tn) & " " & double_to_string(v)
    else
      double_ = make_indent(deep) & double_to_string(v)
    end if
  end function

  private sub title_(deep, tn, cnt, result)
    if mSHOW_TYPE then
      if cnt = 0 then
        result.add type_(deep, tn) & " (empty)"
      else
        result.add make_indent(deep) & "<" & tn & ": " & cnt & ">"
      end if
    elseif cnt = 0 then
      result.add make_indent(deep) & "(empty)"
    end if
  end sub

  private sub container_(deep, cont, cnt, tn, result)
    if cnt = 0 and not mSHOW_EMPTY then
      exit sub
    end if
    title_ deep, tn, cnt, result
    if cnt = 0 then
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

  private function is_primitive_(v)
    if isArray(v) then
      is_primitive_ = (UBound(v) + 1) = 0
    elseif has_method_count(v) then
      is_primitive_ = v.count = 0
    else
      is_primitive_ = true
    end if
  end function          

  private sub foreach_vec_(deep	, vec, result)
    dim el
    for each el in vec
      make_ deep, el, result
    next
  end sub

  private function key_type_(deep, key)
    dim tn: tn = typename(key)
    key_type_ = make_indent(deep) & "key <" & tn & "> " & key
  end function

  private sub foreach_map_type_(deep, map, result)
    dim key
    for each key in map.keys()
      result.add key_type_(deep, key)
      make_ deep + 1, map(key), result
    next
  end sub

  private function key_no_type_(deep, key)
    key_no_type_ = make_indent(deep) & key & ":"
  end function

  private sub last_(deep, key, val, result)
    dim tmp: set tmp = CreateObject("System.Collections.ArrayList")
    make_ 0, val, tmp
    if tmp.count > 0  then
      if not tmp(0) = empty then
        result.add key_no_type_(deep, key) & " " & tmp(0)
      end if
    end if
  end sub

  private sub foreach_map_no_type_(deep, map, result)
    dim key
    for each key in map.keys()
      if is_primitive_(map(key)) then
        last_ deep, key, map(key), result
      else
        result.add key_no_type_(deep, key)
        make_ deep, map(key), result
      end if
    next
  end sub

  private sub foreach_map_(deep, map, result)
    if mSHOW_TYPE then
      foreach_map_type_ deep, map, result
    else
      foreach_map_no_type_ deep, map, result
    end if
  end sub

  private sub foreach_sortedlist_type_(deep, list, result)
    dim i 
    for i = 0 to list.count - 1
      result.add key_type_(deep, list.GetKey(i))
      make_ deep + 1, list.GetByIndex(i), result
    next
  end sub

  private sub foreach_sortedlist_notype_(deep, list, result)
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
        result.add key_no_type_(deep, key)
        make_ deep, val, result
      end if
    next
  end sub

  private sub foreach_sortedlist_(deep, list, result)
    if mSHOW_TYPE then
      foreach_sortedlist_type_ deep, list, result
    else
      foreach_sortedlist_notype_ deep, list, result
    end if
  end sub

  private sub foreach_hashtable_(deep, map, result)
    if not mSHOW_TYPE then
      result.add make_indent(deep) & "(Hashtable: " & map.count & ")"
    end if
  end sub

  private sub Class_Initialize()
    mSHOW_EMPTY = true
    mSHOW_TYPE = false
  end sub
end class
