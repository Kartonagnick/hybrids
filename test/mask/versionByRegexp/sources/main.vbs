
'--- local/hybrids                         [test/mask/versionByRegexp][main.vbs]
'[2024-02-23][08:50:00] 001 Kartonagnick    
'  --- CastleOfDreams/hybrids                  [test][mask][versionByRegexp.vbs]
'  [2022-02-06][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams/vbs                    [test][mask][versionByRegexp.vbs]
'    [2021-07-29][23:30:00] 001 Kartonagnick

dim deep: deep = 0

sub test(id, prefix, line, expected)
  dim result: result = versionByRegexp(prefix, line)
  if result <> expected then
    echo deep, "-----------------------------"
    echo deep, "[" & id & "][ERROR] prefix: '"   & prefix   & "'"
    echo deep, "[" & id & "][ERROR] line: '"     & line     & "'"
    echo deep, "[" & id & "][ERROR] expected: '" & expected & "'"
    echo deep, "[" & id & "][ERROR] result: '"   & result   & "'"
    gMY_TEST = false
  end if
end sub


function main()
  test  1, "\bversion:?\s"  , "version 12.354.56"        , "12.354.56"
  test  2, "\bversion:?\s"  , "VeRsIoN 12.354.56"        , "12.354.56"
  test  3, ".*\bversion:?\s", "ololo version: 12.354.56" , "12.354.56"
  test  4, "\bversion:?\s"  , "ololo version: 12.354.56" , "12.354.56"
  test  5, "\bversion:?\s"  , "ololo version 12.354.56"  , "12.354.56"
  test  6, "\bversion:?\s"  , "ololo version: 12.1354.56", ""
  test  7, "\bver:?\s"      , "ololo version: 12.13.56"  , ""
  test  8, "\version:?\s"   , "ololo version: 12.13.56d" , ""
  test  9, "\version:?\s"   , "ololo version: 12.13d.56" , ""
  test 10, "\version:?\s"   , "ololo version: 12d.13.56" , ""
  
  test 11, "\b(версия|ver|version):?\s", "version: 12.13.56", "12.13.56"
  test 12, "\b(версия|ver|version):?\s", "ver 12.13.56"     , "12.13.56"
  test 13, "(\b(ver|version):?\s)|(v)" , "ver 12.13.56"     , "12.13.56"
  
  test 14, "version:\s*", "ololo ver: v12.34.56 end"    , ""
  test 15, "version:\s*", "ololo version: 12.34.56 end" , "12.34.56"
  test 16, "version:\s*", "ololo version: v12.34.56 end", "12.34.56"
  test 17, ""           , "ololo version: 12.34.56 end" , "12.34.56"
  test 18, ""           , "ololo version: v12.34.56 end", "12.34.56"
  test 19, ""           , "v12.13.56"                   , "12.13.56"
  test 20, ""           , "ololo version: b12.34.56 end", ""

  if not gMY_TEST then
    echo deep, "[ERROR] versionByRegexp"
    WScript.Quit 1
  end if
end function

main()
