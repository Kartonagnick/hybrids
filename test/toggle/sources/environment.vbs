
'--- local/hybrids                                [test/toggle][environment.vbs]
'[2024-04-27][19:00:00] 001 Kartonagnick PRE

dim deep: deep = 0

sub test(id, name, def, expected)
  dim obj: set obj = new Toggle
  obj.environment name, def
  dim result: result = obj.enabled()
  if result <> expected then
    echo deep, "[" & id & "][ERROR] name     : " & name
    echo deep, "[" & id & "][ERROR] expected : " & expected
    echo deep, "[" & id & "][ERROR] result   : " & result
    gMY_TEST = false
  end if
end sub

function main()

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

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] toggle/environment"
  else
    echo deep, "[ERROR] toggle/environment"
    WScript.Quit 1
  end if
end function

main()
