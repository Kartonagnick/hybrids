
'--- local/hybrids                                [test][DTSValue][ctor.def.vbs]
'[2024-08-01][19:00:00] 001 Kartonagnick PRE
'  --- CastleOfDreams/hybrids                 [test][DTSValue][ctor.default.vbs]
'  [2022-03-16][19:00:00] 001 Kartonagnick

sub main()
  dim deep: deep = 0

 'by default DTSValue has the current date and time
  dim dtv: set dtv = new DTSValue

 'in seconds: result = now() - dtv.date
  dim diff: diff = DateDiff("s", now(), dtv.date)

  eq_compare deep, 1, diff <= 1          , true 
  eq_compare deep, 2, Cint(dtv.ms) < 1000, true 
  eq_compare deep, 3, Cint(dtv.ms) >= 0  , true 

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] DTSValue: default constructor"
  else
    echo deep, "[ERROR] DTSValue: default constructor"
    WScript.Quit 1
  end if
end sub

main()
