
'--- local/hybrids                                      [test/symptom][main.vbs]
'[2024-03-06][06:20:00] 002 Kartonagnick PRE
'  --- CastleOfDreams/hybrids                           [test/symptom][case.vbs]
'  [2022-02-20][19:00:00] 001 Kartonagnick

sub test(id, deep, path, symptoms1, symptoms2, symptoms3, expected)
  dim engine: set engine = new FindBySymptoms
 'engine.debug = true
 'engine.showDirectory = true
 'engine.showSymptoms  = true
 'engine.showSkipped   = true
 'engine.showMatched   = true

  if symptoms1 <> Empty then engine.addSymptoms symptoms1
  if symptoms2 <> Empty then engine.addSymptoms symptoms2
  if symptoms3 <> Empty then engine.addSymptoms symptoms3

  dim result: result = engine.find(deep, path)
  if result <> expected then
    echo deep, "-----------------------------"
    echo deep, "[" & id & "][ERROR] path: "      & path
    echo deep, "[" & id & "][ERROR] symptoms1: " & symptoms1
    echo deep, "[" & id & "][ERROR] symptoms2: " & symptoms2
    echo deep, "[" & id & "][ERROR] symptoms3: " & symptoms3
    echo deep, "[" & id & "][ERROR] expected: "  & expected
    echo deep, "[" & id & "][ERROR] result: "    & result
    gMY_TEST = false
  end if
end sub


function main()
  dim deep: deep = 0

  dim d_this:    d_this    = g_fso.GetParentFolderName(WScript.ScriptFullName) 
  dim d_sandbox: d_sandbox = g_fso.BuildPath(d_this, "sandbox")
  dim d_path:    d_path    = g_fso.BuildPath(d_sandbox, "333\222\333")
  dim d_etalon:  d_etalon  = g_fso.BuildPath(d_sandbox, "333")
  dim folder:  set folder  = g_fso.GetFolder(d_path)

  test 1, deep, d_path, "3rd*;pro*"  , ""               , ""       , d_etalon
  test 2, deep, d_path, "4rd*;prc*"  , "111.txt;222.txt", ""       , d_sandbox
  test 3, deep, folder, "4rd*;prc*"  , "111.txt;222.txt", ""       , d_sandbox
  test 4, deep, folder, "4rd*;prc*"  , "555;"           , "3rd*"   , d_etalon
  test 5, deep, folder, "444rd*;prc*", "555;"           , "4443rd*", ""

  On Error Resume Next

  Err.Clear
  test 6, deep, "noexist", "4rd*;prc*", "111.txt;222.txt", "", d_sandbox

  if Err.Number <> errorNotExist Then
    echo deep, "[ERROR] expected: 'errorNotExist'"
  else
    echo deep + 1, "[SUCCESS] exception successfully caught: 'errorNotExist'"
  end if

  Err.Clear
  test 7, deep, folder, "", "", "", d_sandbox
  if Err.Number <> errorEmptyData Then
    echo deep, "[ERROR] expected: 'errorEmptyData'"
  else
    echo deep + 1, "[SUCCESS] exception successfully caught: 'errorEmptyData'"
  end if
  on Error goto 0

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] FindBySymptoms"
  else
    echo deep, "[ERROR] FindBySymptoms"
    WScript.Quit 1
  end if
  
end function

main()
