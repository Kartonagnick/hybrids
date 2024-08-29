
'--- local/hybrids                        [test][DTSImport][format.assert.1.vbs]
'[2024-08-29][19:00:00] 005 Kartonagnick    
'  --- CastleOfDreams/vbs                               [test][date][import.vbs]
'  [2021-09-06][19:00:00] 004 Kartonagnick
'  [2021-08-28][18:00:00] 003 Kartonagnick
'  [2021-08-23][18:00:00] 002 Kartonagnick
'  [2021-08-19][18:00:00] 001 Kartonagnick

sub main()
'[ERROR][ASSERT] DTSImport: unexpected type: 'IRegExp2'
 dim bad: set bad = new DTSImport
 bad.format = g_regexp
end sub

main()
