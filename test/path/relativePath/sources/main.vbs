
'--- local/hybrids                            [test/path/relativePath][main.vbs]
'[2024-02-21][12:30:00] 001 Kartonagnick PRE
'  --- CastleOfDreams/hybrids                           [test][relativePath.vbs]
'  [2022-02-10][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams/vbs                             [test][relativePath.vbs]
'    [2021-07-24][20:00:00] 001 Kartonagnick

sub test(id, deep, general, target, etalon)
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

  dim deep: deep = 0

  test  1, deep, "path"     , "path"                    , ""
  test  2, deep, "a/b"      , "a/b"                     , ""
  test  3, deep, "a/b"      , "a/b/c"                   , "c"
  test  4, deep, "a/b"      , "a/b/c/d"                 , "c\d"
  test  5, deep, "a/b"      , "a/f"                     , "..\f"
  test  6, deep, "a/b"      , "a/b/c/d/../../../f"      , "..\f"
  test  7, deep, "a/b"      , "../f"                    , "..\..\..\f"
  test  8, deep, "a/b"      , "a/b/c/d/../../../../../f", "..\..\..\f"
  test  9, deep, "a/b"      , "a/c/d"                   , "..\c\d"
  test 10, deep, "a/c"      , "../f"                    , "..\..\..\f"
  test 11, deep, "a/b/../c" , "a/b/c/d/../../../../../f", "..\..\..\f"
  test 12, deep,  "a/b/c/d" , "../c/d"                  , "..\..\..\..\..\c\d"
  test 13, deep, "a/c"      , "f"                       , "..\..\f"
  test 14, deep, "a/b/c"    , "a/f"                     , "..\..\f"
  test 15, deep, "a/b/c"    , "b/f"                     , "..\..\..\b\f"
  test 16, deep, ""         , ""                        , ""
  test 17, deep, ""         , "a/b/c"                   , "a\b\c"
  test 18, deep, ""         , "a/b/../c"                , "a\c"
  test 19, deep, "a/b/c"    , ""                        , "a\b\c"
  test 20, deep, "a/b/../c" , ""                        , "a\c"

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] isAbsolutePath"
  else
    echo deep, "[ERROR] isAbsolutePath"
    WScript.Quit 1
  end if
end function

main()
