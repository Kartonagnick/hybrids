
'--- local/hybrids                               [test][DTSValue][assert-16.vbs]
'[2024-08-24][19:00:00] 001 Kartonagnick PRE
'  --- CastleOfDreams/hybrids                              [date][assert-16.vbs]
'  [2022-03-06][19:00:00] 001 Kartonagnick

class Sample 
end class

sub main
  echo 0, "main: run..."
  echo 1, "[EXPECTED ASSERT-ERROR] unexpected object: 'Sample'"

  dim obj, dtv
  set obj = new Sample
  set dtv = new DTSValue
  dtv.ms = obj

  echo 0, "main: done!"
end sub

main
