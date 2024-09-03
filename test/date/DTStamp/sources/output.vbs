
'--- local/hybrids                                   [test][DTStamp][output.vbs]
'[2024-09-14][19:00:00] 005 Kartonagnick    
'  --- CastleOfDreams/vbs                                [test][date][stamp.vbs]
'  [2021-09-06][19:00:00] 004 Kartonagnick
'  [2021-09-02][18:00:00] 003 Kartonagnick
'  [2021-09-01][18:00:00] 002 Kartonagnick
'  [2021-08-25][18:00:00] 001 Kartonagnick

sub main()
  dim obj, ms, deep: deep = 0

  set obj = new DTStamp
  obj.date = #15/08/2021 02:05:04#
  obj.ms = 567

  eqCompare deep, 1, obj.timeOnly , "02:05:04"
  eqCompare deep, 2, obj.timeStamp, "02:05:04.567"
  eqCompare deep, 3, obj.dateStamp, "2021-08-15"
  eqCompare deep, 4, obj.logsStamp, "[2021-08-15][02:05:04.567]"
  eqCompare deep, 5, obj.fileStamp, "[2021-08m-15][02h-05m]"

  obj.ms =   1: eqCompare deep, 5, obj.timeStamp, "02:05:04.001"
  obj.ms =  10: eqCompare deep, 6, obj.timeStamp, "02:05:04.010"
  obj.ms = 100: eqCompare deep, 7, obj.timeStamp, "02:05:04.100"

  if not gMY_TEST then
    echo deep, "[ERROR] DTStamp stamps"
    WScript.Quit 1
  end if
end sub

main()
