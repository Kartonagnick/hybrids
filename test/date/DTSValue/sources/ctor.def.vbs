
'--- local/hybrids                                [test][DTSValue][ctor.def.vbs]
'[2024-08-01][19:00:00] 001 Kartonagnick    
'  --- CastleOfDreams/hybrids                 [test][DTSValue][ctor.default.vbs]
'  [2022-03-16][19:00:00] 001 Kartonagnick

dim deep: deep = 0

sub main()

 'by default DTSValue has the current date and time
  dim dtv: set dtv = new DTSValue

 'in seconds: result = now() - dtv.date
  dim diff: diff = DateDiff("s", now(), dtv.date)

  eqCompare deep, 1, diff <= 1          , true 
  eqCompare deep, 2, Cint(dtv.ms) < 1000, true 
  eqCompare deep, 3, Cint(dtv.ms) >= 0  , true 

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue: default constructor"
    WScript.Quit 1
  end if
end sub

main()
