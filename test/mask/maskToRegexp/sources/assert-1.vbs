
'--- local/hybrids                        [test/mask/maskToRegexp][assert.1.vbs]
'[2024-02-23][07:30:00] 001 Kartonagnick PRE
'  --- CastleOfDreams/hybrids            [test][maskToRegexp][assert-1/main.vbs]
'  [2022-02-06][19:00:00] 001 Kartonagnick

function main()
 'expected: assert(unexpected <Folder>)
  dim d_cur: d_cur = g_shell.CurrentDirectory
  set d_cur = g_fso.GetFolder(d_cur)
  dim result: result = maskToRegexp(d_cur) 
end function

main()
