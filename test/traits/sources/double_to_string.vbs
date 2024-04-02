
'--- local/hybrids                          [test][traits][double_to_string.vbs]
'[2024-04-02][06:10:00] 001 Kartonagnick PRE

dim deep: deep = 0

sub test(id, src, must)
  dim real: real = double_to_string(src)
  if real <> must then
    echo deep, "[" & id & "][ERROR] src  : " & src
    echo deep, "[" & id & "][ERROR] must : " & must
    echo deep, "[" & id & "][ERROR] real : " & real
    gMY_TEST = false
  end if
end sub

function main()
  test 1,  0    ,  "0"
  test 2,  1    ,  "1"
  test 3,  1.34 ,  "1.34"
  test 4, -1.34 ,  "-1.34"
  test 5, -1    ,  "-1"

  if not gMY_TEST then
    echo deep, "[ERROR] double_to_string"
    WScript.Quit 1
  end if
end function

main()
