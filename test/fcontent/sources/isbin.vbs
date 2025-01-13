                                                
'--- local/hybrids                                    [test/fcontent][isbin.vbs]
'[2025-01-13][12:50:00] 001 Kartonagnick PRE
' includeVBS("glob.vbs")
' includeVBS("fcontent.vbs")

dim deep: deep = 0
dim loader: set loader = new FileContent
dim dir: dir = getWorkDirectory() & "\resources\isbin"

function getWorkDirectory()
  dim d_work
  d_work = WScript.ScriptFullName
  d_work = g_fso.GetParentFolderName(d_work)
  d_work = g_fso.GetAbsolutePathName(d_work)
  getWorkDirectory = d_work
end function 

sub apply_result(result)
  if result then 
    result = "bin"
  else
    result = "txt"
  end if
end sub

sub test(id, path, etalon)
  dim res, result, f_path:  f_path = dir & "\" & path
  result = loader.isBinaryHeuristic(f_path)
  apply_result result
  if result <> etalon then
    echo deep,  "[ERROR] fcontent.checkValidUtf8" 
    echo deep + 1, "[ERROR] file: " & f_path
    echo deep + 1, "[ERROR] etalon: " & etalon
    echo deep + 1, "[ERROR] result: " & result
    gMY_TEST = false
    exit sub
  end if
end sub
 
function main()

  test 1, "enca.exe"    , "bin"
  test 2, "enca.zzz"    , "bin"
  test 3, "example.bat" , "txt"
  test 4, "struct.txt"  , "txt"
  test 5, "struct.xxx"  , "txt"

  if not gMY_TEST then
    echo deep, "[ERROR] fcontent.checkValidUtf8"
    WScript.Quit 1
  end if
end function

main()
