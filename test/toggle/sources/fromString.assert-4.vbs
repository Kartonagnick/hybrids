
'--- local/hybrids                        [test/toggle][fromString.assert-4.vbs]
'[2024-04-19][19:00:00] 001 Kartonagnick PRE

class TestDummy
end class

function main()
' [ERROR][ASSERT] Toogle.fromString: invalid type: 'TestDummy' (must be string)
  dim obj: set obj = new Toggle
  dim tst: set tst = new TestDummy
  dim res: res = obj.fromString(tst)
end function

main()
