'--- local/hybrids                                    [test/twodigits][main.vbs]
'[2024-02-18][03:25:00] 003 Kartonagnick    
'  --- CastleOfDreams/hybrids                            [test/common][main.vbs]
'  [2022-01-26][19:00:00] 003 Kartonagnick
'  [2022-01-04][19:00:00] 002 Kartonagnick
'  [2021-07-28][19:00:00] 001 Kartonagnick

sub test(id, deep, num, must)
  dim real: real = twoDigits(num)
  if real <> must then
    echo deep, "[" & id & "][ERROR] num  : " & num
    echo deep, "[" & id & "][ERROR] must : " & must
    echo deep, "[" & id & "][ERROR] real : " & real
    gMY_TEST = false
  end if
end sub

function main()
  dim deep: deep = 0

  test 1, deep, 1    , "01"
  test 2, deep, 2    , "02"
  test 3, deep, 10   , "10"
  test 4, deep, 12   , "12"
  test 5, deep, 123  , "123"
  test 6, deep, 1234 , "1234"
  test 7, deep, -1   , "-1"
  test 8, deep, "a"  , "0a"
  test 8, deep, "aa" , "aa"

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] twoDigits"
  else
    echo deep, "[ERROR] twoDigits"
    WScript.Quit 1
  end if
end function

main()
