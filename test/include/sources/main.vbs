
'--- local/hybrids                                      [test/include][main.vbs]
'[2024-10-10][19:00:00] 001 Kartonagnick PRE

dim deep: deep = 0

includeVBS("glob.vbs")
includeVBS("echo.vbs")
includeVBS("path.vbs")

sub test(id, path, expected)
  dim result: result = canonicalPath(path)
  if result <> expected then
    echo deep, "[" & id & "][ERROR] path: "     & path
    echo deep, "[" & id & "][ERROR] expected: " & expected
    echo deep, "[" & id & "][ERROR] result: "   & result
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
    echo deep, "[ERROR] include (canonicalPath)"
    WScript.Quit 1
  end if
end function

main()
