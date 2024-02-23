
'--- local/hybrids                           [test/mask/matchByRegexp][main.vbs]
'[2024-02-23][08:50:00] 001 Kartonagnick PRE
'  --- CastleOfDreams/hybrids                    [test][mask][matchByRegexp.vbs]
'  [2022-02-06][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams/vbs                      [test][mask][matchByRegexp.vbs]
'    [2021-07-29][23:30:00] 001 Kartonagnick

dim deep: deep = 0

sub test(id, text, mask, must)
  dim rx: rx = maskToRegexp(mask)
  dim result: result = matchByRegexp(text, rx)
  if result <> must then
    echo deep, "-----------------------------"
    echo deep, "[" & id & "][ERROR] type  : '" & typename(text) & "'"
    echo deep, "[" & id & "][ERROR] text  : '" & text   & "'"
    echo deep, "[" & id & "][ERROR] mask  : '" & mask   & "'"
    echo deep, "[" & id & "][ERROR] regex : '" & rx     & "'"
    echo deep, "[" & id & "][ERROR] must  : '" & must   & "'"
    echo deep, "[" & id & "][ERROR] result: '" & result & "'"
    gMY_TEST = false
  end if
end sub


function main()
  test  1, "prefix.VC.db",  "*.VC.db", true
  test  2, ".VC.db"      ,  "*.VC.db", true
  test  3, "VC.db"       ,  "*.VC.db", false
  test  4, ".VVC.db"     ,  "*.VC.db", false
  test  5, ".VX.db"      ,  "*.VC.db", false
  test  6, "text.txt"    ,  "*.txt"  , true
  test  7, ".txt"        ,  "*.txt"  , true
  test  8, "txt"         ,  "*.txt"  , false
  test  9, "txt"         ,  "*"      , true
  test 10, ""            ,  "*"      , true
  test 11, "txt"         ,  "**"     , true
  test 12, ""            ,  "**"     , true
  test 13, "txt"         ,  "??*"    , true
  test 14, "txt"         ,  "???"    , true
  test 15, "t"           ,  "??"     , false 'does not match the command line
  test 16, "txt"         ,  "??"     , false
  test 17, "t"           ,  "?"      , true
                                             
  test 18, ""            ,  "?"      , false 'does not match the command line
  test 19, ""            ,  "*"      , true
                                             
  test 20, ""            ,  ""       , true
  test 21, ""            ,  "txt"    , false
  test 22, "txt"         ,  ""       , true
                                             
  test 23, "same.lib"    ,  "s*.l?b" , true
  test 24, "same.lb"     ,  "s*.l?b" , false
  test 25, "same.lib"    ,  "s*.lib?", false 'does not match the command line
                                             
  test 26, ""            , ""        , true  ' Empty VS Empty -> true
  test 27, ""            , "*"       , true  ' Empty VS Any ---> true
  test 28, ""            , "?"       , false ' Empty VS Once --> false
  test 29, "t"           , ""        , true  ' Value VS Empty -> true
  test 30, "t"           , "?"       , true  ' Value VS Once --> check
  test 31, "tt"          , "?"       , false ' Value VS Once --> check
  test 32, "t"           , "t"       , true  ' Value VS Value -> check
  test 33, "tt"          , "t"       , false ' Value VS Value -> check

  dim d_path: set d_path = g_fso.GetFolder("C:\windows")
  dim f_path: set f_path = g_fso.GetFile("C:\windows\explorer.exe")
                                             
  test 34, f_path        , "*.exe"   , true  ' used File.Name
  test 35, f_path        , "*.txt"   , false ' used File.Name
                                             
  test 36, d_path        , "w?ndows" , true  ' used Folder.Name
  test 37, d_path        , "w*ndows" , true  ' used Folder.Name
  test 38, d_path        , "Windows" , true  ' used Folder.Name
  test 39, d_path        , "windo??" , true  ' used Folder.Name
  test 40, d_path        , "_Win?"   , false ' used Folder.Name

  if not gMY_TEST = true then
    echo deep, "[ERROR] matchByRegexp"
    WScript.Quit 1
  end if
end function

main()
