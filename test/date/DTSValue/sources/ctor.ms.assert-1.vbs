
'--- local/hybrids                        [test][DTSValue][ctor.ms.assert-1.vbs]
'[2024-08-08][19:00:00] 001 Kartonagnick PRE

sub main()
 '[ERROR][ASSERT] toNumeric: unexpected type: 'array'
  dim arr: arr = array()
  dim dtv: set dtv = (new DTSValue)(1, arr)  
end sub

main()
