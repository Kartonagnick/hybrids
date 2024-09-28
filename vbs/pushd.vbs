
'--- local/hybrids                                                   [pushd.vbs]
'[2024-09-28][19:00:00] 001 Kartonagnick    
'
' includeVBS("glob.vbs")

sub pushd(path)
  dim old: old = g_shell.CurrentDirectory
  dim cur: cur = g_fso.GetAbsolutePathName(path)
  g_stack_dirs_423gh4g2h3.add old
  g_shell.CurrentDirectory = cur
end sub

sub pushf(path)
  pushd(g_fso.GetParentFolderName(path))
end sub

sub popd()
  dim cnt, old
  cnt = g_stack_dirs_423gh4g2h3.count  
  if cnt = 0 then exit sub
  old = g_stack_dirs_423gh4g2h3(cnt - 1)
  g_stack_dirs_423gh4g2h3.RemoveAt(cnt - 1)
  g_shell.CurrentDirectory = old
end sub

dim g_stack_dirs_423gh4g2h3
set g_stack_dirs_423gh4g2h3 = CreateObject("System.Collections.ArrayList")
