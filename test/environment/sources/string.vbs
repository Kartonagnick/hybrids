
'--- local/hybrids                                [test][environment][string.vbs]
'[2024-09-30][19:00:00] 001 Kartonagnick PRE

dim deep: deep = 0

sub test(id, name, def, elaton)
  dim result: result = fromEnvironment(name, def)
  if result <> elaton then
    echo deep, "[" & id & "][ERROR] name   : " & name
    echo deep, "[" & id & "][ERROR] elaton : " & elaton
    echo deep, "[" & id & "][ERROR] result : " & result
    gMY_TEST = false
  end if
end sub

sub main()
  test  1, "mustBeEmpty", ""  , false
  test  2, "mustBe0"    , ""  , false
  test  3, "mustBeOFF"  , ""  , false
  test  4, "mustBeFalse", ""  , false
  test  5, "mustBeNo"   , ""  , false

  test  6, "mustBe1"    , ""  , true
  test  7, "mustBeON"   , ""  , true
  test  8, "mustBeTrue" , ""  , true
  test  9, "mustBeYes"  , ""  , true
  
  test 10, "mustBeEmpty", "ON", true

  test 11, "testValue1" , "xx", "unit_test"
  test 12, "testValue2" , "xx", "unit test"

  if not gMY_TEST then
    echo deep, "[ERROR] environment/string"
    WScript.Quit 1
  end if
end sub

main()
