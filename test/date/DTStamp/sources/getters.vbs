
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
  
  eqCompare deep, 1, obj.date, #31/08/2021#
  eqCompare deep, 2, obj.yy  , "2021"
  eqCompare deep, 3, obj.mo  , "08"
  eqCompare deep, 4, obj.dd  , "31"
  eqCompare deep, 5, obj.hh  , "00"
  eqCompare deep, 6, obj.mm  , "00"
  eqCompare deep, 7, obj.ss  , "00"
  eqCompare deep, 8, obj.ms  , "789"
  
  obj.date = #31/08/2021 02:05:04#
  obj.ms = 234
  
  eqCompare deep, 09, obj.date, #31/08/2021 02:05:04#
  eqCompare deep, 10, obj.yy  , "2021"
  eqCompare deep, 11, obj.mo  , "08"
  eqCompare deep, 12, obj.dd  , "31"
  eqCompare deep, 13, obj.hh  , "02"
  eqCompare deep, 14, obj.mm  , "05"
  eqCompare deep, 15, obj.ss  , "04"
  eqCompare deep, 16, obj.ms  , "234"

  if not gMY_TEST then
    echo deep, "[ERROR] DTStamp getters"
    WScript.Quit 1
  end if
end sub

main()
