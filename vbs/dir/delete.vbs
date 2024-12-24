
'--- local/hybrids                                                  [delete.vbs]
'[2024-12-24][19:00:00] 001 Kartonagnick PRE
' includeVBS("glob.vbs")

sub deleteD(dir)
  if  g_fso.FolderExists(dir) then
    dim d, fold: set fold = g_fso.GetFolder(dir)
    g_fso.DeleteFile dir & "\*", true 
    for each d in fold.SubFolders 
      deleteD d
    next
    g_fso.DeleteFolder dir, true
  end if
end sub
