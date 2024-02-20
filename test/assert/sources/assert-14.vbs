
'--- local/hybrids                                   [test/assert][assert-14.vbs]
'[2024-02-20][22:00:00] 003 Kartonagnick PRE
'  --- CastleOfDreams/hybrids                          [test][assert-14/main.vbs]
'  [2022-01-26][19:00:00] 002 Kartonagnick
'  [2021-12-20][19:00:00] 001 Kartonagnick

class Sample
end class

function main()
  dim obj: set obj = new Sample
  assert "test-assert", "example", obj
end function

main()
