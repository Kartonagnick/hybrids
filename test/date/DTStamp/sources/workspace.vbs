
'--- local/hybrids                                [test][DTStamp][workspace.vbs]
'[2024-09-14][19:00:00] 005 Kartonagnick    
'  --- CastleOfDreams/vbs                                [test][date][stamp.vbs]
'  [2021-09-06][19:00:00] 004 Kartonagnick
'  [2021-09-02][18:00:00] 003 Kartonagnick
'  [2021-09-01][18:00:00] 002 Kartonagnick
'  [2021-08-25][18:00:00] 001 Kartonagnick

sub main()
  dim obj, deep: deep = 0

  set obj = new DTStamp
  obj.date = "2021y-08m-25d 12:23:45.123"
  eqCompare deep, 1, obj.stamp, "2021-08-25 12:23:45.123"

  set obj = new DTStamp
  obj.date = "2021-08m-25 12:23:45.123"
  eqCompare deep, 2, obj.stamp, "2021-08-25 12:23:45.123"

  set obj = new DTStamp
  obj.date = "2021y-08m-25d 12:23:45.123"
  eqCompare deep, 3, obj.stamp, "2021-08-25 12:23:45.123"

  if not gMY_TEST then
    echo deep, "[ERROR] DTStamp usage-workspace"
    WScript.Quit 1
  end if
end sub

main()
