
'--- local/hybrids                                      [test][DTStamp][now.vbs]
'[2024-09-14][19:00:00] 005 Kartonagnick PRE
'  --- CastleOfDreams/vbs                                [test][date][stamp.vbs]
'  [2021-09-06][19:00:00] 004 Kartonagnick
'  [2021-09-02][18:00:00] 003 Kartonagnick
'  [2021-09-01][18:00:00] 002 Kartonagnick
'  [2021-08-25][18:00:00] 001 Kartonagnick

sub main()
  dim obj, d, t, cur, diff, deep: deep = 0

  set obj = (new DTStamp)(0)
  obj.now()
  d = date()
  t = timer()
  cur = d + t / 86400
  diff = DateDiff("s", obj.date, cur)

  eq_compare deep, 1, diff <= 1          , true 
  eq_compare deep, 2, Cint(obj.ms) < 1000, true 
  eq_compare deep, 3, Cint(obj.ms) >= 0  , true 

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] DTStamp.now"
  else
    echo deep, "[ERROR] DTStamp.now"
    WScript.Quit 1
  end if
end sub

main()