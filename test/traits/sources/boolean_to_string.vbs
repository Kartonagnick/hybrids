
'--- local/hybrids                         [test][traits][boolean_to_string.vbs]
'[2024-04-02][06:10:00] 001 Kartonagnick PRE

dim deep: deep = 0

sub test(id, src, must)
  dim real: real = boolean_to_string(src)
  if real <> must then
    echo deep, "[" & id & "][ERROR] src  : " & src
    echo deep, "[" & id & "][ERROR] must : " & must
    echo deep, "[" & id & "][ERROR] real : " & real
    gMY_TEST = false
  end if
end sub

function main()
  test 1, true  ,  "true"
  test 2, false ,  "false"
  if not gMY_TEST then
    echo deep, "[ERROR] boolean_to_string"
    WScript.Quit 1
  end if
end function

main()
