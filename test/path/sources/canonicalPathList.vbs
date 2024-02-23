
'--- local/hybrids                            [test/path][canonicalPathList.vbs]
'[2024-02-21][12:30:00] 001 Kartonagnick    
'  --- CastleOfDreams/hybrids                      [test][canonicalPathList.vbs]
'  [2022-02-10][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams/vbs                        [test][canonicalPathList.vbs]
'    [2021-07-24][20:00:00] 001 Kartonagnick

dim deep: deep = 0

sub test(id, path, etalon)
  dim result 
  result = canonicalPathList(path).toArray()
  result = Join(result, "\")
  if result <> etalon then
    echo deep, "[" & id & "][ERROR] path: "   & path
    echo deep, "[" & id & "][ERROR] etalon: " & etalon
    echo deep, "[" & id & "][ERROR] result: " & result
    gMY_TEST = false
  end if
end sub

function main()

  test  1, "path"   , "path"
  test  2, "a/b/c"  , "a\b\c"
  test  3, "a/b/c/" , "a\b\c"
  test  4, "a//b/\c", "a\b\c"
  test  5, "a/\/\\/b///\\/\c"   , "a\b\c"
  test  6, "a/b/../c/d"         , "a\c\d"
  test  7, "a/b/../c/d/f"       , "a\c\d\f"
  test  8, "a/b/../../c/d"      , "c\d"
  test  9, "a/b/../../../c/d"   , "..\c\d"
  test 10, "a/b/../../../../c/d", "..\..\c\d"

  if not gMY_TEST then
    echo deep, "[ERROR] canonicalPathList"
    WScript.Quit 1
  end if
end function

main()
