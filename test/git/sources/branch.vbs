
'--- local/hybrids                                        [test][git][branch.vbs]
'[2025-01-16][04:50:00] 001 Kartonagnick    

dim deep: deep = 0

function main()
  dim git, hash, commit, commits
  set git = new GitAPI
  dbg deep, "cur branch : " & git.branch

  'dim el, i, id, idlen, lst 
  'i = 0 : set lst = git.getListBranch: idlen = len(lst.count)
  'echo deep + 1, "count of commits: " & lst.count
  'for each el in lst
  '  i = i + 1: id = padding(i, idlen, "0")
  '  echo deep + 2, "[" & id & "][" & el.full & "][" & el.text & "]"
  'next

  set commits = git.getBranchCommits
  dim i, id, idlen: idlen = len(commits.count)
  echo deep + 1, "count of commits: " & commits.count
  for each commit in commits
    i = i + 1: id = padding(i, idlen, "0")
    echo deep, "[" & id & "][" & commit.full & "] " & commit.text
  next 

  if not gMY_TEST then
    echo deep, "[ERROR] git.getBranchCommits"
    WScript.Quit 1
  end if
end function

main()
