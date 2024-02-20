
'--- local/hybrids                                         [test/trim][both.vbs]
'[2024-02-21][01:30:00] 002 Kartonagnick    
'  --- CastleOfDreams/hybrids                               [test][trimBoth.vbs]
'  [2022-01-26][19:00:00] 002 Kartonagnick
'  [2021-12-11][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams/vbs                                 [test][trimBoth.vbs]
'    [2021-07-22][19:00:00] 001 Kartonagnick


sub test(id, deep, text, chars, expected)
  dim result: result = trimBoth(text, chars)
  if result <> expected then
    echo deep, "-----------------------------"
    echo deep, "[" & id & "][ERROR] text: '"     & text     & "'"
    echo deep, "[" & id & "][ERROR] chars: '"    & chars    & "'"
    echo deep, "[" & id & "][ERROR] expected: '" & expected & "'"
    echo deep, "[" & id & "][ERROR] result: '"   & result   & "'"
    gMY_TEST = false
  end if
end sub


function main()

  dim deep: deep = 0

  test 1,  deep, "text"           , "\ ", "text"
  test 2,  deep, " text "         , "\ ", "text"
  test 3,  deep, "  text  "       , "\ ", "text"
  test 4,  deep, "\text\"         , "\ ", "text"
  test 5,  deep, "\\text\\"       , "\ ", "text"
  test 6,  deep, " \text\ "       , "\ ", "text"
  test 7,  deep, " \\text\\ "     , "\ ", "text"
  test 8,  deep, "\ \text\ \"     , "\ ", "text"
  test 9,  deep, "\\ \\text\\  \\", "\ ", "text"
  test 10, deep, "\ text \"       , "\ ", "text"
  test 11, deep, "\\ text \\"     , "\ ", "text"

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] trimBoth"
  else
    echo deep, "[ERROR] trimBoth"
    WScript.Quit 1
  end if
end function

main()
