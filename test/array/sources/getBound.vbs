
'--- local/hybrids                                    [test/array][getBound.vbs]
'[2024-02-22][17:40:00] 002 Kartonagnick    
'  --- CastleOfDreams/hybrids                               [test][getBound.vbs]
'  [2022-01-26][19:00:00] 002 Kartonagnick
'  [2022-01-04][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams/vbs                                 [test][getBound.vbs]
'    [2021-07-25][19:00:00] 001 Kartonagnick

sub test(id, deep, src, must)
  dim real: real = getBound(src)
  if real <> must then
    echo deep, "[" & id & "][ERROR] src  : " & src
    echo deep, "[" & id & "][ERROR] must : " & must
    echo deep, "[" & id & "][ERROR] real : " & real
    gMY_TEST = false
  end if
end sub


function main()

  dim deep: deep = 0

  test 1, deep, split("1"  , ";")   ,  0
  test 2, deep, split("1;2", ";")   ,  1
  test 3, deep, array(1, true, "")  ,  2
  test 4, deep, array(1,2)          ,  1
  test 5, deep, array()             , -1
  test 6, deep, toArrayList("1")    ,  0
  test 7, deep, toArrayList("1;2")  ,  1
  test 8, deep, toArrayList("")     , -1

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] getCount"
  else
    echo deep, "[ERROR] getBound"
    WScript.Quit 1
  end if
end function

main()
