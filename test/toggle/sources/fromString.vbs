
'--- local/hybrids                                 [test/toggle][fromString.vbs]
'[2024-04-19][19:00:00] 001 Kartonagnick    

dim deep: deep = 0

sub test(id, value, expected)
  dim obj: set obj = new Toggle
  dim result: result = obj.fromString(value)
  if result <> expected then
    echo deep, "[" & id & "][ERROR] argument : " & value
    echo deep, "[" & id & "][ERROR] expected : " & expected
    echo deep, "[" & id & "][ERROR] result   : " & result
    echo deep, ""
    gMY_TEST = false
  end if
end sub

function main()
  test  1, ""       , false
  test  2, "0"      , false
  test  3, "OFF"    , false
  test  4, "off"    , false
  test  5, "OfF"    , false
  test  6, "NO"     , false
  test  7, "no"     , false
  test  8, "nO"     , false
  test  9, "FALSE"  , false
  test 10, "false"  , false

  test 11, "1"      , true
  test 12, "TRUE"   , true
  test 13, "true"   , true
  test 14, "True"   , true
  test 15, "YES"    , true
  test 16, "yes"    , true
  test 17, "yES"    , true
  test 18, "TRUE"   , true
  test 19, "true"   , true
  test 20, "TruE"   , true

  if not gMY_TEST then
    echo deep, "[ERROR] toggle/fromString"
    WScript.Quit 1
  end if
end function

main()
