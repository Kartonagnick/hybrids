
'--- local/hybrids                                                 [include.vbs]
'[2024-10-10][19:00:00] 013 Kartonagnick    
'  based on the story:
'  --- C:\workspace                                          [vbs/util/init.vbs]
'  [2021-08-08][19:00:00] 012 Kartonagnick
'    ... 10 items...
'  [2021-07-19][20:00:00] 001 Kartonagnick

dim gDIR_VBS
if gDIR_VBS = Empty then
  gDIR_VBS = CreateObject("WScript.Shell").Environment("PROCESS").Item("eDIR_VBS")
end if

sub includeVBS(path) 
  dim p: dim fso
  set fso = CreateObject("Scripting.FileSystemObject")
  if fso.FileExists(path) then
    p = path
  else 
    p = fso.BuildPath(gDIR_VBS, path)
    if not fso.FileExists(p) then
      p = fso.GetParentFolderName(WScript.ScriptFullName) 
      p = fso.BuildPath(p, path)
    end if
  end if
  executeGlobal(fso.openTextFile(p).readAll())
end Sub
