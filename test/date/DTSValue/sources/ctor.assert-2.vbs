
'--- local/hybrids                           [test][DTSValue][ctor.assert-2.vbs]
'[2024-08-01][19:00:00] 001 Kartonagnick    

sub main()
 '[ERROR][ASSERT] DTSValue.parseDate: unexpected object: 'ArrayList'
  dim lst: set lst = CreateObject("System.Collections.ArrayList")
  dim dtv: set dtv = (new DTSValue)(lst, nothing)  
end sub

main()
