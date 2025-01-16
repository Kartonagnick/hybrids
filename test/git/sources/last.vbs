
'--- local/hybrids                                          [test][git][last.vbs]
'[2025-01-16][04:50:00] 001 Kartonagnick    

dim deep: deep = 0

function main()
  dim git, full, short, com1, com2

  set git = new GitAPI
  full  = git.lastCommitFull
  short = git.lastCommitShort

  dbg deep, "last commit: " & short
  dbg deep, "last commit: " & full

  set com1 = (new GitCommit)(full)
  set com2 = (new GitCommit)(short)

  dbg deep, "last commit: " & com1.text

  eqCompare deep, 1, com1.full , com2.full
  eqCompare deep, 2, com1.short, com2.short
  eqCompare deep, 3, com1.text , com2.text

  if not gMY_TEST then
    echo deep, "[ERROR] git.last"
    WScript.Quit 1
  end if
end function

'main()
