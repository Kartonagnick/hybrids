
'--- local/hybrids                                    [test][DTStamp][value.vbs]
'[2024-09-14][19:00:00] 005 Kartonagnick    
'  --- CastleOfDreams/vbs                                [test][date][stamp.vbs]
'  [2021-09-06][19:00:00] 004 Kartonagnick
'  [2021-09-02][18:00:00] 003 Kartonagnick
'  [2021-09-01][18:00:00] 002 Kartonagnick
'  [2021-08-25][18:00:00] 001 Kartonagnick

sub main()
  dim val, obj, ref, deep: deep = 0

  set val = (new DTSValue)(10, 123)
  set obj = new DTStamp
  set obj.value = val

  eqCompare deep, 41, val.date, #1970/01/01 00:00:10#
  eqCompare deep, 42, val.ms  , "123"
  eqCompare deep, 43, obj.date, #1970/01/01 00:00:10#
  eqCompare deep, 44, obj.ms  , "123"

  val.date = 20
  val.ms = 456

  eqCompare deep, 45, obj.date, #1970/01/01 00:00:10#
  eqCompare deep, 46, obj.ms  , "123"
  eqCompare deep, 47, val.date, #1970/01/01 00:00:20#
  eqCompare deep, 48, val.ms  , "456"

  set ref = obj.value: ref.date = 50

  eqCompare deep, 49, obj.date, #1970/01/01 00:00:50#
  eqCompare deep, 50, obj.ms  , "000"

  if not gMY_TEST then
    echo deep, "[ERROR] DTStamp.value"
    WScript.Quit 1
  end if
end sub

main()
