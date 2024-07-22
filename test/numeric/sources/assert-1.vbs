
'--- local/hybrids                                  [test/numeric][assert-1.vbs]
'[2024-07-24][19:00:00] 001 Kartonagnick PRE

function main()
 '[ERROR][ASSERT] toNumeric: unexpected type: 'Array'
  dim arr: arr = array(1,2)
  dim real: real = toNumeric(arr)
end function

main()
