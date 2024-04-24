
'--- local/hybrids                                   [test/toggle][disabled.vbs]
'[2024-04-27][19:00:00] 001 Kartonagnick PRE

dim deep: deep = 0

sub test(id, value, expected)
  dim obj: set obj = (new Toggle)(value)
  dim result: result = obj.disabled
  if result <> expected then
    echo deep, "[" & id & "][ERROR] argument : " & value
    echo deep, "[" & id & "][ERROR] expected : " & expected
    echo deep, "[" & id & "][ERROR] result   : " & result
    gMY_TEST = false
  end if
end sub

function main()
  test  1, ""       , true
  test  2, "0"      , true
  test  3, "OFF"    , true
  test  4, "off"    , true
  test  5, "OfF"    , true
  test  6, "NO"     , true
  test  7, "no"     , true
  test  8, "nO"     , true
  test  9, "FALSE"  , true
  test 10, "false"  , true

  test 11, "1"      , false
  test 12, "TRUE"   , false
  test 13, "true"   , false
  test 14, "True"   , false
  test 15, "YES"    , false
  test 16, "yes"    , false
  test 17, "yES"    , false
  test 18, "TRUE"   , false
  test 19, "true"   , false
  test 20, "TruE"   , false

  test 21, Null     , true
  test 22, Empty    , true
  test 23, Nothing  , true

  test 24, -1       , false
  test 25, -1.1     , false
  test 26,  0.0     , true
  test 27,  0.1     , false
  test 28,  1.2     , false            

  if not gMY_TEST then
    echo deep, "[ERROR] toggle/disabled"
    WScript.Quit 1
  end if
end function

main()
