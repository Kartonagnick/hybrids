
'--- local/hybrids                                      [test/unquote][main.vbs]
'[2026-01-28][18:10:00] 001 Kartonagnick PRE

dim deep: deep = 0

sub test(id, source, etalon)
  dim result: result = unquote(etalon)
  if result <> etalon then
    echo deep, "-----------------------------"
    echo deep, "[" & id & "][ERROR] source: '" & source & "'"
    echo deep, "[" & id & "][ERROR] etalon: '" & etalon & "'"
    echo deep, "[" & id & "][ERROR] result: '" & result & "'"
    gMY_TEST = false
  end if
end sub

function main()

  dim text: text = chr(34) & "text" & chr(34)
  test 1, "text" , "text" 
  test 2,  text  , "text" 

  if not gMY_TEST then
    echo deep, "[ERROR] unquote"
    WScript.Quit 1
  end if

end function

main()
