
'--- local/hybrids                           [test][DTSValue][ctor.assert-3.vbs]
'[2024-08-01][19:00:00] 001 Kartonagnick    

sub main()
 '[ERROR][ASSERT] DTSValue.parseDate: unexpected object: 'Nothing'
  dim dtv: set dtv = (new DTSValue)(nothing, nothing)  
end sub

main()
