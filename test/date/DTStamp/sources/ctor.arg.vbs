
'--- local/hybrids                                 [test][DTStamp][ctor.arg.vbs]
'[2024-09-09][19:00:00] 005 Kartonagnick    
'  --- CastleOfDreams/vbs                                [test][date][stamp.vbs]
'  [2021-09-06][19:00:00] 004 Kartonagnick
'  [2021-09-02][18:00:00] 003 Kartonagnick
'  [2021-09-01][18:00:00] 002 Kartonagnick
'  [2021-08-25][18:00:00] 001 Kartonagnick

sub main()
  dim deep: deep = 0
  dim obj, import, export, value

  set obj = (new DTStamp)("2021-08-21 12:33:44.123")
  eqCompare deep, 1, obj.date      , #2021/08/21 12:33:44#
  eqCompare deep, 2, obj.ms        , "123"

  set obj = (new DTStamp)(#2021/08/21 12:33:44#)
  eqCompare deep,  3, obj.date     , #2021/08/21 12:33:44#
  eqCompare deep,  4, obj.ms       , "000"

  set obj = (new DTStamp)(10)
  eqCompare deep,  5, obj.date     , #1970/01/01 00:00:10#
  eqCompare deep,  6, obj.ms       , "000"

  set import = (new DTSImport)("YY hh")
  set obj = (new DTStamp)(import)
  eqCompare deep,  7, import.format, "YY hh"
  eqCompare deep,  8, obj.import   , import.format
  obj.import = "MM mm"
  eqCompare deep,  9, obj.import   , "MM mm"
  eqCompare deep, 10, import.format, "YY hh"

  set export = (new DTSExport)("YY hh")
  set obj = (new DTStamp)(export)
  eqCompare deep, 11, export.format, "YY hh"
  eqCompare deep, 12, obj.export   , export.format

  obj.export = "MM mm"
  eqCompare deep, 13, export.format, "YY hh"
  eqCompare deep, 14, obj.export   , "MM mm"

  set value = (new DTSValue)(10, 123)
  set obj = (new DTStamp)(value)
  eqCompare deep, 15, value.date   , #1970/01/01 00:00:10#
  eqCompare deep, 16, value.ms     , "123"
  eqCompare deep, 17, obj.date     , #1970/01/01 00:00:10#
  eqCompare deep, 18, obj.ms       , "123"
  value.date = 20
  value.ms = 456
  eqCompare deep, 19, obj.date     , #1970/01/01 00:00:10#
  eqCompare deep, 20, obj.ms       , "123"
  eqCompare deep, 21, value.date   , #1970/01/01 00:00:20#
  eqCompare deep, 22, value.ms     , "456"

  if not gMY_TEST then
    echo deep, "[ERROR] DTStamp: constructor with param"
    WScript.Quit 1
  end if
end sub

main()
