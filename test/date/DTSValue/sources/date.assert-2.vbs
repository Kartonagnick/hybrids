
'--- local/hybrids                           [test][DTSValue][date-assert-2.vbs]
'[2024-08-14][19:00:00] 001 Kartonagnick PRE

sub main()
 '[ERROR][ASSERT] DTSValue.parseDate: unexpected object: 'ArrayList'
  dim lst: set lst = CreateObject("System.Collections.ArrayList")
  dim dtv: set dtv = new DTSValue
  dtv.date = lst
end sub

main()
