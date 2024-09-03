
'--- local/hybrids                          [test][DTSExport][ctor.assert.1.vbs]
'[2024-08-29][19:00:00] 005 Kartonagnick    
'  --- CastleOfDreams/vbs                               [test][date][export.vbs]
'  [2021-09-06][19:00:00] 004 Kartonagnick
'  [2021-08-27][18:00:00] 003 Kartonagnick
'  [2021-08-24][18:00:00] 002 Kartonagnick
'  [2021-08-20][18:00:00] 001 Kartonagnick

sub main()
'[ERROR][ASSERT] DTSExport: unexpected object: 'IRegExp2'
 dim bad: set bad = (new DTSExport)(g_regexp)
end sub

main()
