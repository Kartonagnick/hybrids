
'--- local/hybrids                                [test/MaskExp.match][main.vbs]
'[2024-02-23][06:50:00] 001 Kartonagnick PRE
'  --- CastleOfDreams/hybrids                     [test][mask][MaskExp/case.vbs]
'  [2022-02-06][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams/vbs                            [test][mask][MaskExp.vbs]
'    [2021-07-29][23:30:00] 001 Kartonagnick

sub test(id, deep, text, inc, exc, expected)
  dim check: set check = new MaskExp

  with check
    .include = inc
    .exclude = exc
  end with

  dim result: result = check.match(text)
  if result <> expected then
    echo deep, "-----------------------------"
    echo deep, "[" & id & "][ERROR] text    : '" & text     & "'"
    echo deep, "[" & id & "][ERROR] include : '" & inc      & "'"
    echo deep, "[" & id & "][ERROR] exclude : '" & exc      & "'"
    echo deep, "[" & id & "][ERROR] expected: '" & expected & "'"
    echo deep, "[" & id & "][ERROR] result  : '" & result   & "'"
    gMY_TEST = false
  end if
end sub

function main()

  dim deep: deep = 0

  test  1, deep, "main.cpp" , "*.hpp; *.cpp"  , "_*; .git" , true
  test  2, deep, "main.cpp" , "*.hpp; *.cpp"  , ""         , true
  test  3, deep, "main.cpp" , ""              , "_*; .git" , true
  test  4, deep, "main.cpp" , ""              , ""         , true
  test  5, deep, "main.h"   , "*.hpp; *.cpp"  , "_*; .git" , false
  test  6, deep, "main.cpp" , "*.hpp; *.cpp"  , "_*; main*", false

  dim d_path: set d_path = g_fso.GetFolder("C:\windows")
  dim f_path: set f_path = g_fso.GetFile("C:\windows\explorer.exe")
                                                      
  test  7, deep, f_path, "*.hpp; *.cpp"    , ""         , false
  test  8, deep, f_path, "*.hpp; *.cpp"    , "_*; main*", false
  test  9, deep, f_path, "*.hpp; *.exe"    , "_*; main*", true
  test 10, deep, f_path, "*.hpp; *.exe"    , "exp*; _*" , false
  test 11, deep, f_path, ""                , "exp*; _*" , false
  test 12, deep, f_path, ""                , ""         , true
                   
  test 12, deep, d_path, "windows; backup" , ""         , true
  test 12, deep, d_path, "windows; backup" , "win*"     , false

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] MaskExp.match"
  else
    echo deep, "[ERROR] MaskExp.match"
    WScript.Quit 1
  end if
end function

main()
