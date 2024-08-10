
'--- local/hybrids                             [test][DTSValue][date.string.vbs]
'[2024-08-14][19:00:00] 001 Kartonagnick PRE
'  --- CastleOfDreams/hybrids                  [test][DTSValue][data.string.vbs]
'  [2022-03-16][19:00:00] 001 Kartonagnick

dim deep: deep = 0
dim dtv, cur

sub test_string_data()
  set dtv = (new DTSValue)("2022y-05m-20d", "1")  
  dtv.date = "2021y-08m-25d"
    eqCompare deep, 1, dtv.date, #2021-08-25#
    eqCompare deep, 2, dtv.ms, "000"

  set dtv = (new DTSValue)("2022y-02m-22d", 123)  
  dtv.date = "2021-08-25"
    eqCompare deep, 3, dtv.date, #2021-08-25#
    eqCompare deep, 4, dtv.ms, "000"

  set dtv = (new DTSValue)("2022y-02m-22d", nothing)  
  dtv.date = "2021-08-25"
    eqCompare deep, 3, dtv.date, #2021-08-25#
    eqCompare deep, 4, dtv.ms, "000"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.date = string-date"
  end if
end sub

sub test_string_time()
  cur = date() + #12:35:59#
  set dtv = (new DTSValue)("11:25:39.456", nothing)  
  dtv.date = "12:35:59.123"
    eqCompare deep, 1, dtv.date, cur
    eqCompare deep, 2, dtv.ms, "123"

  cur = date() + #12:35:59#
  set dtv = (new DTSValue)("11:22:23", nothing)  
  dtv.date = "12:35:59"
    eqCompare deep, 3, dtv.date, cur
    eqCompare deep, 4, dtv.ms, "000"

  cur = date() + #12:35:59#
  set dtv = new DTSValue
  dtv.date = "12:35:59"
    eqCompare deep, 5, dtv.date, cur
    eqCompare deep, 6, dtv.ms, "000"

  cur = #2020-01-10 12:35:59#
  set dtv = (new DTSValue)("2020-01-10 10:31:12.123", nothing)
  dtv.date = "12:35:59"
    eqCompare deep, 7, dtv.date, cur
    eqCompare deep, 8, dtv.ms, "000"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.date = string-time"
  end if
end sub

sub test_string_full()
  set dtv = new DTSValue
  dtv.date = "2021y-08m-25d 12:34:56.789"
    eqCompare deep, 1, dtv.date, #2021-08-25 12:34:56#
    eqCompare deep, 2, dtv.ms, "789"

  set dtv = (new DTSValue)("2020y-08m-10d 12:30:23.111", "123")  
  dtv.date = "2021y-09m-15d 14:35:59.333"
    eqCompare deep, 3, dtv.date, #2021-09-15 14:35:59#
    eqCompare deep, 4, dtv.ms, "333"

  set dtv = (new DTSValue)("2020y-02m-12d 11:32:32.567", nothing)  
  dtv.date = "2021y-08m-25d 12:35:59.123"
    eqCompare deep, 5, dtv.date, #2021-08-25 12:35:59#
    eqCompare deep, 6, dtv.ms, "123"
  
  set dtv = (new DTSValue)("2020y-01m-12d 09:08:08", nothing)  
  dtv.date = "2021-08-25 12:35:59"
    eqCompare deep, 7, dtv.date, #2021-08-25 12:35:59#
    eqCompare deep, 8, dtv.ms, "000"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.date = string-full"
  end if
end sub

sub test_string_ms()
  set dtv = new DTSValue
  dtv.date = "2021y-08m-25d .123"
    eqCompare deep, 1, dtv.date, #2021-08-25 00:00:00#
    eqCompare deep, 2, dtv.ms, "123"

  set dtv = new DTSValue
  dtv.date = "2021-08-25 .123"
    eqCompare deep, 3, dtv.date, #2021-08-25 00:00:00#
    eqCompare deep, 4, dtv.ms, "123"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.date = string-ms"
  end if
end sub

sub test_invalid(id, text)
  set dtv = new DTSValue
  On Error Resume Next: Err.Clear
  dtv.date = text
  saveException: On Error goto 0
  checkException deep, id, errorInvalidText
end sub

sub test_string_invalid()
  test_invalid  1, "2021y-08m-25d .1234"
  test_invalid  2, "2021yy-08m-25d"
  test_invalid  3, "2021y--08m-25d"
  test_invalid  4, "2021y-08m--25d"
  test_invalid  5, "2021y-08m-25d d"
  test_invalid  6, "d 2021y-08m-25d"
  test_invalid  7, "2021-08-25 12:12::34"
  test_invalid  8, "2021-08-25 12::12:34"
  test_invalid  9, "2021-08-25 12:12:34.."
  test_invalid 10, "x021-08-25 12:23:34.123"
  test_invalid 11, "2x21-08-25 12:23:34.123"
  test_invalid 12, "xxxx-08-25 12:23:34.123"
  test_invalid 13, "2021-xx-25 12:23:34.123"
  test_invalid 14, "2021-08-xx 12:23:34.123"
  test_invalid 15, "2021-08-25 xx:23:34.123"
  test_invalid 16, "2021-08-25 12:x3:34.123"
  test_invalid 17, "2021-08-25 12:xx:34.123"
  test_invalid 18, "2021-08-25 12:23:x3.123"
  test_invalid 19, "2021-08-25 12:23:3x.123"
  test_invalid 20, "2021-08-25 12:23:34.x2x"
  test_invalid 21, "2021-08-25 12:23:34.xxx"
  test_invalid 22, "2021-08-25 12:23:34.12"
  test_invalid 23, "20-08-25 12:23:34.123"
  test_invalid 24, "2021-8-25 12:23:34.123"
  test_invalid 25, "2021-08-5 12:23:34.123"
  test_invalid 26, "2021-08-15 2:23:34.123"
  test_invalid 27, "2021-08-15 12:3:34.123"
  test_invalid 28, "2021-08-15 12:35:4.123"
  test_invalid 29, "2021-08-15 12:35:48.1"
  test_invalid 30, "2021-08-15 12:35:48 1"
  test_invalid 31, "1 2021-08-15 12:35:48"
  test_invalid 32, ".123"
  test_invalid 33, "xx .123"
  test_invalid 34, "xxxx"
  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.date = string-invalid"
  end if
end sub

sub main()
  test_string_data
  test_string_time
  test_string_full
  test_string_ms
  test_string_invalid

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.data = string"
    WScript.Quit 1
  end if
end sub

main()
