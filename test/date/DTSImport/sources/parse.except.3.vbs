
'--- local/hybrids                         [test][DTSImport][parse.except.3.vbs]
'[2024-08-29][19:00:00] 005 Kartonagnick PRE
'  --- CastleOfDreams/vbs                               [test][date][import.vbs]
'  [2021-09-06][19:00:00] 004 Kartonagnick
'  [2021-08-28][18:00:00] 003 Kartonagnick
'  [2021-08-23][18:00:00] 002 Kartonagnick
'  [2021-08-19][18:00:00] 001 Kartonagnick

dim deep: deep = 0
dim format

sub test(id, value)
  on error resume Next
  err.clear
  dim obj: set obj = (new DTSImport)(Nothing)
  dim dtv: set dtv = obj.parse(value)
  check_exception deep, id, errorInvalidText
  on error goto 0
end sub

sub main()

'--- incorrect source text
  format = ""
  test 1, "2021-12-15 33"
  test 2, "abc 2021-12-15"
  test 3, "2021-12-15 12:30"
  test 4, "2021-12-15 :30:23"
  test 5, "2021-12-15 -12:30:23"
  test 6, "2021-12-15 12:b30:23"
  test 7, "2021-12-15 12:30:-23"
  test 8, "2021-12-15 12:30:23.-123"

'--- incorrect source text
  format = Null
  test  9, "2021-12-15 33"
  test 10, "abc 2021-12-15"
  test 11, "2021-12-15 12:30"
  test 12, "2021-12-15 :30:23"
  test 13, "2021-12-15 -12:30:23"
  test 14, "2021-12-15 12:b30:23"
  test 15, "2021-12-15 12:30:-23"
  test 16, "2021-12-15 12:30:23.-123"

'--- incorrect source text
  format = Empty
  test 17, "2021-12-15 33"
  test 18, "abc 2021-12-15"
  test 19, "2021-12-15 12:30"
  test 20, "2021-12-15 :30:23"
  test 21, "2021-12-15 -12:30:23"
  test 22, "2021-12-15 12:b30:23"
  test 23, "2021-12-15 12:30:-23"
  test 24, "2021-12-15 12:30:23.-123"

'--- incorrect source text
  set format = Nothing
  test 25, "2021-12-15 33"
  test 26, "abc 2021-12-15"
  test 27, "2021-12-15 12:30"
  test 28, "2021-12-15 :30:23"
  test 29, "2021-12-15 -12:30:23"
  test 30, "2021-12-15 12:b30:23"
  test 31, "2021-12-15 12:30:-23"
  test 32, "2021-12-15 12:30:23.-123"

'--- incorrect source text
  test 33, "X021-12-15 12:30:23.123"
  test 34, "2021-X2-15 12:30:23.123"
  test 35, "2021-12-X5 12:30:23.123"
  test 36, "2021-12-15 X2:30:23.123"
  test 37, "2021-12-15 22:X0:23.123"
  test 38, "2021-12-15 22:30:X3.123"
  test 39, "2021-12-15 22:30:23.X23"
  test 40, ""

'--- inconsistent source string
  format = "YY-MM"
  test 18, "val 2024-10"
  test 19, "2024-10-25"

  if not gMY_TEST = true then
    echo deep, "[ERROR] DTSImport.parse.except.3"
    WScript.Quit 1
  end if
end sub

main()
