
'--- local/hybrids                                         [test][dir][empty.vbs]
'[2024-12-24][19:00:00] 001 Kartonagnick    

dim deep: deep = 0

sub test(id, dir, etalon)
  dim result: result = isEmptyD(dir)
  if result <> etalon then
    echo deep, "-----------------------------"
    echo deep, "[" & id & "][ERROR] dir   : '" & dir    & "'"
    echo deep, "[" & id & "][ERROR] etalon: '" & etalon & "'"
    echo deep, "[" & id & "][ERROR] result: '" & result & "'"
    gMY_TEST = false
  end if
end sub

function main()
  dim dir, dir_empty, dir_source
  dir = WScript.ScriptFullName
  dir = g_fso.GetParentFolderName(dir)
  dir_empty  = dir & "\dir_empty"
  dir_source = dir & "\..\sources"

  if not g_fso.FolderExists(dir_empty) then
    g_fso.CreateFolder dir_empty
  end if

  test 1, dir_source, false
  test 2, dir_empty , true

  g_fso.DeleteFolder dir_empty, true
  if g_fso.FolderExists(dir_empty) then
    echo deep, "[ERROR] can not delete directory"
    echo deep, "[ERROR] check: " & dir_empty 
    gMY_TEST = false
  end if

  if not gMY_TEST then
    echo deep, "[ERROR] dir.empty"
    WScript.Quit 1
  end if
end function

main()

