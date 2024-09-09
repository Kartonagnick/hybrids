
'--- local/hybrids                           [test][DTSValue][ctor.assert-1.vbs]
'[2024-09-09][19:00:00] 001 Kartonagnick    

sub main()
 '[ERROR][ASSERT] DTSValue.parseDate: unexpected type: 'Array'
  dim arr: arr = array()
  dim obj: set obj = (new DTStamp)(arr)  
end sub

main()
