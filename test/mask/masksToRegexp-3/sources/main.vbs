
'--- local/hybrids                         [test/mask/masksToRegexp-3][main.vbs]
'[2024-02-23][08:20:00] 001 Kartonagnick    
'  --- CastleOfDreams/hybrids           [test][masksToRegexp][assert-2/main.vbs]
'  [2022-02-06][19:00:00] 001 Kartonagnick

function main()
 'expected: assert(unexpected <File>)
  dim p
  p = g_fso.GetParentFolderName(WScript.ScriptFullName) 
  p = g_fso.BuildPath(p, "main.vbs")
  set p = g_fso.GetFile(p)
  dim result: result = masksToRegexp(p) 
end function

main()
