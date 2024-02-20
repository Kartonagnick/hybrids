
'--- local/hybrids                                        [test/trim][front.vbs]
'[2024-02-21][01:30:00] 002 Kartonagnick    
'  --- CastleOfDreams/hybrids                              [test][trimFront.vbs]
'  [2022-01-26][19:00:00] 002 Kartonagnick
'  [2021-12-11][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams/vbs                                [test][trimFront.vbs]
'    [2021-07-22][19:00:00] 001 Kartonagnick

dim deep: deep = 0

sub test(id, text, chars, expected)
  dim result: result = trimFront(text, chars)
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
  test 1,  "text"     , "\ ", "text"
  test 2,  " text"    , "\ ", "text"
  test 3,  "  text"   , "\ ", "text"
  test 4,  "\text"    , "\ ", "text"
  test 5,  "\\text"   , "\ ", "text"
  test 6,  " \text"   , "\ ", "text"
  test 7,  " \\text"  , "\ ", "text"
  test 8,  "\ \text"  , "\ ", "text"
  test 9,  "\\ \\text", "\ ", "text"
  test 10, "\ text"   , "\ ", "text"
  test 11, "\\ text"  , "\ ", "text"
  test 12,  ""        , "\ ", ""

  if not gMY_TEST then
    echo deep, "[ERROR] trimFront"
    WScript.Quit 1
  end if
end function

main()
