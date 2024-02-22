
'--- local/hybrids                                                   [array.vbs]
'[2024-02-22][17:40:00] 001 Kartonagnick    
'  --- CastleOfDreams\hybrids                                       [common.vbs]
'  [2022-01-04][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams\vbs                                         [common.vbs]
'    [2021-07-25][19:00:00] 001 Kartonagnick

' functions:
'   function getCount(collect)
'   function getBound(collect)
'   function toArrayList(v)

function getCount(collect)
  if isArray(collect) then
    getCount = UBound(collect) + 1
  else
    getCount = collect.count
  end if
end function

function getBound(collect)
  if isArray(collect) then
    getBound = UBound(collect)
  else
    getBound = collect.count - 1
  end if
end function

function toArrayList(v)
  dim lst: set lst = CreateObject("System.Collections.ArrayList")
  set toArrayList = lst
  if IsNull(v) then
    'nothing
  elseif isArray(v) then
    dim e
    for each e in v
      lst.add(e)
    next
    set toArrayList = lst
  elseif IsObject(v) then
    if v is nothing then
      'nothing
    elseif typename(v) = "ArrayList" then
      set toArrayList = v
    else
      lst.add(v)
      set toArrayList = lst
    end if
  elseif vartype(v) = vbEmpty then
   'nothing
  elseif vartype(v) = vbString then
    if v = Empty then
     'nothing
    else
      dim a: a = split(v, ";")
      set toArrayList = toArrayList(a)
    end if
  else 
    lst.add(v)
    set toArrayList = lst
  end if
end function
