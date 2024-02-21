
'--- local/hybrids                          [test/path/isAbsolutePath][main.vbs]
'[2024-02-21][12:30:00] 002 Kartonagnick    
'  --- CastleOfDreams/hybrids                         [test][isAbsolutePath.vbs]
'  [2022-02-10][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams/vbs                           [test][isAbsolutePath.vbs]
'    [2021-07-24][20:00:00] 001 Kartonagnick

' path is absolute if:
' A UNC name of any format, which always start with two backslash characters ("\\")
' A disk designator with a backslash, for example "C:\" or "d:\"
' A single backslash, for example, "\directory" or "\file.txt"
' Otherwise, according to the page, the path is relative

sub test(id, deep, path, expected)
  dim result: result = isAbsolutePath(path)
  if result <> expected then
    echo deep, "[" & id & "][ERROR] path: "     & path
    echo deep, "[" & id & "][ERROR] expected: " & expected
    echo deep, "[" & id & "][ERROR] result: "   & result
    gMY_TEST = false
  end if
end sub

function main()

  dim deep: deep = 0

  test 1 , deep, "C:/v"     , true
  test 2 , deep, "c:/v"     , true
  test 3 , deep, "C:\v"     , true
  test 4 , deep, "c:\v"     , true
  test 5 , deep, "\\Test6\" , true
  test 6 , deep, "\Test6\"  , true
  test 7 , deep, "3:/v"     , false
  test 8 , deep, "3:/v"     , false
  test 9 , deep, "3:\v"     , false
  test 10, deep, "3:\v"     , false
  test 11, deep, "CD:/v"    , false
  test 12, deep, "CD:/v"    , false
  test 13, deep, "CD:\v"    , false
  test 14, deep, "CD:\v"    , false
  test 15, deep, "Test8"    , false
  test 16, deep, ".\Test9\" , false
  test 17, deep, "..\Test10", false

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] isAbsolutePath"
  else
    echo deep, "[ERROR] isAbsolutePath"
    WScript.Quit 1
  end if
end function

main()
