
'--- local/hybrids                       [test][DTStamp][ctor.string.except.vbs]
'[2024-09-09][19:00:00] 005 Kartonagnick    
'  --- CastleOfDreams/vbs                                [test][date][stamp.vbs]
'  [2021-09-06][19:00:00] 004 Kartonagnick
'  [2021-09-02][18:00:00] 003 Kartonagnick
'  [2021-09-01][18:00:00] 002 Kartonagnick
'  [2021-08-25][18:00:00] 001 Kartonagnick

dim deep: deep = 0

sub test(id, value, err_type)
  on error resume Next
  err.clear
  set obj = (new DTStamp)(value)
  check_exception deep, id, err_type
  on error goto 0
end sub

sub main()

  test 1, "invalid"                  , errorInvalidText
  test 2, "2024-12-12"               , errorInvalidText

  test 3, "20000-12-12 12:13:14.123" , errorOutRange
  test 4, "2024-34-12 12:13:14.123"  , errorOutRange
  test 5, "2024-12-34 12:13:14.123"  , errorOutRange
  test 6, "2024-11-11 25:12:13.123"  , errorOutRange
  test 7, "2024-11-11 24:60:13.123"  , errorOutRange
  test 8, "2024-11-11 24:59:60.123"  , errorOutRange
  test 9, "2024-11-11 24:59:59.1235" , errorOutRange

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] DTStamp: exception from constructor"
  else
    echo deep, "[ERROR] DTStamp: exception from constructor"
    WScript.Quit 1
  end if
end sub

main()
