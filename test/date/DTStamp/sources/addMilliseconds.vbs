
'--- local/hybrids                          [test][DTStamp][addMilliseconds.vbs]
'[2024-09-14][19:00:00] 005 Kartonagnick PRE
'  --- CastleOfDreams/vbs                                [test][date][stamp.vbs]
'  [2021-09-06][19:00:00] 004 Kartonagnick
'  [2021-09-02][18:00:00] 003 Kartonagnick
'  [2021-09-01][18:00:00] 002 Kartonagnick
'  [2021-08-25][18:00:00] 001 Kartonagnick

sub main()
  dim obj, deep: deep = 0

  set obj = (new DTStamp)("2021y-08m-31d 12:35:31.345")
  obj.addMilliseconds 1123 
  eqCompare deep, 1, obj.date, #31/08/2021 12:35:32#
  eqCompare deep, 2, obj.ms  , "468"

  set obj = (new DTStamp)("2021y-08m-31d 12:35:30.345")
  obj.addMilliseconds -45
  eqCompare deep, 3, obj.date, #31/08/2021 12:35:30#
  eqCompare deep, 4, obj.ms  , "300"

  set obj = (new DTStamp)("2021y-08m-31d 12:35:30.045")
  obj.addMilliseconds -145
  eqCompare deep, 5, obj.date, #31/08/2021 12:35:29#
  eqCompare deep, 6, obj.ms  , "900"

  set obj = (new DTStamp)(#14/08/2021 16:34:22#)
  obj.addMilliseconds 1123
  eqCompare deep, 7, obj.logsStamp, "[2021-08-14][16:34:23.123]"

  set obj = (new DTStamp)("2021y-08m-31d 12:35:31.345")
  obj.addMilliseconds 0 
  eqCompare deep, 8, obj.date, #31/08/2021 12:35:31#
  eqCompare deep, 9, obj.ms  , "345"

  if not gMY_TEST then
    echo deep, "[ERROR] DTStamp.addMilliseconds"
    WScript.Quit 1
  end if
end sub

main()
