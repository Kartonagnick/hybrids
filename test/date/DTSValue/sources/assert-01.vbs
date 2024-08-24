
'--- local/hybrids                               [test][DTSValue][assert-01.vbs]
'[2024-08-24][19:00:00] 001 Kartonagnick    
'  --- CastleOfDreams/hybrids                               [date][assert-1.vbs]
'  [2022-03-06][19:00:00] 001 Kartonagnick

class Sample 
end class

sub main
  echo 0, "main: run..."
  echo 1, "[EXPECTED ASSERT-ERROR] unexpected object: 'Sample'"

  dim obj, dtv
  set obj =  new Sample
  set dtv = (new DTSValue)(obj, "1")  

  echo 0, "main: done!"
end sub

main
