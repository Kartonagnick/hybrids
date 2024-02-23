
'--- local/hybrids                              [test/path][isAbsolutePathn.vbs]
'[2024-02-21][12:30:00] 001 Kartonagnick    
'  --- CastleOfDreams/hybrids                         [test][isAbsolutePath.vbs]
'  [2022-02-10][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams/vbs                           [test][isAbsolutePath.vbs]
'    [2021-07-24][20:00:00] 001 Kartonagnick

' path is absolute if:
' A UNC name of any format, which always start with two backslash characters ("\\")
' A disk designator with a backslash, for example "C:\" or "d:\"
' A single backslash, for example, "\directory" or "\file.txt"
' Otherwise, according to the page, the path is relative

dim deep: deep = 0

sub test(id, path, expected)
  dim result: result = isAbsolutePath(path)
  if result <> expected then
    echo deep, "[" & id & "][ERROR] path: "     & path
    echo deep, "[" & id & "][ERROR] expected: " & expected
    echo deep, "[" & id & "][ERROR] result: "   & result
    gMY_TEST = false
  end if
end sub

function main()
  test  1, "C:/v"     , true
  test  2, "c:/v"     , true
  test  3, "C:\v"     , true
  test  4, "c:\v"     , true
  test  5, "\\Test6\" , true
  test  6, "\Test6\"  , true
  test  7, "3:/v"     , false
  test  8, "3:/v"     , false
  test  9, "3:\v"     , false
  test 10, "3:\v"     , false
  test 11, "CD:/v"    , false
  test 12, "CD:/v"    , false
  test 13, "CD:\v"    , false
  test 14, "CD:\v"    , false
  test 15, "Test8"    , false
  test 16, ".\Test9\" , false
  test 17, "..\Test10", false

  if not gMY_TEST then
    echo deep, "[ERROR] isAbsolutePath"
    WScript.Quit 1
  end if
end function

main()
