
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
  eq_compare deep, 0, diff <= 1           , true 
  eq_compare deep, 1, Cint(obj.ms) < 1000 , true 
  eq_compare deep, 2, Cint(obj.ms) >= 0   , true 
  eq_compare deep, 3, obj.import, "YY-MM-DD hh:mm:ss.ms"
  eq_compare deep, 4, obj.export, "YY-MM-DD hh:mm:ss.ms"

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] DTStamp: default constructor"
  else
    echo deep, "[ERROR] DTStamp: default constructor"
    WScript.Quit 1
  end if
end sub

main()
