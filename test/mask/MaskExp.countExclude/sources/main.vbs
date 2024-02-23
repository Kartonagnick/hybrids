
'--- local/hybrids                         [test/MaskExp.countExclude][main.vbs]
'[2024-02-23][06:50:00] 001 Kartonagnick    
'  --- CastleOfDreams/hybrids                     [test][mask][MaskExp/case.vbs]
'  [2022-02-06][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams/vbs                            [test][mask][MaskExp.vbs]
'    [2021-07-29][23:30:00] 001 Kartonagnick

sub test(id, deep, text, exc, expected)
  dim check: set check = new MaskExp
  check.exclude = exc
  dim result: result = check.countExclude()
  if result <> expected then
    echo deep, "-----------------------------"
    echo deep, "[" & id & "][ERROR] text    : '" & text     & "'"
    echo deep, "[" & id & "][ERROR] exclude : '" & exc      & "'"
    echo deep, "[" & id & "][ERROR] expected: '" & expected & "'"
    echo deep, "[" & id & "][ERROR] result  : '" & result   & "'"
    gMY_TEST = false
  end if
end sub

function main()

  dim deep: deep = 0

  test 1, deep, "main.cpp" , ""            , 0
  test 2, deep, "main.cpp" , "*.hpp"       , 1
  test 3, deep, "main.cpp" , "*.hpp; *.cpp", 2

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] MaskExp.countExclude"
  else
    echo deep, "[ERROR] MaskExp.countExclude"
    WScript.Quit 1
  end if
end function

main()
