
'--- local/hybrids                         [test][DTSImport][parse.except.2.vbs]
'[2024-08-29][19:00:00] 005 Kartonagnick PRE
'  --- CastleOfDreams/vbs                               [test][date][import.vbs]
'  [2021-09-06][19:00:00] 004 Kartonagnick
'  [2021-08-28][18:00:00] 003 Kartonagnick
'  [2021-08-23][18:00:00] 002 Kartonagnick
'  [2021-08-19][18:00:00] 001 Kartonagnick

dim deep: deep = 0
dim format

sub test(id, value)
  dim obj, dtv
  on error resume Next: err.clear
  set obj = (new DTSImport)(format)
  set dtv = obj.parse(value)
  saveException: on error goto 0
  checkException deep, id, errorOutRange
end sub

sub main()

'--- out range
  format = ""
  test 1, "10000-12-15 12:30:23.123"
  test 2, "2021-13-15 12:30:23.123" 
  test 3, "2021-12-32 12:30:23.123" 
  test 4, "2021-12-31 24:30:23.123" 
  test 5, "2021-12-31 23:60:23.123" 
  test 6, "2021-12-31 23:59:60.123" 
  test 7, "2021-12-31 23:59:59.1000"

'--- out range
  format = Null
  test 8, "10000-12-15 12:30:23.123"
  test 9, "2021-13-15 12:30:23.123" 
  test 10, "2021-12-32 12:30:23.123" 
  test 11, "2021-12-31 24:30:23.123" 
  test 12, "2021-12-31 23:60:23.123" 
  test 13, "2021-12-31 23:59:60.123" 
  test 14, "2021-12-31 23:59:59.1000"

'--- out range
  format = Empty
  test 15, "10000-12-15 12:30:23.123"
  test 16, "2021-13-15 12:30:23.123" 
  test 17, "2021-12-32 12:30:23.123" 
  test 18, "2021-12-31 24:30:23.123" 
  test 19, "2021-12-31 23:60:23.123" 
  test 20, "2021-12-31 23:59:60.123" 
  test 21, "2021-12-31 23:59:59.1000"

'--- out range
  set format = Nothing
  test 22, "10000-12-15 12:30:23.123"
  test 23, "2021-13-15 12:30:23.123" 
  test 24, "2021-12-32 12:30:23.123" 
  test 25, "2021-12-31 24:30:23.123" 
  test 26, "2021-12-31 23:60:23.123" 
  test 27, "2021-12-31 23:59:60.123" 
  test 28, "2021-12-31 23:59:59.1000"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSImport.parse.except.2"
    WScript.Quit 1
  end if
end sub

main()
