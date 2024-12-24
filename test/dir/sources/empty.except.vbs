
'--- local/hybrids                                  [test][dir][empty.except.vbs]
'[2024-12-24][19:00:00] 001 Kartonagnick PRE

dim deep: deep = 0

sub test(id, dir)
  on error resume Next: err.clear
  dim re: re = isEmptyD(dir)
  saveException: on error goto 0
  checkException deep, id, errorNotExists
end sub

function rootD()
  dim dir: dir = WScript.ScriptFullName
  dir = g_fso.GetParentFolderName(dir)
  rootD = dir & "\dir_no_exist"
end function

function main()
  test 1, rootD()
  if not gMY_TEST then
    echo deep, "[ERROR] dir.empty.except"
    WScript.Quit 1
  end if
end function

main()
