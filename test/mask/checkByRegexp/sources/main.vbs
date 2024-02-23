
'--- local/hybrids                           [test/mask/checkByRegexp][main.vbs]
'[2024-02-23][08:50:00] 001 Kartonagnick    
'  --- CastleOfDreams/hybrids                    [test][checkByRegexp][case.vbs]
'  [2022-02-06][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams/vbs                            [test][checkByRegexp.vbs]
'    [2021-07-29][23:30:00] 001 Kartonagnick

dim deep: deep = 0

sub test(id, text, includes, excludes, expected)
  dim rxlist_i: set rxlist_i = masksToRegexp(includes)
  dim rxlist_e: set rxlist_e = masksToRegexp(excludes)  
  dim result: result = checkByRegexp(text, rxlist_i, rxlist_e)
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
  dim inc: inc = "main*; ext*; ;;"
  dim exc: exc = "_*; 1*; ; ;; ; "

  test  1, "main.cpp"  , inc, exc, true
  test  2, "external"  , inc, exc, true
  test  3, "_main.cpp" , inc, exc, false
  test  4, "_external" , inc, exc, false
  test  5, "1main.cpp" , inc, exc, false
  test  6, "1external" , inc, exc, false
  test  7, "ipch"      , inc, exc, false
                         
  test  8, "" , inc, exc, false
                         
  test  9, "2", "" , "1", true
  test 10, "2", "3", "1", false
  test 11, "" , "" , "" , true
  test 12, "2", "2", "" , true
  test 13, "2", "2", "*", false
  test 14, "", "*" , "" , true
  test 15, "", "*" , "*", false
  test 16, "1", "" , "" , true
  test 17, "1", "" , "*", false
                         
  test 18, "Main", inc, exc, true  

  dim d_path: set d_path = g_fso.GetFolder("C:\windows")
  dim f_path: set f_path = g_fso.GetFile("C:\windows\explorer.exe")
                         
  test 19, f_path, "explorer.*" , "11"   , true
  test 20, f_path, "explorer.*" , ""     , true
  test 21, f_path, "explorer.*" , "*.exe", false
  test 22, f_path, "main.*"     , "*.vbs", false
                         
  test 23, d_path, "windows"    , "11"   , true
  test 24, d_path, "windo?s"    , "11"   , true
  test 25, d_path, "win*"       , ""     , true
  test 26, d_path, "win*"       , "w*"   , false
  test 27, d_path, "*"          , "w*"   , false

  if not gMY_TEST then
    echo deep, "[ERROR] checkByRegexp"
    WScript.Quit 1
  end if
end function

main()
