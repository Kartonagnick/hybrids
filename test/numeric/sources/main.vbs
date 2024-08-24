
'--- local/hybrids                                      [test/numeric][main.vbs]
'[2024-07-24][19:00:00] 001 Kartonagnick    

dim deep: deep = 0

sub test(id, from, must, dblval)
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

sub test_invalid(id, text)
  Err.Clear
  On Error Resume Next 
  dim real: real = toNumeric("1a")
  check_exception deep, id, errorInvalidText
  On Error goto 0
end sub

function main()
  if gCOMMA_DOUBLE_SEPPARATOR then
    dbg deep, "gCOMMA_DOUBLE_SEPPARATOR: true"
  end if

  test  1,  0     ,  0    ,  0
  test  2,  1     ,  1    ,  1.0
  test  3, -1     , -1    , -1.0
  test  4,  1.2   ,  1.2  ,  1.2
  test  5, -1.2   , -1.2  , -1.2

  test  6, true   ,  1    ,  1.0
  test  7, false  ,  0    ,  0

  test  8, NULL   ,  0    ,  0
  test  9, Empty  ,  0    ,  0
  test 10, Nothing,  0    ,  0

  test 11,  ""    ,   0   ,  0
  test 12,  "0"   ,  "0"  ,  0
  test 13,  "1"   ,  "1"  ,  1.0
  test 14, "-1"   , "-1"  , -1.0

  if gCOMMA_DOUBLE_SEPPARATOR then
    test 15,  "1.0" ,  "1,0",  1
    test 16,  "1.2" ,  "1,2",  1.2
    test 17, "-1.2" , "-1,2", -1.2
  else
    test 18,  "1.0" ,  "1.0",  1
    test 19,  "1.2" ,  "1.2",  1.2
    test 20, "-1.2" , "-1.2", -1.2
  end if

  test_invalid 21, "1a"
  test_invalid 22, "-"
  test_invalid 23, " "
  test_invalid 24, "0xf"

  if not gMY_TEST then
    echo deep, "[ERROR] toNumeric"
    WScript.Quit 1
  end if
end function

main()
