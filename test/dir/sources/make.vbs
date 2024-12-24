
'--- local/hybrids                                          [test][dir][make.vbs]
'[2024-12-24][19:00:00] 001 Kartonagnick PRE

dim deep: deep = 0

sub test(id,  dir)
  dim etalon: etalon = true
  dim result: result = g_fso.FolderExists(dir)
  if result <> etalon then
    echo deep, "-----------------------------"
    echo deep, "[" & id & "][ERROR] dir   : '" & dir    & "'"
    echo deep, "[" & id & "][ERROR] etalon: '" & etalon & "'"
    echo deep, "[" & id & "][ERROR] result: '" & result & "'"
    gMY_TEST = false
  end if
end sub

function main()
  dim dir, dir_root, dir_make
  dir = WScript.ScriptFullName
  dir = g_fso.GetParentFolderName(dir)
  dir_make = dir & "\dir_make\1\2"
  dir_root = dir & "\dir_make"

 'attempt to make a existent directory should succeed
  makeD dir
  test 1,  dir

  makeD dir_make

  test 2, dir_root           
  test 3, dir_root & "\1"    
  test 4, dir_root & "\1\2"  

  g_fso.DeleteFolder dir_root, true

  if not gMY_TEST then
    echo deep, "[ERROR] dir.make"
    WScript.Quit 1
  end if
end function

main()
