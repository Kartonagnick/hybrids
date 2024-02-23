
'--- local/hybrids                             [test/mask/matchByMask][main.vbs]
'[2024-02-23][09:20:00] 001 Kartonagnick PRE
'  --- CastleOfDreams/hybrids                      [test][mask][matchByMask.vbs]
'  [2022-02-06][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams/vbs                        [test][mask][matchByMask.vbs]
'    [2021-07-29][23:30:00] 001 Kartonagnick

sub test(id, deep, text, mask, must)
  dim result: result = matchByMask(text, mask)
  if result <> must then
    echo deep, "-----------------------------"
    echo deep, "[" & id & "][ERROR] text: '"   & text   & "'"
    echo deep, "[" & id & "][ERROR] mask: '"   & mask   & "'"
    echo deep, "[" & id & "][ERROR] must: '"   & must   & "'"
    echo deep, "[" & id & "][ERROR] result: '" & result & "'"
    gMY_TEST = false
  end if
end sub


function main()

  dim deep: deep = 0
                         
  test  1, deep, "prefix.VC.db",  "*.VC.db", true
  test  2, deep, ".VC.db"      ,  "*.VC.db", true
  test  3, deep, "VC.db"       ,  "*.VC.db", false
  test  4, deep, ".VVC.db"     ,  "*.VC.db", false
  test  5, deep, ".VX.db"      ,  "*.VC.db", false
  test  6, deep, "text.txt"    ,  "*.txt"  , true
  test  7, deep, ".txt"        ,  "*.txt"  , true
  test  8, deep, "txt"         ,  "*.txt"  , false
  test  9, deep, "txt"         ,  "*"      , true
  test 10, deep, ""            ,  "*"      , true
  test 11, deep, "txt"         ,  "**"     , true
  test 12, deep, ""            ,  "**"     , true
  test 13, deep, "txt"         ,  "??*"    , true
  test 14, deep, "txt"         ,  "???"    , true
  test 15, deep, "t"           ,  "??"     , false 'does not match the command line
  test 16, deep, "txt"         ,  "??"     , false
  test 17, deep, "t"           ,  "?"      , true
                                           
  test 18, deep, ""            ,  "?"      , false 'does not match the command line
  test 19, deep, ""            ,  "*"      , true
                                           
  test 20, deep, ""            ,  ""       , true
  test 21, deep, ""            ,  "txt"    , false
  test 22, deep, "txt"         ,  ""       , true
                                           
  test 23, deep, "same.lib"    ,  "s*.l?b" , true
  test 24, deep, "same.lb"     ,  "s*.l?b" , false
  test 25, deep, "same.lib"    ,  "s*.lib?", false 'does not match the command line
				   
  test 26, deep, ""            , ""        , true  ' Empty VS Empty -> true
  test 27, deep, ""            , "*"       , true  ' Empty VS Any ---> true
  test 28, deep, ""            , "?"       , false ' Empty VS Once --> false
  test 29, deep, "t"           , ""        , true  ' Value VS Empty -> true
  test 30, deep, "t"           , "?"       , true  ' Value VS Once --> check
  test 31, deep, "tt"          , "?"       , false ' Value VS Once --> check
  test 32, deep, "t"           , "t"       , true  ' Value VS Value -> check
  test 33, deep, "tt"          , "t"       , false ' Value VS Value -> check

  dim d_path: set d_path = g_fso.GetFolder("C:\windows")
  dim f_path: set f_path = g_fso.GetFile("C:\windows\explorer.exe")
                                           
  test 34, deep, f_path        , "*.exe"   , true
  test 35, deep, f_path        , "*.txt"   , false
                                           
  test 36, deep, d_path        , "w?ndows" , true
  test 37, deep, d_path        , "w*ndows" , true
  test 38, deep, d_path        , "Windows" , true
  test 39, deep, d_path        , "Win??ws" , true
  test 40, deep, d_path        , "_Win?"   , false

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] matchByMask"
  else
    echo deep, "[ERROR] matchByMask"
    WScript.Quit 1
  end if
end function

main()
