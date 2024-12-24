
'--- local/hybrids                                                    [move.vbs]
'[2024-12-24][19:00:00] 001 Kartonagnick    
' includeVBS("glob.vbs")
' includeVBS("make.vbs")

sub moveD(d_src, d_dst)
  dim src: src = g_fso.GetAbsolutePathName(d_src)
  dim dst: dst = g_fso.GetAbsolutePathName(d_dst)
  dim reason

  if not g_fso.FolderExists(src) then
    reason = "directory does not exist: '" & src & "'"
    err.Raise errorNotExists, "moveD", reason
  end if

  if g_fso.FileExists(dst) then
    reason = "can't create a directory because a file already exists at that path: '" & dst & "'"
    err.Raise errorAlreadyExists, "moveD", reason
  end if

  if g_fso.FolderExists(dst) then
    dim d, f, p, fold
    set fold = g_fso.GetFolder(src)

    for each f in fold.Files
      p = dst & "\" & f.name
      if g_fso.FileExists(p) then
        g_fso.CopyFile f, p, true
        g_fso.DeleteFile f, true
      else
        makeD g_fso.GetParentFolderName(p)
        g_fso.MoveFile f, p
      end if
    next

    for each d in fold.SubFolders 
      moveD d.path, dst & "\" & d.name
    next
    g_fso.DeleteFolder src, true

  else
    makeD g_fso.GetParentFolderName(dst)
    g_fso.MoveFolder src, dst 
  end if
end sub
