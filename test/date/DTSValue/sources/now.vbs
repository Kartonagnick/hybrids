
'--- local/hybrids                                     [test][DTSValue][now.vbs]
'[2024-08-20][19:00:00] 001 Kartonagnick    
'  --- CastleOfDreams/hybrids                          [test][DTSValue][now.vbs]
'  [2022-03-16][19:00:00] 001 Kartonagnick

sub main()
  dim deep: deep = 0: dim dtv: dim diff

 'by default DTSValue has the current date and time
  set dtv = new DTSValue: dtv.now

 'in seconds: result = now() - dtv.date
  diff = DateDiff("s", now(), dtv.date)

  eq_compare deep, 1, diff <= 1          , true 
  eq_compare deep, 2, Cint(dtv.ms) < 1000, true 
  eq_compare deep, 3, Cint(dtv.ms) >= 0  , true 

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] DTSValue.now"
  else
    echo deep, "[ERROR] DTSValue.now"
    WScript.Quit 1
  end if
end sub

main()
