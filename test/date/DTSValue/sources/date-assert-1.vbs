
'--- local/hybrids                           [test][DTSValue][date-assert-1.vbs]
'[2024-08-14][19:00:00] 001 Kartonagnick    

sub main()
 '[ERROR][ASSERT] DTSValue.parseDate: unexpected type: 'Array'
  dim dtv: set dtv = new DTSValue
  dtv.date = array()
end sub

main()
