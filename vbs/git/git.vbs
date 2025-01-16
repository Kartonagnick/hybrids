
'--- local/hybrids                                                 [git/git.vbs]
'[2025-01-16][04:50:00] 001 Kartonagnick    
' includeVBS("glob.vbs")
' includeVBS("echo.vbs")
' includeVBS("errCode.vbs")
' includeVBS("runCmd.vbs")
' includeVBS("trim.vbs")
' includeVBS("strip_front.vbs")
' includeVBS("command.vbs")

'class GitAPI
'  property get version()
'  property get lastCommitFull()
'  property get lastCommitShort()
'  property get branch()
'  property get unreachable()
'  sub cleanRepo(deep)
'  function branchByHash(hash)
'  function getMasterCommits()
'  function getBranchCommits()

class GitAPI
  private m_pretty
  private m_params
  private m_cur_branch

  property get version()
    version = runGitCommand("git --version")
    version = stripFront("git version ", version)
  end property

  property get lastCommitFull()
    lastCommitFull = runGitCommand("git log -1 --pretty^=format:""%H""")
  end property

  property get lastCommitShort()
    lastCommitShort = runGitCommand("git log -1 --pretty^=format:""%h""")
  end property

  property get branch()
    branch = runGitCommand("git branch --show-current")
  end property

  property get unreachable()
    dim arr: arr = array("unreachable blob ", "unreachable commit ")
    set unreachable = runGitCommandBig("git fsck --unreachable")
    set unreachable = stripArray(arr, unreachable)
  end property

  sub cleanRepo
   'runGitCommandHide("git prune --progress")
    runGitCommandHide("git reflog expire --expire=now --all")
    runGitCommandHide("git gc --prune=now --aggressive")
  end sub

  function branchByHash(hash)
    dim name
    name = runGitCommand("git branch --contains " & hash)
    branchByHash = replace(name, "* ", "")
  end function

  function getMasterCommits()
    dim lst 
    set lst = runGitCommandBig("git --no-pager log master" & m_pretty & m_params)
    set getMasterCommits = toCommit(lst)
  end function

  function getBranchCommits()
    dim lst, name: name = branch
    if name = "master" then
      set getBranchCommits = getMasterCommits()
    else
      set lst = runGitCommandBig("git --no-pager log master.." & name & m_pretty & m_params)
      set getBranchCommits = toCommit(lst)
     'git cherry -v master
    end if
  end function
 
'---[PRIVATE]-------------------------

  private sub initGit
    dim p: p = g_env.item("PATH")
    dim a: a = "C:\Program Files\Git\bin"
    dim b: b = "C:\Program Files\SmartGit\git\bin"
    g_env("PATH") = a & ";" & b & ";" & p
    dim r: set r = runCmd("where git.exe")
    if r.code <> 0 then
      err.Raise errorNotFound, "CGit.initGit", "git.exe not found"
    end if
  end sub

  private sub Class_Initialize()
    m_pretty = " --pretty=""%H %h %s"""
    m_params = " --first-parent --reverse"
    initGit
  end sub
end class
