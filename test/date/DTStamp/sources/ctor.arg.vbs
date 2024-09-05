
'--- local/hybrids                                 [test][DTStamp][ctor.arg.vbs]
'[2024-09-09][19:00:00] 005 Kartonagnick PRE
'  --- CastleOfDreams/vbs                                [test][date][stamp.vbs]
'  [2021-09-06][19:00:00] 004 Kartonagnick
'  [2021-09-02][18:00:00] 003 Kartonagnick
'  [2021-09-01][18:00:00] 002 Kartonagnick
'  [2021-08-25][18:00:00] 001 Kartonagnick

sub main()
  dim deep: deep = 0
  dim obj, import, export, value

  set obj = (new DTStamp)("2021-08-21 12:33:44.123")
  eq_compare  deep, 1, obj.date     , #2021/08/21 12:33:44#
  eq_compare  deep, 2, obj.ms       , "123"

  set obj = (new DTStamp)(#2021/08/21 12:33:44#)
  eq_compare deep,  3, obj.date     , #2021/08/21 12:33:44#
  eq_compare deep,  4, obj.ms       , "000"

  set obj = (new DTStamp)(10)
  eq_compare deep,  5, obj.date     , #1970/01/01 00:00:10#
  eq_compare deep,  6, obj.ms       , "000"

  set import = (new DTSImport)("YY hh")
  set obj = (new DTStamp)(import)
  eq_compare deep,  7, import.format, "YY hh"
  eq_compare deep,  8, obj.import   , import.format
  obj.import = "MM mm"
  eq_compare deep,  9, obj.import   , "MM mm"
  eq_compare deep, 10, import.format, "YY hh"

  set export = (new DTSExport)("YY hh")
  set obj = (new DTStamp)(export)
  eq_compare deep, 11, export.format, "YY hh"
  eq_compare deep, 12, obj.export   , export.format

  obj.export = "MM mm"
  eq_compare deep, 13, export.format, "YY hh"
  eq_compare deep, 14, obj.export   , "MM mm"

  set value = (new DTSValue)(10, 123)
  set obj = (new DTStamp)(value)
  eq_compare deep, 15, value.date   , #1970/01/01 00:00:10#
  eq_compare deep, 16, value.ms     , "123"
  eq_compare deep, 17, obj.date     , #1970/01/01 00:00:10#
  eq_compare deep, 18, obj.ms       , "123"
  value.date = 20
  value.ms = 456
  eq_compare deep, 19, obj.date     , #1970/01/01 00:00:10#
  eq_compare deep, 20, obj.ms       , "123"
  eq_compare deep, 21, value.date   , #1970/01/01 00:00:20#
  eq_compare deep, 22, value.ms     , "456"

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] DTStamp: constructor with param"
  else
    echo deep, "[ERROR] DTStamp: constructor with param"
    WScript.Quit 1
  end if
end sub

main()
