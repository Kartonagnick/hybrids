
'--- local/hybrids                                          [test][git][init.vbs]
'[2025-01-16][04:50:00] 001 Kartonagnick    

dim deep: deep = 0

function main()
  dim branch, git: set git = new GitAPI
  dbg deep, "git version: " & git.version  
  dbg deep, "last commit: " & git.lastCommitFull
  dbg deep, "last commit: " & git.lastCommitShort
  dbg deep, "cur branch : " & git.branch

  branch = git.branchByHash(git.lastCommitFull)

  eqCompare deep, 1, git.branch, "#64-dev-git"
  eqCompare deep, 2, git.branch, branch

  if not gMY_TEST then
    echo deep, "[ERROR] git.init"
    WScript.Quit 1
  end if
end function

'main()
