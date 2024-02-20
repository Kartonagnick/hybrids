
'--- local/hybrids                                  [test/padding][assert-3.vbs]
'[2024-02-20][22:50:00] 002 Kartonagnick    
'  --- CastleOfDreams/hybrids                  [test/padding/assert-3][case.vbs]
'  [2022-01-26][19:00:00] 002 Kartonagnick
'  [2021-12-23][19:00:00] 001 Kartonagnick

function main()
 'expected: assert(expected single symbol)
  dim text:   text ="1"
  dim count:  count = 4
  dim symbol: symbol = "qw"
  dim unused: unused = padding(text, count, symbol)
end function

main()
