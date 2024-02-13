
'--- local/hybrids                                      [multiple][assert-2.vbs]
'[2024-02-15][09:00:00] 001 Kartonagnick PRE

'includeVBS("../../../../vbs/echo.vbs")
'includeVBS("../../../../vbs/assert.vbs")

function main()
  dim deep: deep = 0
  dim fail: fail = false
  echo 0, "main: expected assert..."
  assert "main", "unit-test", fail
end function

main()
