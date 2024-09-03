
'--- local/hybrids                                  [test][DTSExport][stamp.vbs]
'[2024-08-29][19:00:00] 005 Kartonagnick PRE
'  --- CastleOfDreams/vbs                               [test][date][export.vbs]
'  [2021-09-06][19:00:00] 004 Kartonagnick
'  [2021-08-27][18:00:00] 003 Kartonagnick
'  [2021-08-24][18:00:00] 002 Kartonagnick
'  [2021-08-20][18:00:00] 001 Kartonagnick

dim deep: deep = 0

sub test(id, format, value, etalon)
  dim obj, result
  set obj = (new DTSExport)(format)
  result = obj.stamp(value)
  eq_compare deep, id, result, etalon
end sub

sub main()
  dim dt, dtv, dts

'--- typical  

  dt = #2000-11-25 12:13:15#
  set dtv = (new DTSValue)(dt, 123)
 'set dts = (new DTStamp )("2000-11-25 12:13:15.123")

  '         format                source value               result
  test 1, "FI YY/MM/DD TT SE TT",     dt       , "FI 2000/11/25 12:13:15.000 SE 12:13:15.000"
  test 2, "date:YYMMDD"         ,     dt       , "date:20001125"
  test 3, "date"                ,     dt       , "date"
  test 4, "YY-MM-DD TT"         ,     10       , "1970-01-01 00:00:10.000"
  test 5, ""                    ,     0        , "1970-01-01 00:00:00.000"
  test 6, ""                    ,     1        , "1970-01-01 00:00:01.000"
  test 7, ""                    ,     dt       , "2000-11-25 12:13:15.000"
  test 8, ""                    ,     dtv      , "2000-11-25 12:13:15.123"
 'test 9, ""                    ,     dts      , "2000-11-25 12:13:15.123"

  if not gMY_TEST = true then
    echo deep, "[ERROR] DTSExport.stamp"
    WScript.Quit 1
  end if
end sub

main()
