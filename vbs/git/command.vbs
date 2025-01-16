
'--- local/hybrids                                             [git/command.vbs]
'[2025-01-16][04:50:00] 001 Kartonagnick    
' includeVBS("glob.vbs")
' includeVBS("runCmd.vbs")
' includeVBS("trim.vbs")

sub runGitCommandHide(cmd)
  dim r: set r = runCmd(cmd)
  if r.code <> 0 then
    err.Raise errorExecFailed, "runGitCommandHide", "failed: '" & cmd & "'"
  end if
end sub

function runGitCommand(cmd)
  dim r: set r = runCmd(cmd)
  if r.code <> 0 then
    err.Raise errorExecFailed, "runGitCommand", "failed: '" & cmd & "'"
  end if
  r = trim(r.stdout)
  r = trimBack(r, vbCrLf)
  runGitCommand = r
end function

function runGitCommandBig(cmd)
  dim el, lst, ret: set ret = runCommand(cmd)
  set lst = CreateObject("System.Collections.ArrayList")
  if ret.code <> 0 then
    err.Raise errorExecFailed, "runGitCommandBig", "failed: '" & cmd & "'"
  end if
  for each el in ret.stdout
    el = trim(el)
    if el <> empty then
      lst.add(el)
    end if
  next
  set runGitCommandBig = lst
end function

function stripArray(front, list)
  dim it, el, lst
  set lst = CreateObject("System.Collections.ArrayList")
  for each el in list
    el = trim(el)
    if isArray(front) then
      for each it in front
        el = stripFront(it, el)
      next 
    elseif front <> empty then
      el = stripFront(front, el)
    end if
    if el <> empty then
      lst.add(el)
    end if
  next
  set stripArray = lst
end function

function toCommit(list)
  dim matches, smth, commit, line 
  set toCommit = CreateObject("System.Collections.ArrayList")
  g_regexp.Pattern    = "(\w*) (\w*) (.*)"
  g_regexp.IgnoreCase = false
  g_regexp.Global     = false
  for each line in list
    set matches = g_regexp.Execute(line)
    if matches.Count = 0 then
      err.Raise errorInvalidSequence, "toCommit", "invalid format of source sequence" 
    end if
    set smth = matches.Item(0).Submatches
    set commit = new GitCommit
    commit.hash = smth.Item(0)
    commit.hash = smth.Item(1)
    commit.text = smth.Item(2)
    toCommit.add commit
  next
end function
