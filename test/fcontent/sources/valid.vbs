                                                
'--- local/hybrids                                    [test/fcontent][valid.vbs]
'[2025-01-13][12:50:00] 001 Kartonagnick PRE
' includeVBS("glob.vbs")
' includeVBS("fcontent.vbs")

dim deep: deep = 0
dim loader: set loader = new FileContent
dim dir: dir = getWorkDirectory() & "\resources\valid"

function getWorkDirectory()
  dim d_work
  d_work = WScript.ScriptFullName
  d_work = g_fso.GetParentFolderName(d_work)
  d_work = g_fso.GetAbsolutePathName(d_work)
  getWorkDirectory = d_work
end function 

sub apply_valid(result)
  if result then 
    result = "valid"
  else
    result = "invalid"
  end if
end sub

sub apply_eol(result)
  if result = loader.CRLF then 
    result = "crlf"
  else
    result = "lf"
  end if
end sub

sub test(id, path, etalon, eol)
  dim res, result, f_path:  f_path = dir & "\" & path

  result = loader.checkValidUtf8(f_path)
  apply_valid result
  if result <> etalon then
    echo deep,  "[ERROR] fcontent.checkValidUtf8" 
    echo deep + 1, "[ERROR] file: " & f_path
    echo deep + 1, "[ERROR] etalon: " & etalon
    echo deep + 1, "[ERROR] result: " & result
    gMY_TEST = false
    exit sub
  end if

  res = loader.detectEOL(f_path)
  apply_eol res

  if res <> eol then
    echo deep,  "[ERROR] fcontent.checkValidUtf8" 
    echo deep + 1, "[ERROR] file: " & f_path
    echo deep + 1, "[ERROR] etalon: " & eol
    echo deep + 1, "[ERROR] result: " & res
    gMY_TEST = false
    exit sub
  end if
end sub
 
function main()

  test 1, "text-1251-crlf.txt" , "invalid", "crlf"
  test 2, "text-1251-lf.txt"   , "invalid", "lf"
  test 3, "text-ansi-crlf.txt" , "valid"  , "crlf"
  test 4, "text-ansi-lf.txt"   , "valid"  , "lf"
  test 5, "text-utf8-crlf.txt" , "valid"  , "crlf"
  test 6, "text-utf8-lf.txt"   , "valid"  , "lf"

  if not gMY_TEST then
    echo deep, "[ERROR] fcontent.checkValidUtf8"
    WScript.Quit 1
  end if
end function

main()
