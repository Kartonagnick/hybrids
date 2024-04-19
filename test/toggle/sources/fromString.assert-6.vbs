
'--- local/hybrids                        [test/toggle][fromString.assert-6.vbs]
'[2024-04-19][19:00:00] 001 Kartonagnick PRE

function main()
' [ERROR][ASSERT] Toogle.fromString: invalid type: 'Integer' (must be string)
  dim obj: set obj = new Toggle
  dim res: res = obj.fromString(1)
end function

main()
