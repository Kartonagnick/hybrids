
'--- local/hybrids                        [test/toggle][fromString.assert-5.vbs]
'[2024-04-19][19:00:00] 001 Kartonagnick    

function main()
' [ERROR][ASSERT] Toogle.fromString: invalid type: 'Boolean' (must be string)
  dim obj: set obj = new Toggle
  dim res: res = obj.fromString(true)
end function

main()
