
'--- local/hybrids                                    [test][DTStamp][clone.vbs]
'[2024-09-09][19:00:00] 005 Kartonagnick    
'  --- CastleOfDreams/vbs                                [test][date][stamp.vbs]
'  [2021-09-06][19:00:00] 004 Kartonagnick
'  [2021-09-02][18:00:00] 003 Kartonagnick
'  [2021-09-01][18:00:00] 002 Kartonagnick
'  [2021-08-25][18:00:00] 001 Kartonagnick

sub main()
  dim obj1, obj2, deep: deep = 0

  set obj1 = new DTStamp

  eqCompare deep, 1, obj1.import, "YY-MM-DD hh:mm:ss.ms"
  eqCompare deep, 2, obj1.export, "YY-MM-DD hh:mm:ss.ms"

  set obj2 = obj1.clone()

  eqCompare deep, 3, obj2.import, "YY-MM-DD hh:mm:ss.ms"
  eqCompare deep, 4, obj2.export, "YY-MM-DD hh:mm:ss.ms"
  eqCompare deep, 5, obj2.date  , obj2.date
  eqCompare deep, 6, obj1.ms    , obj2.ms

  obj2.import = "YY-MM-DD"
  obj2.export = "YY-MM-DD"

  eqCompare deep,  7, obj1.import, "YY-MM-DD hh:mm:ss.ms"
  eqCompare deep,  8, obj1.export, "YY-MM-DD hh:mm:ss.ms"
  eqCompare deep,  9, obj2.import, "YY-MM-DD"
  eqCompare deep, 10, obj2.export, "YY-MM-DD"

  if not gMY_TEST = true then
    echo deep, "[ERROR] DTStamp.clone"
    WScript.Quit 1
  end if
end sub

main()
