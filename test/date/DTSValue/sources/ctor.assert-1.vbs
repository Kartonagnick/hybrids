
'--- local/hybrids                           [test][DTSValue][ctor.assert-1.vbs]
'[2024-08-01][19:00:00] 001 Kartonagnick    

sub main()
 '[ERROR][ASSERT] DTSValue.parseDate: unexpected type: 'Array'
  dim arr: arr = array()
  dim dtv: set dtv = (new DTSValue)(arr, nothing)  
end sub

main()
