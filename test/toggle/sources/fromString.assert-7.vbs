
'--- local/hybrids                        [test/toggle][fromString.assert-7.vbs]
'[2024-04-19][19:00:00] 001 Kartonagnick    

function main()
' [ERROR][ASSERT] Toogle.fromString: invalid type: 'Double' (must be string)
  dim obj: set obj = new Toggle
  dim res: res = obj.fromString(1.3)
end function

main()
