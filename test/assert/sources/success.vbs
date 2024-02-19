
'--- local/hybrids                                    [test/assert][success.vbs]
'[2024-02-19][19:00:00] 002 Kartonagnick PRE
'  --- CastleOfDreams/hybrids                       [test/assert/cases/main.vbs]
'  [2022-01-26][19:00:00] 002 Kartonagnick
'  [2021-12-20][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams/vbs                                    [test/assert.vbs]
'    [2021-07-20][16:00:00] 001 Kartonagnick

function main()
  assert "test_assert", "example", 1
  assert "test_assert", "example", true
  assert "test_assert", "example", "on"
  assert "test_assert", "example", "On"
  assert "test_assert", "example", "oN"
  assert "test_assert", "example", "ON"
  assert "test_assert", "example", "YES"
  assert "test_assert", "example", "YeS"
  assert "test_assert", "example", "Yes"
  assert "test_assert", "example", "yeS"
  assert "test_assert", "example", "yEs"

  if not gMY_TEST then
    echo deep, "[ERROR] assert"
    WScript.Quit 1
  end if
end function

main()
