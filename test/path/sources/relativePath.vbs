
'--- local/hybrids                                 [test/path][relativePath.vbs]
'[2024-02-21][12:30:00] 001 Kartonagnick    
'  --- CastleOfDreams/hybrids                           [test][relativePath.vbs]
'  [2022-02-10][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams/vbs                             [test][relativePath.vbs]
'    [2021-07-24][20:00:00] 001 Kartonagnick

dim deep: deep = 0

sub test(id, general, target, etalon)
  dim result: result = relativePath(general, target)
  if result <> etalon then
    echo deep, "-----------------------------"
    echo deep, "[" & id & "][ERROR] general: '" & general & "'"
    echo deep, "[" & id & "][ERROR] target: '"  & target  & "'"
    echo deep, "[" & id & "][ERROR] etalon: '"  & etalon  & "'"
    echo deep, "[" & id & "][ERROR] result: '"  & result  & "'"
    gMY_TEST = false
  end if
end sub

function main()
  test  1, "path"     , "path"                    , ""
  test  2, "a/b"      , "a/b"                     , ""
  test  3, "a/b"      , "a/b/c"                   , "c"
  test  4, "a/b"      , "a/b/c/d"                 , "c\d"
  test  5, "a/b"      , "a/f"                     , "..\f"
  test  6, "a/b"      , "a/b/c/d/../../../f"      , "..\f"
  test  7, "a/b"      , "../f"                    , "..\..\..\f"
  test  8, "a/b"      , "a/b/c/d/../../../../../f", "..\..\..\f"
  test  9, "a/b"      , "a/c/d"                   , "..\c\d"
  test 10, "a/c"      , "../f"                    , "..\..\..\f"
  test 11, "a/b/../c" , "a/b/c/d/../../../../../f", "..\..\..\f"
  test 12,  "a/b/c/d" , "../c/d"                  , "..\..\..\..\..\c\d"
  test 13, "a/c"      , "f"                       , "..\..\f"
  test 14, "a/b/c"    , "a/f"                     , "..\..\f"
  test 15, "a/b/c"    , "b/f"                     , "..\..\..\b\f"
  test 16, ""         , ""                        , ""
  test 17, ""         , "a/b/c"                   , "a\b\c"
  test 18, ""         , "a/b/../c"                , "a\c"
  test 19, "a/b/c"    , ""                        , "a\b\c"
  test 20, "a/b/../c" , ""                        , "a\c"

  if not gMY_TEST then
    echo deep, "[ERROR] isAbsolutePath"
    WScript.Quit 1
  end if
end function

main()
