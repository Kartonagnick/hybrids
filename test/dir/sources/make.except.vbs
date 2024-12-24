
'--- local/hybrids                                   [test][dir][make.except.vbs]
'[2024-12-24][19:00:00] 001 Kartonagnick    

dim deep: deep = 0

sub test(id, dir)
  on error resume Next: err.clear
  makeD dir
  saveException: on error goto 0
  checkException deep, id, errorAlreadyExists
end sub

function main()
  test 1, WScript.ScriptFullName
  if not gMY_TEST then
    echo deep, "[ERROR] dir.make.except"
    WScript.Quit 1
  end if
end function

main()
