
'--- local/hybrids                                      [multiple][assert-1.vbs]
'[2024-02-15][09:00:00] 001 Kartonagnick    

'includeVBS("../../../../vbs/echo.vbs")
'includeVBS("../../../../vbs/assert.vbs")

function main()
  dim deep: deep = 0
  echo 0, "main: expected assert..."
  assert "main", "unit-test", false
end function

main()
