
'--- local/hybrids                           [test][DTSValue][ctor.assert-3.vbs]
'[2024-09-09][19:00:00] 001 Kartonagnick PRE

sub main()
 '[ERROR][ASSERT] DTSValue.parseDate: unexpected object: 'ArrayList'
  dim lst: set lst = CreateObject("System.Collections.ArrayList")
  dim obj: set obj = (new DTStamp)(lst)  
end sub

main()
