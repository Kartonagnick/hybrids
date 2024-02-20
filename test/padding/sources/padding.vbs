
'--- local/hybrids                                   [test/padding][padding.vbs]
'[2024-02-20][22:50:00] 002 Kartonagnick    
'  --- CastleOfDreams/hybrids                           [test/padding][case.vbs]
'  [2022-01-26][19:00:00] 002 Kartonagnick
'  [2021-12-23][19:00:00] 001 Kartonagnick
'    --- Kartonagnick/hybrids                            [test/padding/case.vbs]
'    [2021-01-30][19:00:00] 001 Kartonagnick

sub test(id, deep, text, count, symbol, must)
  dim real: real = padding(text, count, symbol)
  if real <> must then
    echo deep, "[" & id & "][ERROR] text : " & text
    echo deep, "[" & id & "][ERROR] count: " & count
    echo deep, "[" & id & "][ERROR] must : " & must
    echo deep, "[" & id & "][ERROR] real : " & real
    gMY_TEST = false
  end if
end sub

function main()
  dim deep: deep = 0
  test  1, deep, "1"   , 5  , "*", "****1"
  test  2, deep, "1"   , 4  , "*", "***1"
  test  3, deep, "1"   , 3  , "*", "**1"
  test  4, deep, "12"  , 3  , "*", "*12"
  test  5, deep, "123" , 3  , "*", "123"
  test  6, deep, "1234", 3  , "*", "1234"
  test  7, deep, "1"   , 0  , "*", "1"
  test  8, deep, 1     , 5  , "*", "****1"
  test  9, deep, 12    , 3  , "*", "*12"
  test 10, deep, 123   , 3  , "*", "123"
  test 11, deep, 1234  , 3  , "*", "1234"

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] padding"
  else
    echo deep, "[ERROR] padding"
    WScript.Quit 1
  end if
end function

main()
