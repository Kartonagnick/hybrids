
'--- local/hybrids                                 [test/array][toArrayList.vbs]
'[2024-02-22][17:40:00] 002 Kartonagnick    
'  --- CastleOfDreams/hybrids                            [test][toArrayList.vbs]
'  [2022-01-26][19:00:00] 002 Kartonagnick
'  [2022-01-04][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams/vbs                              [test][toArrayList.vbs]
'    [2021-07-25][19:00:00] 001 Kartonagnick

sub test(id, deep, src, must)
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

  dim deep: deep = 0: dim Ni__

  test 1,  deep, array("1","2","3"), array("1", "2", "3")
  test 2,  deep, array(1,2,3)      , array(1, 2, 3)
  test 3,  deep, array()           , array()
  test 4,  deep, nothing           , array()
  test 5,  deep, Null              , array()
  test 6,  deep, Empty             , array()
  test 7,  deep, Ni__              , array()
  test 8,  deep, ""                , array()
  test 9,  deep, "text"            , array("text")
  test 10, deep, false             , array(false)
  test 11, deep, true              , array(true)
  test 12, deep, 1                 , array(1)
  test 13, deep, 0                 , array(0)
  test 14, deep, -1                , array(-1)

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] toArrayList"
  else
    echo deep, "[ERROR] toArrayList"
    WScript.Quit 1
  end if
end function

main()
