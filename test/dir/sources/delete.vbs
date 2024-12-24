
'--- local/hybrids                                        [test][dir][delete.vbs]
'[2024-12-24][19:00:00] 001 Kartonagnick    

dim deep: deep = 0

sub errMessage(id, path, etalon, result)
  echo deep, "-----------------------------"
  echo deep, "[" & id & "][ERROR] path  : '" & path   & "'"
  echo deep, "[" & id & "][ERROR] etalon: '" & etalon & "'"
  echo deep, "[" & id & "][ERROR] result: '" & result & "'"
  gMY_TEST = false
end sub

sub testF(id, path, etalon)
  dim result: result = g_fso.FileExists(path)
  if result <> etalon then
    errMessage id, path, etalon, result
  end if
end sub

sub testD(id, path, etalon)
  dim result: result = g_fso.FolderExists(path)
  if result <> etalon then
    errMessage id, path, true, result
  end if
end sub

function rootD()
  dim dir: dir = WScript.ScriptFullName
  dir = g_fso.GetParentFolderName(dir)
  rootD = dir & "\dir_delete"
end function

function main()
  dim dir_root, dir_make, dir_mid, dir_noexist, file, file_txt 
  dir_root = rootD()

  dir_make = dir_root & "\1\2\3\4"
  makeD dir_make
  testD 1, dir_make, true 

  file_txt = dir_make & "\test.txt"
  set file = g_fso.OpenTextFile(file_txt, 8 , true)
  file.WriteLine("Writing text to a file")
  set file = nothing
  testF 2, file_txt, true 

  dir_mid = dir_root & "\1\2"
  deleteD dir_mid
  testF 2, file_txt, false
  testD 3, dir_mid , false

  g_fso.DeleteFolder dir_root, true
  testD 4, dir_root , false

 'attempt to delete a non-existent directory should succeed
  dir_noexist = dir_root & "\noexist"
  deleteD dir_noexist
  testD 5, dir_noexist, false

  if not gMY_TEST then
    echo deep, "[ERROR] dir.delete"
    WScript.Quit 1
  end if
end function

main()
