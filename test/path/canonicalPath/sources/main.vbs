
'--- local/hybrids                           [test/path/canonicalPath][main.vbs]
'[2024-02-21][12:30:00] 001 Kartonagnick    
'  --- CastleOfDreams/hybrids                          [test][canonicalPath.vbs]
'  [2022-02-10][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams/vbs                            [test][canonicalPath.vbs]
'    [2021-07-24][20:00:00] 001 Kartonagnick

' path is absolute if:
' A UNC name of any format, which always start with two backslash characters ("\\")
' A disk designator with a backslash, for example "C:\" or "d:\"
' A single backslash, for example, "\directory" or "\file.txt"
' Otherwise, according to the page, the path is relative

sub test(id, deep, path, expected)
  dim result: result = canonicalPath(path)
  if result <> expected then
    echo deep, "[" & id & "][ERROR] path: "     & path
    echo deep, "[" & id & "][ERROR] expected: " & expected
    echo deep, "[" & id & "][ERROR] result: "   & result
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
   'echo deep, "[SUCCESS] canonicalPath"
  else
    echo deep, "[ERROR] canonicalPath"
    WScript.Quit 1
  end if
end function

main()
