
'--- local/hybrids                        [test][DTSValue][ctor.ms.assert-2.vbs]
'[2024-08-08][19:00:00] 001 Kartonagnick PRE

sub main()
 '[ERROR][ASSERT] toNumeric: unexpected object: 'ArrayList'
  dim lst: set lst = CreateObject("System.Collections.ArrayList")
  dim dtv: set dtv = (new DTSValue)(1, lst)  
end sub

main()
