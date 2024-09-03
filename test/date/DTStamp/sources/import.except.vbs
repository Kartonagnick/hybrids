
'--- local/hybrids                            [test][DTStamp][import.except.vbs]
'[2024-09-14][19:00:00] 005 Kartonagnick    
'  --- CastleOfDreams/vbs                                [test][date][stamp.vbs]
'  [2021-09-06][19:00:00] 004 Kartonagnick
'  [2021-09-02][18:00:00] 003 Kartonagnick
'  [2021-09-01][18:00:00] 002 Kartonagnick
'  [2021-08-25][18:00:00] 001 Kartonagnick

sub test(deep, id, obj, str_date, err_type)
  err.clear
  on error resume Next
  obj.date = str_date
  check_exception deep, id, err_type
  on error goto 0
end sub

sub main()
  dim deep: deep = 0

  dim obj: set obj = new DTStamp
  obj.import = "AA YY-DD BB"

 'DTSImport.parse: invalid sequence: 'XX 2021-08 BB' 
  test deep, 1, obj, "XX 2021-08 BB", errorInvalidText

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] DTStamp.import"
  else
    echo deep, "[ERROR] DTStamp.import"
    WScript.Quit 1
  end if
end sub

main()
