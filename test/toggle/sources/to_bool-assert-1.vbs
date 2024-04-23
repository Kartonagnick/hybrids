
'--- local/hybrids                           [test/toggle][to_bool-assert-1.vbs]
'[2024-04-23][19:00:00] 001 Kartonagnick PRE

function main()
  dim obj: set obj = new Toggle
  dim res: res = obj.to_bool("text")
end function

main()
