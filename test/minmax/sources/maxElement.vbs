
'--- local/hybrids                                 [test/minmax][maxElement.vbs]
'[2024-02-21][18:50:00] 002 Kartonagnick    
'  --- CastleOfDreams/hybrids                             [test][maxElement.vbs]
'  [2022-01-26][19:00:00] 002 Kartonagnick
'  [2022-01-04][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams/vbs                               [test][maxElement.vbs]
'    [2021-07-19][20:00:00] 001 Kartonagnick

sub test(id, deep, a, b, must)
  dim real: real = maxElement(a, b)
  if real <> must then
    echo deep, "-----------------------------"
    echo deep, "[" & id & "][ERROR] a = " & a
    echo deep, "[" & id & "][ERROR] b = " & b
    echo deep, "[" & id & "][ERROR] must: " & must
    echo deep, "[" & id & "][ERROR] real: " & real
    gMY_TEST = false
  end if
end sub


function main()

  dim deep: deep = 0

  test 1, deep, 1, 2, 2
  test 2, deep, 2, 2, 2
  test 2, deep, 2, 1, 2

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] maxElement"
  else
    echo deep, "[ERROR] maxElement"
    WScript.Quit 1
  end if
end function

main()
