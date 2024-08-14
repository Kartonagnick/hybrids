
'--- local/hybrids                           [test][DTSValue][date-assert-3.vbs]
'[2024-08-14][19:00:00] 001 Kartonagnick    

sub main()
 '[ERROR][ASSERT] DTSValue.parseDate: unexpected object: 'Nothing'
  dim dtv: set dtv = new DTSValue
  dtv.date = nothing
end sub

main()
