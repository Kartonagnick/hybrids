
'--- local/hybrids                          [test][date\range][type.assert-1.vbs]
'[2024-09-17][19:00:00] 001 Kartonagnick    

sub main()
'[ERROR][ASSERT] dateRange: invalid type: Date VS String
 dim bd: bd = #1970-01-01 00:00:00#
 dim ed: ed = "1970-01-01 00:00:10"
 dim list: set list = dateRange(bd, ed, 1)
end sub

main()
