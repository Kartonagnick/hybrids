
'--- local/hybrids                                        [test][git][master.vbs]
'[2025-01-16][04:50:00] 001 Kartonagnick PRE

dim deep: deep = 0

function main()
  dim git, hash, commit
  set git = new GitAPI
  for each commit in git.getMasterCommits
    'set commit = (new GitCommit)(hash)
    echo deep, "[" & commit.full & "] " & commit.text
  next 
  if not gMY_TEST then
    echo deep, "[ERROR] git.getMasterCommits"
    WScript.Quit 1
  end if
end function

'main()

