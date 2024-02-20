
'--- local/hybrids                                                    [trim.vbs]
'[2024-02-21][01:30:00] 001 Kartonagnick    
'  --- CastleOfDreams\hybrids                                         [trim.vbs]
'  [2021-12-11][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams\vbs                                           [trim.vbs]
'    [2021-08-08][19:00:00] 002 Kartonagnick
'    [2021-07-22][19:00:00] 001 Kartonagnick

' functions:
'   function trimFront(text, chars)
'   function trimBack(text, chars)
'   function trimBoth(text, chars)
'   function trimList(lst)

'example: 
'  trimBack("path\ \ \\ ", "\ ")
'  result: path

function trimBack(text, chars)
  dim back: back = Right(text, 1)
  dim pos: pos = Instr(1, chars, back, 0)
  if pos > 0 then
    dim tmp: tmp = Left(text, Len(text) - 1)
    trimBack = trimBack(tmp, chars)
  else 
    trimBack = text
  end if
end function

'example:
'  trimFront(" \\ \  \ \  path", "\ ")
'  result: path

function trimFront(text, chars)
  dim front: front = Left(text, 1)
  dim pos: pos = Instr(1, chars, front, 0)
  if pos > 0 then
    dim tmp: tmp = Right(text, Len(text) - 1)
    trimFront = trimFront(tmp, chars)
  else
    trimFront = text
  end if
end function

'example:
'  trimFront(" \\ \  \ \  path\ \ \\ ", "\ ")
'  result: path

function trimBoth(text, chars)
  dim t: t = trimBack(text, chars)
  trimBoth = trimFront(t, chars)
end function

' trim each element of the collection
'   lst: array or array-compatible-object
'   return System.Collections.ArrayList
function trimmed(lst)
  dim el: dim cpy
  set cpy = CreateObject("System.Collections.ArrayList")
  for each el in lst
    el = trim(el)
    if el <> empty then
      cpy.add el
    end if
  next
  set trimmed = cpy
end function

' trim each element of the collection
'   lst: can be string, array, or array-compatible-object
function trimList(lst)
  if isArray(lst) then
    trimList = trimmed(lst).toArray()
  elseif vartype(lst) = vbString then
    dim arr: arr = trimmed(split(lst, ";")).toArray()
    trimList = join(arr, ";")
  else
    set trimList = trimmed(lst)
  end if
end function
