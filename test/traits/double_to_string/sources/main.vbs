
'--- local/hybrids                     [test][traits/double_to_string][main.vbs]
'[2024-04-02][06:10:00] 001 Kartonagnick    

sub test(id, deep, src, must)
  dim real: real = double_to_string(src)
  if real <> must then
    echo deep, "[" & id & "][ERROR] src  : " & src
    echo deep, "[" & id & "][ERROR] must : " & must
    echo deep, "[" & id & "][ERROR] real : " & real
    gMY_TEST = false
  end if
end sub


function main()

  dim deep: deep = 0

  test 1, deep,  0    ,  "0"
  test 2, deep,  1    ,  "1"
  test 3, deep,  1.34 ,  "1.34"
  test 4, deep, -1.34 ,  "-1.34"
  test 5, deep, -1    ,  "-1"

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] double_to_string"
  else
    echo deep, "[ERROR] double_to_string"
    WScript.Quit 1
  end if
end function

main()
