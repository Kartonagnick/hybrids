
'--- local/hybrids                         [test][DTSExport][stamp.assert.2.vbs]
'[2024-08-29][19:00:00] 005 Kartonagnick PRE
'  --- CastleOfDreams/vbs                               [test][date][export.vbs]
'  [2021-09-06][19:00:00] 004 Kartonagnick
'  [2021-08-27][18:00:00] 003 Kartonagnick
'  [2021-08-24][18:00:00] 002 Kartonagnick
'  [2021-08-20][18:00:00] 001 Kartonagnick

sub main()
 '[ERROR][ASSERT] DTSExport: unexpected object: 'FileSystemObject'
  dim bad: set bad = new DTSExport
  dim txt: txt = bad.stamp(g_fso)
end sub

main()