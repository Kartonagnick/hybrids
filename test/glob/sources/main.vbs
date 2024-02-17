
' --- local/hybrids                                        [test/glob][main.vbs]
' [2024-02-17][20:30:00] 003 Kartonagnick    
'   --- CastleOfDreams/hybrids                          [test/initial][case.vbs]
'   [2022-01-26][19:00:00] 002 Kartonagnick
'   [2022-01-11][19:00:00] 001 Kartonagnick

sub test(id, deep, obj, must)
  if not isObject(obj) then
    echo deep, "[" & id & "][ERROR] must be object: " & must
    echo deep, "[" & id & "][ERROR] type: " & typename(obj)
    gMY_TEST = false
  end if
end sub

 
function main()
  dim deep: deep = 0

  test 1, deep, g_regexp, "g_regexp"
  test 2, deep, g_shell , "g_shell"
  test 3, deep, g_list  , "g_list"
  test 4, deep, g_env   , "g_env"
  test 5, deep, g_fso   , "g_fso"

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] glob"
  else
    echo deep, "[ERROR] glob"
    WScript.Quit 1
  end if
end function

main()
