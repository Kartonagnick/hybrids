
'--- local/hybrids                                                [dir/make.vbs]
'[2024-12-24][19:00:00] 001 Kartonagnick    
' includeVBS("errCode.vbs")
' includeVBS("glob.vbs")

sub makeD(d_path)
  dim dir: dir = g_fso.GetAbsolutePathName(d_path)
  if g_fso.FolderExists(dir) then 
    exit sub
  end if

  if g_fso.FileExists(dir) then
    dim reason: reason = "can't create a directory because a file already exists at that path: '" & dir & "'"
    err.Raise errorAlreadyExists, "makeD", reason
  end if

  dim cur, idx, i, arr: arr = split(dir, "\")
  
 'check: UNC-path
  if left(dir, 2) = "\\" then
    cur = "\\" & arr(2) & "\" & arr(3) & "\"
    idx = 4
  else
    cur = arr(0) & "\"
    idx = 1
  end if
  
  for i = idx to ubound(arr)
    cur = g_fso.BuildPath(cur, arr(i))
    if not g_fso.FolderExists(cur) then
      g_fso.CreateFolder cur
    end if
  next
end sub
