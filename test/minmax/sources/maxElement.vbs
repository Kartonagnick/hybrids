
'--- local/hybrids                                 [test/minmax][maxElement.vbs]
'[2024-02-21][18:50:00] 002 Kartonagnick    
'  --- CastleOfDreams/hybrids                             [test][maxElement.vbs]
'  [2022-01-26][19:00:00] 002 Kartonagnick
'  [2022-01-04][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams/vbs                               [test][maxElement.vbs]
'    [2021-07-19][20:00:00] 001 Kartonagnick

dim deep: deep = 0

sub test(id, a, b, must)
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
  test 1, 1, 2, 2
  test 2, 2, 2, 2
  test 2, 2, 1, 2
  if not gMY_TEST then
    echo deep, "[ERROR] maxElement"
    WScript.Quit 1
  end if
end function

main()
