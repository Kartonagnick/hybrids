
' --- local/hybrids                                        [test/glob][main.vbs]
' [2024-02-17][20:30:00] 003 Kartonagnick    
'   --- CastleOfDreams/hybrids                          [test/initial][case.vbs]
'   [2022-01-26][19:00:00] 002 Kartonagnick
'   [2022-01-11][19:00:00] 001 Kartonagnick

dim deep: deep = 0

sub echo(deep, msg)
  dim tab: tab = Space(deep * 2)
  WScript.Echo tab & msg
end sub 

sub test(id, obj, must)
  if not isObject(obj) then
    echo deep, "[" & id & "][ERROR] must be object: " & must
    echo deep, "[" & id & "][ERROR] type: " & typename(obj)
    gMY_TEST = false
  end if
end sub
 
function main()

  test 1, g_regexp, "g_regexp"
  test 2, g_shell , "g_shell"
  test 3, g_list  , "g_list"
  test 4, g_env   , "g_env"
  test 5, g_fso   , "g_fso"

  if not gMY_TEST then
    echo deep, "[ERROR] glob"
    WScript.Quit 1
  end if
end function

main()
