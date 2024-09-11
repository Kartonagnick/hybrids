
'--- local/hybrids                            [test][DTStamp][import.except.vbs]
'[2024-09-14][19:00:00] 005 Kartonagnick PRE
'  --- CastleOfDreams/vbs                                [test][date][stamp.vbs]
'  [2021-09-06][19:00:00] 004 Kartonagnick
'  [2021-09-02][18:00:00] 003 Kartonagnick
'  [2021-09-01][18:00:00] 002 Kartonagnick
'  [2021-08-25][18:00:00] 001 Kartonagnick

dim deep: deep = 0

sub test(id, obj, str_date, err_type)
  on error resume Next: err.clear
  obj.date = str_date
  saveException: on error goto 0
  checkException deep, id, err_type
end sub

sub main()
  dim obj: set obj = new DTStamp
  obj.import = "AA YY-DD BB"

 'DTSImport.parse: invalid sequence: 'XX 2021-08 BB' 
  test 1, obj, "XX 2021-08 BB", errorInvalidText

  if not gMY_TEST then
    echo deep, "[ERROR] DTStamp.import"
    WScript.Quit 1
  end if
end sub

main()
