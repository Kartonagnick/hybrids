
'--- local/hybrids                                          [multiple][main.vbs]
'[2024-02-15][09:00:00] 001 Kartonagnick    
'
'includeVBS("../../../../vbs/echo.vbs")
'includeVBS("staff/foo.vbs")
 
function main()
  dim deep: deep = 0
  echo 0, "main: begin"
  dim obj: set obj = foo
  echo 0, "main: done"
end function

main()
