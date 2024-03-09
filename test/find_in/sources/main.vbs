
'--- local/hybrids                                      [test/find_in][main.vbs]
'[2024-03-09][04:10:00] 003 Kartonagnick    
'[2024-03-07][23:50:00] 002 Kartonagnick
'  --- CastleOfDreams/hybrids                            [test/finder][case.vbs]
'  [2022-03-02][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams/vbs                                   [test/Find_in.vbs]
'    [2021-08-04][23:30:00] 001 Kartonagnick


dim deep: deep = 0
dim d_this: d_this = g_fso.GetParentFolderName(WScript.ScriptFullName) 
dim d_starts: dim d_sandbox: dim oFind
dim d1: dim d2: dim d3

function getSandbox(n)
  d_sandbox = g_fso.BuildPath(d_this, "sandbox-" & n)
  d1 = d_sandbox & "\111"
  d2 = d_sandbox & "\222"
  d3 = d_sandbox & "\333"
  'd_starts = split(d1 & "; " & d2 & "; " & d3)
  d_starts = split(d1 & "; " & d2 & "; " & d3, ";")
  getSandbox = d_sandbox
end function

sub test(id, expectedF, expectedD)
  oFind.run deep
  dim f: set f = oFind.files()
  dim d: set d = oFind.dirs()
  
  if f.count <> expectedF or d.count <> expectedD then
    echo deep, "[" & id & "]--------------DETECTED ERROR ---------------"

    if f.count <> expectedF then
      echo deep, "[" & id & "][ERROR] expectedF: " & expectedF
      echo deep, "[" & id & "][ERROR] f.count: "   & f.count
    end if

    if d.count <> expectedD then
      echo deep, "[" & id & "][ERROR] expectedD: " & expectedD
      echo deep, "[" & id & "][ERROR] d.count: "   & d.count
    end if
    echo deep, "[" & id & "] repeat with debug output:"
    oFind.debug    = true
    oFind.hideScan = true
    oFind.showParams deep
    oFind.run deep + 1
    gMY_TEST = false
  end if
end sub

function main()
  set oFind = (new Find_in)(getSandbox(1))
  test 1, 6, 3

  set oFind = (new Find_in)(d_starts)
    oFind.includeS = "*" 
  test 2, 3, 0
 
  set oFind = (new Find_in)(getSandbox(2))
    oFind.excludeS = "3rd*; proj*"
  test 3, 26, 12
 
  set oFind = (new Find_in)(getSandbox(2))
    oFind.excludeS = "3*; proj*"
  test 4, 17, 7

  set oFind = (new Find_in)(getSandbox(2))
    oFind.includeS = "2*"
  test 5, 11, 5

  set oFind = (new Find_in)(getSandbox(2))
    oFind.once = true
  test 6, 1, 0

  set oFind = (new Find_in)(getSandbox(2))
    oFind.excludeD = "*"
    oFind.once = true
  test 7, 1, 0

  set oFind = (new Find_in)(getSandbox(2))
    oFind.excludeF = "*"
    oFind.once = true
  test 8, 0, 1

  set oFind = (new Find_in)(getSandbox(2))
    oFind.includeS = "*"
    oFind.includeF = "2*"
    oFind.includeD = "2*"
  test 9, 8, 4

  set oFind = (new Find_in)(getSandbox(2))
    oFind.excludeS = ""
    oFind.includeF = ""
    oFind.excludeF = "*"
    oFind.includeD = "3*"
    oFind.excludeD = "3rd*"
  test 10, 0, 4

  set oFind = (new Find_in)(getSandbox(2))
    oFind.includeF = "pro*.root"
    oFind.excludeF = ""
    oFind.includeD = ""
    oFind.excludeD = "*"
  test 11, 1, 0

  set oFind = (new Find_in)(getSandbox(2))
    oFind.includeF = "pro*.root"
    oFind.excludeF = ""
    oFind.includeD = ""
    oFind.excludeD = "*"
  test 11, 1, 0

  set oFind = (new Find_in)(d_this)
    oFind.includeD = "*кактус*"
    oFind.includeF = "*кактус*"
    oFind.run deep + 1
  test 12, 2, 1

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] find_in"
  else
    echo deep, "[ERROR] find_in"
    WScript.Quit 1
  end if
end function

main()
