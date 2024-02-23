
'--- local/hybrids                            [test/mask/matchByMasks][main.vbs]
'[2024-02-23][09:20:00] 001 Kartonagnick    
'  --- CastleOfDreams/hybrids                     [test][mask][matchByMasks.vbs]
'  [2022-02-06][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams/vbs                       [test][mask][matchByMasks.vbs]
'    [2021-07-29][23:30:00] 001 Kartonagnick

dim deep: deep = 0

sub test(id, text, masks, expected)
  dim result: result = matchByMasks(text, masks)
  if result <> expected then
    echo deep, "-----------------------------"
    echo deep, "[" & id & "][ERROR] text: '"     & text     & "'"
    echo deep, "[" & id & "][ERROR] masks: '"    & masks    & "'"
    echo deep, "[" & id & "][ERROR] expected: '" & expected & "'"
    echo deep, "[" & id & "][ERROR] result: '"   & result   & "'"
    gMY_TEST = false
  end if
end sub

function main()
  dim mask1: mask1 = "ipch; .vs; *VC.db; *.VC.opendb; *.sdf; .svn"
  dim mask2: mask2 = "_backup; _build*; _product*; _cache; _stash; _hidden  "
  dim mask3: mask3 = "boost; googletest; "
  dim masks: masks = mask1 & ";" & mask2 & ";" & mask3

  test  1, "ipch"   , masks, true
  test  2, "boost"  , masks, true
  test  3, ".svn"   , masks, true
  test  4, "_hidden", masks, true
  test  5, ".ipch"  , masks, false
  test  6, ".svn.n" , masks, false
                        
  test  7, ""       , masks, false  'empty text
  test  8, "text"   , ""   , true   'empty regexp
                        
  test  9, "_Backup", masks, true   'IgnoreCase = true

  dim d_path: set d_path = g_fso.GetFolder("C:\windows")
  dim f_path: set f_path = g_fso.GetFile("C:\windows\explorer.exe")
                        
  test 10, f_path   , masks, false
  test 11, d_path   , masks, false

  dim maskF: maskF = "explore?; *.exe"                         
  dim maskD: maskD = "window?; *indows"
                        
  test 12, f_path   , maskF, true
  test 13, d_path   , maskD, true

  if not gMY_TEST then
    echo deep, "[ERROR] matchByMasks"
    WScript.Quit 1
  end if
end function

main()
