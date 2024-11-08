
'--- local/hybrids                                        [sources][yedcont.vbs]
'[2024-11-08][07:00:00] 001 Kartonagnick    

Option Explicit

dim g_dirmasks, g_filmasks

function getFileList(deep, d_work)
 'echo deep, "scan in: " & d_work
  dim objDir: set objDir = g_fso.GetFolder(d_work)
  set getFileList = getFileListImpl(deep, objDir)
  dbg deep, "done."
end function

function getFileListImpl(deep, objDir)
  dim result, d_count, f_count, f_list, list, f, d

  set f_list = CreateObject("System.Collections.ArrayList")
  set result = CreateObject("System.Collections.ArrayList")
  f_count = objDir.Files.count
  d_count = objDir.SubFolders.count
  dbg deep, "dir(" & f_count & "/" & d_count & "): " & objDir 

  for each f in objDir.Files
    f_list.add f.Path
  next
  f_list.sort

  for each f in f_list
    set f = g_fso.GetFile(f)
    if g_filmasks.match(f) then
      dbg deep + 1, "[f] " & f.name & " -> add"
      result.add f
    else
      dbg deep + 1, "[f] " & f.name & " -> skip"
    end if
  next
  
  for each d in objDir.SubFolders
    if g_dirmasks.match(d) then
      set list = getFileListImpl(deep + 1, d)
      if list.Count() > 0 then
        result.addRange(list)
      end if
    else
      dbg deep + 1, "[d] " & d.name & " -> skip"
    end if
  next
  set getFileListImpl = result
end function

'...............................................................................

function getWorkDirectory()
  dim fp: dim d_cur: dim d_work
  fp = WScript.ScriptFullName
  d_cur  = g_fso.GetParentFolderName(fp)
  d_work = fromEnvironment("eDIR_WORK", d_cur)
  d_work = g_fso.GetAbsolutePathName(d_work)
  getWorkDirectory = d_work
end function 

'...............................................................................

sub doProcess(deep, f_list)
  dim f, is_node, is_group, content

  set is_node = new RegExp
  is_node.Pattern    = "(<node id=""n.+"")(>)"
  is_node.IgnoreCase = true
  is_node.Global     = false
  is_node.Multiline  = false

  set is_group = new RegExp
  is_group.Pattern    = "yfiles.foldertype=""group"""
  is_group.IgnoreCase = true
  is_group.Global     = false
  is_group.Multiline  = false

 'dbg deep, "is_node : " & is_node.Pattern
 'dbg deep, "is_group: " & is_group.Pattern

  for each f in f_list
    set content = loadContent(deep, f, is_node, is_group)
    saveContent deep, f, content
  next
end sub

function loadContent(deep, f_path, is_node, is_group)
  echo deep, "load: " & f_path
  dim content, f_stream, line
  set content = CreateObject("System.Collections.ArrayList")
  set f_stream = g_fso.OpenTextFile(f_path, 1, false)

  do while not f_stream.AtEndOfStream
    line = f_stream.Readline()
    if is_node.Test(line) then
      if not is_group.Test(line) then
      dbg deep + 1, "from: " & line
      line = is_node.Replace(line, "$1 yfiles.foldertype=""group""$2")
      dbg deep + 1, " to : " & line
      end if
    end if
    content.add line
  loop
  set loadContent = content
end function

sub saveContent(deep, f_path, content)
  dbg deep, "save: " & f_path
  dim line, f_stream
  set f_stream = g_fso.OpenTextFile(f_path, 2, true)
  for each line in content
    f_stream.write(line) & vbCrLf
  next
end sub

'...............................................................................

sub main()
  dim deep, mark, d_inc, d_exc, f_inc, f_exc, d_work, f_list

  echo 0, "beg: " & datestamp()
  set mark = new Elapsed

  d_work = getWorkDirectory()
  d_inc = fromEnvironment("eDIR_INCLUDES" , "*")
  d_exc = fromEnvironment("eDIR_EXCLUDES" , "_*")
  f_inc = fromEnvironment("eFILE_INCLUDES", "*.graphml")
  f_exc = fromEnvironment("eFILE_EXCLUDES", "_*")
  set g_dirmasks = (new MaskExp)(d_inc, d_exc)
  set g_filmasks = (new MaskExp)(f_inc, f_exc)
  doProcess 1, getFileList(1, d_work)

  echo 0, "end: " & datestamp() 
  echo 0, "elapsed: " & mark.value()
end sub

main()
