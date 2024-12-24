
'--- local/hybrids                                   [test][dir][move.except.vbs]
'[2024-12-24][19:00:00] 001 Kartonagnick PRE

dim deep: deep = 0

sub test(id, src, dst, errcode)
  on error resume Next: err.clear
  moveD src, dst
  saveException: on error goto 0
  checkException deep, id, errcode
end sub

function main()
  dim dir, src, dst
  dir = WScript.ScriptFullName
  dir = g_fso.GetParentFolderName(dir)

  src = dir & "\move_no_exist"
  dst = dir & "\ololo"
  test 1, src, dst, errorNotExists

  src = dir
  dst = WScript.ScriptFullName
  test 2, src, dst, errorAlreadyExists

  if not gMY_TEST then
    echo deep, "[ERROR] dir.make.except"
    WScript.Quit 1
  end if
end function

main()
