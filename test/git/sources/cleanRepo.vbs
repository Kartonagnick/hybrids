
'--- local/hybrids                                     [test][git][cleanRepo.vbs]
'[2025-01-16][04:50:00] 001 Kartonagnick PRE

dim deep: deep = 0

function main()
  dim git: set git = new GitAPI
  dbg deep, "cur branch : " & git.branch

  echo deep, "please wait..."
  git.cleanRepo
  echo deep, "done."

  if not gMY_TEST then
    echo deep, "[ERROR] git.cleanRepo"
    WScript.Quit 1
  end if
end function

'main()
