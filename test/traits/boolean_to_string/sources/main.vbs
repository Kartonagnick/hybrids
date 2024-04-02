
'--- local/hybrids                    [test][traits/boolean_to_string][main.vbs]
'[2024-04-02][06:10:00] 001 Kartonagnick    

sub test(id, deep, src, must)
  dim real: real = boolean_to_string(src)
  if real <> must then
    echo deep, "[" & id & "][ERROR] src  : " & src
    echo deep, "[" & id & "][ERROR] must : " & must
    echo deep, "[" & id & "][ERROR] real : " & real
    gMY_TEST = false
  end if
end sub


function main()

  dim deep: deep = 0

  test 1, deep, true  ,  "true"
  test 2, deep, false ,  "false"

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] boolean_to_string"
  else
    echo deep, "[ERROR] boolean_to_string"
    WScript.Quit 1
  end if
end function

main()
