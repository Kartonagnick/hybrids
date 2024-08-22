
'--- local/hybrids                           [test/toggle][to_bool-assert-3.vbs]
'[2024-04-23][19:00:00] 001 Kartonagnick    

function main()
  dim arr: arr = array(1,2)
  dim obj: set obj = new Toggle
  dim res: res = obj.to_bool(arr)
end function

main()
