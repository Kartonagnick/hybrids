
'--- local/hybrids                                      [test/numeric][main.vbs]
'[2024-07-24][19:00:00] 001 Kartonagnick PRE

sub test(id, deep, from, must, dblval)
  dim real: real = toNumeric(from)
  dim dblv: dblv = toDouble(from)

  if real <> must then
    echo deep, "[" & id & "][ERROR] from: " & from
    echo deep, "[" & id & "][ERROR] real: " & real
    echo deep, "[" & id & "][ERROR] must: " & must
    gMY_TEST = false
  end if

  if dblv <> dblval then
    echo deep, "[" & id & "][ERROR] value : " & from
    echo deep, "[" & id & "][ERROR] dblval: " & dblval
    echo deep, "[" & id & "][ERROR] etalon: " & etalon
    gMY_TEST = false
  end if
end sub

sub test_invalid(deep, id, text)
  Err.Clear
  On Error Resume Next 
  dim real: real = toNumeric("1a")
  check_exception deep, id, errorInvalidText
  On Error goto 0
end sub

function main()
  dim deep: deep = 0

  if gCOMMA_DOUBLE_SEPPARATOR then
    dbg deep, "gCOMMA_DOUBLE_SEPPARATOR: true"
  end if

  test  1, deep,  0     ,  0    ,  0
  test  2, deep,  1     ,  1    ,  1.0
  test  3, deep, -1     , -1    , -1.0
  test  4, deep,  1.2   ,  1.2  ,  1.2
  test  5, deep, -1.2   , -1.2  , -1.2

  test  6, deep, true   ,  1    ,  1.0
  test  7, deep, false  ,  0    ,  0

  test  8, deep, NULL   ,  0    ,  0
  test  9, deep, Empty  ,  0    ,  0
  test 10, deep, Nothing,  0    ,  0

  test 11, deep,  ""    ,   0   ,  0
  test 12, deep,  "0"   ,  "0"  ,  0
  test 13, deep,  "1"   ,  "1"  ,  1.0
  test 14, deep, "-1"   , "-1"  , -1.0

  if gCOMMA_DOUBLE_SEPPARATOR then
    test 15, deep,  "1.0" ,  "1,0",  1
    test 16, deep,  "1.2" ,  "1,2",  1.2
    test 17, deep, "-1.2" , "-1,2", -1.2
  else
    test 18, deep,  "1.0" ,  "1.0",  1
    test 19, deep,  "1.2" ,  "1.2",  1.2
    test 20, deep, "-1.2" , "-1.2", -1.2
  end if

  test_invalid 21, deep, "1a"
  test_invalid 22, deep, "-"
  test_invalid 23, deep, " "
  test_invalid 24, deep, "0xf"

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] toNumeric"
  else
    echo deep, "[ERROR] toNumeric"
    WScript.Quit 1
  end if
end function

main()
