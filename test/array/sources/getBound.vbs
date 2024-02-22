
'--- local/hybrids                                    [test/array][getBound.vbs]
'[2024-02-22][17:40:00] 002 Kartonagnick PRE
'  --- CastleOfDreams/hybrids                               [test][getBound.vbs]
'  [2022-01-26][19:00:00] 002 Kartonagnick
'  [2022-01-04][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams/vbs                                 [test][getBound.vbs]
'    [2021-07-25][19:00:00] 001 Kartonagnick

dim deep: deep = 0

sub test(id, src, must)
  dim real: real = getBound(src)
  if real <> must then
    echo deep, "[" & id & "][ERROR] src  : " & src
    echo deep, "[" & id & "][ERROR] must : " & must
    echo deep, "[" & id & "][ERROR] real : " & real
    gMY_TEST = false
  end if
end sub

function main()
  test 1, split("1"  , ";")   ,  0
  test 2, split("1;2", ";")   ,  1
  test 3, array(1, true, "")  ,  2
  test 4, array(1,2)          ,  1
  test 5, array()             , -1
  test 6, toArrayList("1")    ,  0
  test 7, toArrayList("1;2")  ,  1
  test 8, toArrayList("")     , -1

  if not gMY_TEST then
    echo deep, "[ERROR] getBound"
    WScript.Quit 1
  end if
end function

main()
