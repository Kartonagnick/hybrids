
'--- local/hybrids                       [test/path/canonicalPathList][main.vbs]
'[2024-02-21][12:30:00] 001 Kartonagnick    
'  --- CastleOfDreams/hybrids                      [test][canonicalPathList.vbs]
'  [2022-02-10][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams/vbs                        [test][canonicalPathList.vbs]
'    [2021-07-24][20:00:00] 001 Kartonagnick

sub test(id, deep, path, etalon)
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
  dim deep: deep = 0

  test  1, deep, "path"   , "path"
  test  2, deep, "a/b/c"  , "a\b\c"
  test  3, deep, "a/b/c/" , "a\b\c"
  test  4, deep, "a//b/\c", "a\b\c"
  test  5, deep, "a/\/\\/b///\\/\c"   , "a\b\c"
  test  6, deep, "a/b/../c/d"         , "a\c\d"
  test  7, deep, "a/b/../c/d/f"       , "a\c\d\f"
  test  8, deep, "a/b/../../c/d"      , "c\d"
  test  9, deep, "a/b/../../../c/d"   , "..\c\d"
  test 10, deep, "a/b/../../../../c/d", "..\..\c\d"

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] canonicalPathList"
  else
    echo deep, "[ERROR] canonicalPathList"
    WScript.Quit 1
  end if
end function

main()
