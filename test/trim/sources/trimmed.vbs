
'--- local/hybrids                                       [test/trim][trimmed.vbs]
'[2024-02-21][01:30:00] 003 Kartonagnick PRE
'  --- CastleOfDreams/hybrids                                 [test][trimmed.vbs]
'  [2022-01-26][19:00:00] 002 Kartonagnick
'  [2021-12-11][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams/vbs                             [test][trimArrayList.vbs]
'    [2021-08-08][19:00:00] 002 Kartonagnick
'    [2021-07-22][19:00:00] 001 Kartonagnick

' for: array
sub test1(id, deep, src, must)
  dim arr: arr = split(src, ";") 
  dim res: res = trimmed(arr).toArray()
  dim txt: txt = join(res, ";")
  if txt <> must then
    echo deep, "[" & id & "][ERROR] must : " & must
    echo deep, "[" & id & "][ERROR] real : " & txt
    gMY_TEST = false
  end if
end sub

' for: ArrayList
sub test2(id, deep, src, must)
  dim lst: dim e
  set lst = CreateObject("System.Collections.ArrayList")
  for each e in split(src, ";")
    lst.add(e)
  next
  dim res: res = trimmed(lst).toArray()
  dim txt: txt = join(res, ";")
  if txt <> must then
    echo deep, "[" & id & "][ERROR] must : " & must
    echo deep, "[" & id & "][ERROR] real : " & txt
    gMY_TEST = false
  end if
end sub

function main()

  dim deep: deep = 0

'--- array
  test1 1,  deep, "1;2;3"               , "1;2;3"
  test1 2,  deep, "1;2; 3"              , "1;2;3"
  test1 3,  deep, "1; 2; 3"             , "1;2;3"
  test1 4,  deep, " 1; 2; 3"            , "1;2;3"
  test1 5,  deep, " 1; 2; 3; "          , "1;2;3"
  test1 6,  deep, " 1; 2; 3; ; "        , "1;2;3"
  test1 7,  deep, " 1 ; 2 ; 3 ; ; "     , "1;2;3"
  test1 8,  deep, " ; 1 ; 2 ; 3 ; ; "   , "1;2;3"
  test1 9,  deep, " ;; 1 ; 2 ; 3 ; ; "  , "1;2;3"
  test1 10, deep, " ; ; 1 ; 2 ; 3 ; ; " , "1;2;3"

'--- ArrayList
  test2 11, deep, "1;2;3"               , "1;2;3"
  test2 12, deep, "1;2; 3"              , "1;2;3"
  test2 13, deep, "1; 2; 3"             , "1;2;3"
  test2 14, deep, " 1; 2; 3"            , "1;2;3"
  test2 15, deep, " 1; 2; 3; "          , "1;2;3"
  test2 16, deep, " 1; 2; 3; ; "        , "1;2;3"
  test2 17, deep, " 1 ; 2 ; 3 ; ; "     , "1;2;3"
  test2 18, deep, " ; 1 ; 2 ; 3 ; ; "   , "1;2;3"
  test2 19, deep, " ;; 1 ; 2 ; 3 ; ; "  , "1;2;3"
  test2 20, deep, " ; ; 1 ; 2 ; 3 ; ; " , "1;2;3"

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] trimList"
  else
    echo deep, "[ERROR] trimList"
    WScript.Quit 1
  end if
end function

main()
