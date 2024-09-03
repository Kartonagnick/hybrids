
'--- local/hybrids                                  [test][DTStamp][getters.vbs]
'[2024-09-14][19:00:00] 005 Kartonagnick    
'  --- CastleOfDreams/vbs                                [test][date][stamp.vbs]
'  [2021-09-06][19:00:00] 004 Kartonagnick
'  [2021-09-02][18:00:00] 003 Kartonagnick
'  [2021-09-01][18:00:00] 002 Kartonagnick
'  [2021-08-25][18:00:00] 001 Kartonagnick

sub main()
  dim obj, deep: deep = 0

  set obj = (new DTStamp)(#31/08/2021#)
  obj.date = #31/08/2021#
  obj.ms = 789
  
  eq_compare deep, 1, obj.date, #31/08/2021#
  eq_compare deep, 2, obj.yy  , "2021"
  eq_compare deep, 3, obj.mo  , "08"
  eq_compare deep, 4, obj.dd  , "31"
  eq_compare deep, 5, obj.hh  , "00"
  eq_compare deep, 6, obj.mm  , "00"
  eq_compare deep, 7, obj.ss  , "00"
  eq_compare deep, 8, obj.ms  , "789"
  
  obj.date = #31/08/2021 02:05:04#
  obj.ms = 234
  
  eq_compare deep, 09, obj.date, #31/08/2021 02:05:04#
  eq_compare deep, 10, obj.yy  , "2021"
  eq_compare deep, 11, obj.mo  , "08"
  eq_compare deep, 12, obj.dd  , "31"
  eq_compare deep, 13, obj.hh  , "02"
  eq_compare deep, 14, obj.mm  , "05"
  eq_compare deep, 15, obj.ss  , "04"
  eq_compare deep, 16, obj.ms  , "234"

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] DTStamp getters"
  else
    echo deep, "[ERROR] DTStamp getters"
    WScript.Quit 1
  end if
end sub

main()
