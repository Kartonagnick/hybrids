
' --- local/hybrids                                    [test/numeric][check.vbs]
' [2024-07-26][19:00:00] 001 Kartonagnick    

sub test(id, deep, from, must)
  dim message: message = checkNumeric(from)

  if from <> must then
    echo deep, "[" & id & "][ERROR] result: " & from
    echo deep, "[" & id & "][ERROR] etalon: " & must
    gMY_TEST = false
  end if

  if message <> Empty then
    echo deep, "[" & id & "][ERROR] error message: " & message
    echo deep, "[" & id & "][ERROR] expected: empty string"
    gMY_TEST = false
  end if
end sub

sub test_invalid(id, deep, from, must, reason)
  dim message: message = checkNumeric(from)

  if isArray(must) then
    from = join(from, ";")
    must = join(must, ";")
    if from <> must then
      echo deep, "[" & id & "][ERROR] result: " & from
      echo deep, "[" & id & "][ERROR] etalon: " & must
      gMY_TEST = false
    end if
  end if

  if typename(must) = "ArrayList" then
    from = join(from.toArray(), ";")
    must = join(must.toArray(), ";")
    if from <> must then
      echo deep, "[" & id & "][ERROR] result: " & from
      echo deep, "[" & id & "][ERROR] etalon: " & must
      gMY_TEST = false
    end if
  end if

  if message <> reason then
    echo deep, "[" & id & "][ERROR] real message: " & message
    echo deep, "[" & id & "][ERROR] must message: " & reason
    gMY_TEST = false
  end if
end sub

function main()
  dim deep: deep = 0

  if gCOMMA_DOUBLE_SEPPARATOR then
    dbg deep, "gCOMMA_DOUBLE_SEPPARATOR: true"
  end if

  test  1, deep,  0     ,  0    
  test  2, deep,  1     ,  1    
  test  3, deep, -1     , -1    
  test  4, deep,  1.2   ,  1.2  
  test  5, deep, -1.2   , -1.2  
  
  test  6, deep, true   ,  1    
  test  7, deep, false  ,  0    
  
  test  8, deep, NULL   ,  0    
  test  9, deep, Empty  ,  0    
  test 10, deep, Nothing,  0    

  test 11, deep,  ""    ,   0     
  test 12, deep,  "0"   ,  "0"  
  test 13, deep,  "1"   ,  "1"  
  test 14, deep, "-1"   , "-1"  
  
  if gCOMMA_DOUBLE_SEPPARATOR then
    test 15, deep,  "1.0" ,  "1,0"
    test 16, deep,  "1.2" ,  "1,2"
    test 17, deep, "-1.2" , "-1,2"
  else
    test 18, deep,  "1.0" ,  "1.0"
    test 19, deep,  "1.2" ,  "1.2"
    test 20, deep, "-1.2" , "-1.2"
  end if

  test_invalid 21, deep, "1a"  , "1a" , "invalid string: '1a'"
  test_invalid 22, deep, "-"   , "-"  , "invalid string: '-'"
  test_invalid 23, deep, " "   , " "  , "invalid string: ' '"
  test_invalid 24, deep, "0xf" , "0xf", "invalid string: '0xf'"

  dim arr1: arr1 = array(1,2)
  dim arr2: arr2 = array(1,2)
  dim lst1: set lst1 = CreateObject("System.Collections.ArrayList")
  dim lst2: set lst2 = CreateObject("System.Collections.ArrayList")

  test_invalid 25, deep, arr1 , arr2, "unexpected type: Array"
  test_invalid 26, deep, lst1 , lst2, "unexpected object: 'ArrayList'"

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] checkNumeric"
  else
    echo deep, "[ERROR] checkNumeric"
    WScript.Quit 1
  end if
end function

main()
