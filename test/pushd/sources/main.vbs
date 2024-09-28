
'--- local/hybrids                                     [test/pushd][main.vbs]
'[2024-09-28][19:00:00] 001 Kartonagnick    

dim deep: deep = 0

sub check(id, result, etalon)
  if result <> etalon then
    echo deep, "[" & id & "][ERROR] etalon: " & etalon
    echo deep, "[" & id & "][ERROR] result: " & result
    gMY_TEST = false
  end if
end sub

sub test(id, dir, etalon)
  dim old, cur
  old = g_shell.CurrentDirectory
  pushd dir  
  cur = g_shell.CurrentDirectory
  check id + 0, cur, etalon
  check id + 1, cur, dir
  popd 
  cur = g_shell.CurrentDirectory
  check id + 2, cur, old
end sub

sub baz(id, d)
  dim old: old = g_shell.CurrentDirectory
  pushd old & "\333"
  check id, g_shell.CurrentDirectory, old & "\333"
  popd
  check id, g_shell.CurrentDirectory, old
end sub

sub bar(id, d)
  dim old: old = g_shell.CurrentDirectory
  pushd old & "\222"
  check id, g_shell.CurrentDirectory, old & "\222"
  baz id, d & "\222"
  check id, g_shell.CurrentDirectory, old & "\222"
  popd
  check id, g_shell.CurrentDirectory, old
end sub

sub foo(id, d)
  dim old: old = g_shell.CurrentDirectory
  pushd old & "\111"
  check id, g_shell.CurrentDirectory, old & "\111"
  bar id, d & "\111"
  check id, g_shell.CurrentDirectory, old & "\111"
  popd
  check id, g_shell.CurrentDirectory, old
end sub

function main()
  dim old, dd, d1, d2, d3
  dd = g_fso.GetParentFolderName(WScript.ScriptFullName) 
  d1 = g_fso.BuildPath(dd, "111")
  d2 = g_fso.BuildPath(d1, "222")
  d3 = g_fso.BuildPath(d2, "333")

  test 1, d1, dd & "\111"
  test 4, d2, dd & "\111\222"
  test 7, d3, dd & "\111\222\333"

  old = g_shell.CurrentDirectory
  pushd dd
  foo 10, dd
  popd
  check 11, g_shell.CurrentDirectory, old

  if not gMY_TEST then
    echo deep, "[ERROR] pushd"
    WScript.Quit 1
  end if
end function
