
'--- local/hybrids                                   [test][DTStamp][export.vbs]
'[2024-09-14][19:00:00] 005 Kartonagnick PRE
'  --- CastleOfDreams/vbs                                [test][date][stamp.vbs]
'  [2021-09-06][19:00:00] 004 Kartonagnick
'  [2021-09-02][18:00:00] 003 Kartonagnick
'  [2021-09-01][18:00:00] 002 Kartonagnick
'  [2021-08-25][18:00:00] 001 Kartonagnick

sub main()
  dim obj, deep: deep = 0
  set obj = new DTStamp
  obj.import = "YY-MM-DD"
  obj.export = "result: YY-DD"
  obj.date   = "2021-08-25"
  eqCompare deep, 1, obj.date  ,  #2021/08/25#
  eqCompare deep, 2, obj.export, "result: YY-DD"
  eqCompare deep, 3, obj.ms    , "000"

  if not gMY_TEST then
    echo deep, "[ERROR] DTStamp.export"
    WScript.Quit 1
  end if
end sub

main()
