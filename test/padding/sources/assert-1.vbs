
'--- local/hybrids                                  [test/padding][assert-1.vbs]
'[2024-02-20][22:50:00] 002 Kartonagnick PRE
'  --- CastleOfDreams/hybrids                  [test/padding/assert-1][case.vbs]
'  [2022-01-26][19:00:00] 002 Kartonagnick
'  [2021-12-23][19:00:00] 001 Kartonagnick

function main()
 'expected: assert(padding: can not be < 0)
  dim text:   text ="1"
  dim count:  count = -1
  dim symbol: symbol = "*"
  dim unused: unused = padding(text, count, symbol)
end function

main()
