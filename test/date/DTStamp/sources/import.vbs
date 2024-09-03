
'--- local/hybrids                                   [test][DTStamp][import.vbs]
'[2024-09-14][19:00:00] 005 Kartonagnick    
'  --- CastleOfDreams/vbs                                [test][date][stamp.vbs]
'  [2021-09-06][19:00:00] 004 Kartonagnick
'  [2021-09-02][18:00:00] 003 Kartonagnick
'  [2021-09-01][18:00:00] 002 Kartonagnick
'  [2021-08-25][18:00:00] 001 Kartonagnick

sub main()
  dim deep: deep = 0
  dim obj: set obj = new DTStamp
  obj.import = "AA YY-DD BB"
  obj.date   = "AA 2021-08 BB"
  eq_compare deep, 1, obj.import, "AA YY-DD BB"
  eq_compare deep, 2, obj.date  , #2021/01/08 00:00:00#
  eq_compare deep, 3, obj.ms    , "000"

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] DTStamp.import"
  else
    echo deep, "[ERROR] DTStamp.import"
    WScript.Quit 1
  end if
end sub

main()
