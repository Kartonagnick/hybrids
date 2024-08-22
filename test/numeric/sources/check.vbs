
' --- local/hybrids                                    [test/numeric][check.vbs]
' [2024-07-26][19:00:00] 001 Kartonagnick    

dim deep: deep = 0

sub test(id, from, must)
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

sub test_invalid(id, from, must, reason)
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
  if gCOMMA_DOUBLE_SEPPARATOR then
    dbg deep, "gCOMMA_DOUBLE_SEPPARATOR: true"
  end if

  test  1,  0     ,  0    
  test  2,  1     ,  1    
  test  3, -1     , -1    
  test  4,  1.2   ,  1.2  
  test  5, -1.2   , -1.2  
  
  test  6, true   ,  1    
  test  7, false  ,  0    
  
  test  8, NULL   ,  0    
  test  9, Empty  ,  0    
  test 10, Nothing,  0    

  test 11,  ""    ,   0     
  test 12,  "0"   ,  "0"  
  test 13,  "1"   ,  "1"  
  test 14, "-1"   , "-1"  
  
  if gCOMMA_DOUBLE_SEPPARATOR then
    test 15,  "1.0" ,  "1,0"
    test 16,  "1.2" ,  "1,2"
    test 17, "-1.2" , "-1,2"
  else
    test 18,  "1.0" ,  "1.0"
    test 19,  "1.2" ,  "1.2"
    test 20, "-1.2" , "-1.2"
  end if

  test_invalid 21, "1a"  , "1a" , "invalid string: '1a'"
  test_invalid 22, "-"   , "-"  , "invalid string: '-'"
  test_invalid 23, " "   , " "  , "invalid string: ' '"
  test_invalid 24, "0xf" , "0xf", "invalid string: '0xf'"

  dim arr1: arr1 = array(1,2)
  dim arr2: arr2 = array(1,2)
  dim lst1: set lst1 = CreateObject("System.Collections.ArrayList")
  dim lst2: set lst2 = CreateObject("System.Collections.ArrayList")

  test_invalid 25, arr1 , arr2, "unexpected type: Array"
  test_invalid 26, lst1 , lst2, "unexpected object: 'ArrayList'"

  if not gMY_TEST then
    echo deep, "[ERROR] checkNumeric"
    WScript.Quit 1
  end if
end function

main()
