
'--- local/hybrids                          [test][date\range][type.assert-2.vbs]
'[2024-09-17][19:00:00] 001 Kartonagnick PRE

sub main()
'[ERROR][ASSERT] dateRange: invalid type: DTStamp VS DTSValue
 dim bd: bd = #1970-01-01 00:00:00#
 dim ed: ed = #1970-01-01 00:00:10#
 dim bs: set bs = (new DTStamp)(bd)
 dim ev: set ev = (new DTSValue)(bd, nothing)
 dim list: set list = dateRange(bs, ev, 1)
end sub

main()
