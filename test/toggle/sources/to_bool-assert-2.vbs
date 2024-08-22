
'--- local/hybrids                           [test/toggle][to_bool-assert-2.vbs]
'[2024-04-23][19:00:00] 001 Kartonagnick    

class TestDummy
end class

function main()
  dim obj: set obj = new Toggle
  dim tst: set tst = new TestDummy
  dim res: res = obj.to_bool(tst)
end function

main()
