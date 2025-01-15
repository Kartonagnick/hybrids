
'--- local/hybrids                                   [test][git][unreachable.vbs]
'[2025-01-16][04:50:00] 001 Kartonagnick PRE

dim deep: deep = 0

function main()
  dim git, commit, hash, list

  set git = new GitAPI
  dbg deep, "cur branch : " & git.branch
  for each hash in git.unreachable
    set commit = (new GitCommit)(hash)
    echo deep, "[unreachable][" & commit.full & "] " & commit.text 
  next 

  if not gMY_TEST then
    echo deep, "[ERROR] git.unreachable"
    WScript.Quit 1
  end if
end function

'main()
