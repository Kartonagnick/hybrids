
'--- local/hybrids                                        [test/strip][back.vbs]
'[2025-01-15][23:40:00] 001 Kartonagnick    

dim deep: deep = 0

sub test(id, text, back, expected)
  dim result: result = stripBack(text, back)
  if result <> expected then
    echo deep, "-----------------------------"
    echo deep, "[" & id & "][ERROR] text: '"     & text     & "'"
    echo deep, "[" & id & "][ERROR] back: '"     & back     & "'"
    echo deep, "[" & id & "][ERROR] expected: '" & expected & "'"
    echo deep, "[" & id & "][ERROR] result: '"   & result   & "'"
    gMY_TEST = false
  end if
end sub

function main()
  test 1,  "1.2.3 ver"    , " ver" , "1.2.3"
  test 2,  " ver"         , " ver" , ""
  test 3,  " "            , " "    , ""
  test 4,  "version 1.2.3", " ver" , "version 1.2.3"
  test 5,  "ver 1.2.3"    , ""     , "ver 1.2.3"
  test 6,  ""             , " ver" , ""

  if not gMY_TEST then
    echo deep, "[ERROR] stripBack"
    WScript.Quit 1
  end if
end function

main()
