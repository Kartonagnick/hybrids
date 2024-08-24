
'--- local/hybrids                               [test][DTSValue][assert-13.vbs]
'[2024-08-24][19:00:00] 001 Kartonagnick PRE
'  --- CastleOfDreams/hybrids                              [date][assert-13.vbs]
'  [2022-03-06][19:00:00] 001 Kartonagnick

sub main
  echo 0, "main: run..."
  echo 1, "[EXPECTED ASSERT-ERROR] unexpected type: 'Boolean'"

  dim dtv: set dtv = new DTSValue
  dtv.ms = true  

  echo 0, "main: done!"
end sub

main
