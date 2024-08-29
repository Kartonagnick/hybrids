
'--- local/hybrids                         [test][DTSImport][parse.except.1.vbs]
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
  dim obj: set obj = (new DTSImport)(format)
  dim dtv: set dtv = obj.parse(value)
  check_exception deep, id, errorInvalidText
  on error goto 0
end sub

sub main()

'---- incorrect parse-text
  format = ""
  test 1, "2021-12-15 33"
  test 2, "abc 2021-12-15"
  test 3, "2021-12-15 12:30"
  test 4, "2021-12-15 :30:23"
  test 5, "2021-12-15 -12:30:23"
  test 6, "2021-12-15 12:b30:23"
  test 7, "2021-12-15 12:30:-23"

'---- incorrect parse-text
  set format = Nothing
  test 10, "2021-12-15 33"
  test 11, "abc 2021-12-15"
  test 12, "2021-12-15 12:30"
'  test 13, "2021-12-15 12:30:23"
  test 14, "2021-12-15 -12:30:23"
  test 15, "2021-12-15 12:b30:23"
  test 16, "2021-12-15 12:30:-23"
  test 17, "2021-12-15 12:30:23.-123"
  test 18, ""

'---- incorrect parse-text
  format = Null
  test 19, "2021-12-15 33"
  test 20, "abc 2021-12-15"
  test 21, "2021-12-15 12:30"
  test 22, "2021-12-15 :30:23"
  test 23, "2021-12-15 -12:30:23"
  test 24, "2021-12-15 12:b30:23"
  test 25, "2021-12-15 12:30:-23"
  test 26, "2021-12-15 12:30:23.-123"
  test 27, ""

'---- incorrect parse-text
  format = Empty
  test 28, "2021-12-15 33"
  test 29, "abc 2021-12-15"
  test 30, "2021-12-15 12:30"
  test 31, "2021-12-15 :30:23"
  test 32, "2021-12-15 -12:30:23"
  test 33, "2021-12-15 12:b30:23"
  test 34, "2021-12-15 12:30:-23"
  test 35, "2021-12-15 12:30:23.-123"
  test 36, ""

  if not gMY_TEST = true then
    echo deep, "[ERROR] DTSImport.parse.except.1"
    WScript.Quit 1
  end if
end sub

main()
