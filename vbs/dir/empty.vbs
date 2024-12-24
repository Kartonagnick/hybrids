
'--- local/hybrids                                               [dir/empty.vbs]
'[2024-12-24][19:00:00] 001 Kartonagnick    
' includeVBS("errCode.vbs")
' includeVBS("glob.vbs")

function isEmptyD(dir)
  dim fold, cntf, cntd
  if g_fso.FolderExists(dir) then
    set fold = g_fso.GetFolder(dir)
    cntf = fold.Files.Count
    cntd = fold.SubFolders.Count
    if cntf = 0 and cntd = 0 then
      isEmptyD = true
    else
      isEmptyD = false
    end if
  else
    dim reason: reason = "directory does not exist: '" & dir & "'"
    err.Raise errorNotExists, "isEmptyD", reason
  end if
end function
