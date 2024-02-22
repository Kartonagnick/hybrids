
'--- local/hybrids                         [test/mask/MaskExp][countExclude.vbs]
'[2024-02-23][06:50:00] 001 Kartonagnick PRE
'  --- CastleOfDreams/hybrids                     [test][mask][MaskExp/case.vbs]
'  [2022-02-06][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams/vbs                            [test][mask][MaskExp.vbs]
'    [2021-07-29][23:30:00] 001 Kartonagnick

dim deep: deep = 0

sub test(id, text, exc, expected)
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
  test 1, "main.cpp" , ""            , 0
  test 2, "main.cpp" , "*.hpp"       , 1
  test 3, "main.cpp" , "*.hpp; *.cpp", 2
  if not gMY_TEST then
    echo deep, "[ERROR] MaskExp.countExclude"
    WScript.Quit 1
  end if
end function

main()
