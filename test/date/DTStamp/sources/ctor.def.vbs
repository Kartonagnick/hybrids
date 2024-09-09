
'--- local/hybrids                                 [test][DTStamp][ctor.def.vbs]
'[2024-09-09][19:00:00] 005 Kartonagnick    
'  --- CastleOfDreams/vbs                                [test][date][stamp.vbs]
'  [2021-09-06][19:00:00] 004 Kartonagnick
'  [2021-09-02][18:00:00] 003 Kartonagnick
'  [2021-09-01][18:00:00] 002 Kartonagnick
'  [2021-08-25][18:00:00] 001 Kartonagnick

sub main()
  dim obj, cur, diff, deep: deep = 0

  set obj = new DTStamp
  cur = date() + timer() / 86400
  diff = DateDiff("s", obj.date, cur)
  eqCompare deep, 0, diff <= 1           , true 
  eqCompare deep, 1, Cint(obj.ms) < 1000 , true 
  eqCompare deep, 2, Cint(obj.ms) >= 0   , true 
  eqCompare deep, 3, obj.import, "YY-MM-DD hh:mm:ss.ms"
  eqCompare deep, 4, obj.export, "YY-MM-DD hh:mm:ss.ms"

  if not gMY_TEST then
    echo deep, "[ERROR] DTStamp: default constructor"
    WScript.Quit 1
  end if
end sub

main()
