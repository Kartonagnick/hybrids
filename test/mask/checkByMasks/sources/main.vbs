
'--- local/hybrids                            [test/mask/checkByMasks][main.vbs]
'[2024-02-23][08:50:00] 001 Kartonagnick PRE
'  --- CastleOfDreams/hybrids                     [test][checkByMasks][case.vbs]
'  [2022-02-06][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams/vbs                             [test][checkByMasks.vbs]
'    [2021-07-29][23:30:00] 001 Kartonagnick

sub test(id, deep, text, includes, excludes, expected)
  dim result: result = checkByMasks(text, includes, excludes)
  if result <> expected then
    echo deep, "[" & id & "][ERROR] text: '"     & text      & "'"
    echo deep, "[" & id & "][ERROR] include: '"  & includes  & "'"
    echo deep, "[" & id & "][ERROR] exclude: '"  & excludes  & "'"
    echo deep, "[" & id & "][ERROR] expected: '" & expected  & "'"
    echo deep, "[" & id & "][ERROR] result: '"   & result    & "'"
    gMY_TEST = false
  end if
end sub

function main()

  dim deep: deep = 0

  dim inc: inc = "main*; ext*; ;;"
  dim exc: exc = "_*; 1*; ; ;; ; "

  test  1, deep, "main.cpp"  , inc, exc, true
  test  2, deep, "external"  , inc, exc, true
  test  3, deep, "_main.cpp" , inc, exc, false
  test  4, deep, "_external" , inc, exc, false
  test  5, deep, "1main.cpp" , inc, exc, false
  test  6, deep, "1external" , inc, exc, false
  test  7, deep, "ipch"      , inc, exc, false
                        
  test  8, deep, "" , inc, exc, false
  test  9, deep, "2", "" , "1", true
  test 10, deep, "2", "3", "1", false
  test 11, deep, "" , "" , "" , true
  test 12, deep, "2", "2", "" , true
  test 13, deep, "2", "2", "*", false
  test 14, deep, "" , "*", "" , true
  test 15, deep, "" , "*", "*", false
  test 16, deep, "1", "" , "" , true
  test 17, deep, "1", "" , "*", false
                        
  test 18, deep, "Main", inc, exc, true  

  dim d_path: set d_path = g_fso.GetFolder("C:\windows")
  dim f_path: set f_path = g_fso.GetFile("C:\windows\explorer.exe")
                        
  test 19, deep, f_path, "explorer.*", "11"   , true
  test 20, deep, f_path, "explorer.*", ""     , true
  test 21, deep, f_path, "explorer.*", "*.exe", false
  test 22, deep, f_path, "main.*"    , "*.exe", false
                        
  test 23, deep, d_path, "windows"   , "11"   , true

  test 24, deep, d_path, "win?ows"   , "11"   , true
  test 25, deep, d_path, "wind*"     , ""     , true
  test 26, deep, d_path, "wind*"     , "win*" , false
  test 27, deep, d_path, "*"         , "win*" , false

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] checkByMasks"
  else
    echo deep, "[ERROR] checkByMasks"
    WScript.Quit 1
  end if
end function

main()
