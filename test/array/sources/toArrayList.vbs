
'--- local/hybrids                                 [test/array][toArrayList.vbs]
'[2024-02-22][17:40:00] 002 Kartonagnick PRE
'  --- CastleOfDreams/hybrids                            [test][toArrayList.vbs]
'  [2022-01-26][19:00:00] 002 Kartonagnick
'  [2022-01-04][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams/vbs                              [test][toArrayList.vbs]
'    [2021-07-25][19:00:00] 001 Kartonagnick

dim deep: deep = 0

sub test(id, src, must)
  dim real: real = toArrayList(src).toArray()
  must = join(must, ";")
  real = join(real, ";")
  if real <> must then
    echo deep, "[" & id & "][ERROR] src  : " & src
    echo deep, "[" & id & "][ERROR] must : " & must
    echo deep, "[" & id & "][ERROR] real : " & real
    gMY_TEST = false
  end if
end sub

function main()
  dim Ni__
  test  1, array("1","2","3"), array("1", "2", "3")
  test  2, array(1,2,3)      , array(1, 2, 3)
  test  3, array()           , array()
  test  4, nothing           , array()
  test  5, Null              , array()
  test  6, Empty             , array()
  test  7, Ni__              , array()
  test  8, ""                , array()
  test  9, "text"            , array("text")
  test 10, false             , array(false)
  test 11, true              , array(true)
  test 12, 1                 , array(1)
  test 13, 0                 , array(0)
  test 14, -1                , array(-1)

  if not gMY_TEST then
    echo deep, "[ERROR] toArrayList"
    WScript.Quit 1
  end if
end function

main()
