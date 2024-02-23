
'--- local/hybrids                       [test/mask/masksToRegexp][assert-3.vbs]
'[2024-02-23][08:20:00] 001 Kartonagnick PRE
'  --- CastleOfDreams/hybrids           [test][masksToRegexp][assert-3/main.vbs]
'  [2022-02-06][19:00:00] 001 Kartonagnick

function main()
 'expected: assert(unexpected <Folder>)
  dim d1: set d1 = g_fso.GetFolder("C:\windows")
  dim d2: set d2 = g_fso.GetFolder("C:\windows")
  dim arr: arr = array(d1, d2)
  dim result: set result = masksToRegexp(arr) 
end function

main()
