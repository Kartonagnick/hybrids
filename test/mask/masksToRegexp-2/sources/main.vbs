
'--- local/hybrids                         [test/mask/masksToRegexp-2][main.vbs]
'[2024-02-23][08:20:00] 001 Kartonagnick    
'  --- CastleOfDreams/hybrids           [test][masksToRegexp][assert-1/main.vbs]
'  [2022-02-06][19:00:00] 001 Kartonagnick

function main()
 'expected: assert(unexpected <Folder>)
  dim d_cur: d_cur = g_shell.CurrentDirectory
  set d_cur = g_fso.GetFolder(d_cur)
  dim result: result = masksToRegexp(d_cur) 
end function

main()