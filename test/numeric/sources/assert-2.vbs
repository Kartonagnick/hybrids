
'--- local/hybrids                                  [test/numeric][assert-2.vbs]
'[2024-07-24][19:00:00] 001 Kartonagnick    

function main()
 '[ERROR][ASSERT] toNumeric: unexpected object: 'ArrayList'
  dim lst: set lst = CreateObject("System.Collections.ArrayList")
  dim real: real = toNumeric(lst)
end function

main()
