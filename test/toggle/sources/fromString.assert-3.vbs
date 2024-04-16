
'--- local/hybrids                        [test/toggle][fromString.assert-3.vbs]
'[2024-04-19][19:00:00] 001 Kartonagnick PRE

function main()
' [ERROR][ASSERT] Toogle.fromString: invalid type: 'Nothing' (must be string)
  dim obj: set obj = new Toggle
  dim res: res = obj.fromString(Nothing)
end function

main()
