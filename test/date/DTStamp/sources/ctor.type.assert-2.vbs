
'--- local/hybrids                            [test][DTStamp][ctor.assert-2.vbs]
'[2024-09-09][19:00:00] 001 Kartonagnick    

sub main()
'[ERROR][ASSERT] DTStamp: unexpected type: 'Array'
  dim obj: set obj = (new DTStamp)(Array(1,2))
end sub

main()
