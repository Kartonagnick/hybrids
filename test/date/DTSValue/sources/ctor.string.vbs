
'--- local/hybrids                             [test][DTSValue][ctor.string.vbs]
'[2024-08-01][19:00:00] 001 Kartonagnick PRE
'  --- CastleOfDreams/hybrids                   [test][DTSValue][ctor.value.vbs]
'  [2022-03-16][19:00:00] 001 Kartonagnick

dim deep: deep = 0

dim dtv
dim cur

sub test_ctor_string_date()
  set dtv = (new DTSValue)("2022y-05m-20d", "1")  
    eqCompare deep, 1, dtv.date, #2022-05-20#
    eqCompare deep, 2, dtv.ms, "001"

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
    eqCompare deep, 5, dtv.date, #2021-08-25#
    eqCompare deep, 6, dtv.ms, "000"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.date = string-date"
  end if
end sub

sub test_ctor_string_time()
  cur = date() + #12:35:59#
  set dtv = (new DTSValue)("11:25:39.456", nothing)  
  dtv.date = "12:35:59.123"
    eqCompare deep, 7, dtv.date, cur
    eqCompare deep, 8, dtv.ms, "123"

  cur = date() + #12:35:59#
  set dtv = (new DTSValue)("11:22:23", nothing)  
  dtv.date = "12:35:59"
    eqCompare deep,  9, dtv.date, cur
    eqCompare deep, 10, dtv.ms, "000"

  cur = date() + #12:35:59#
  set dtv = new DTSValue
  dtv.date = "12:35:59"
    eqCompare deep, 11, dtv.date, cur
    eqCompare deep, 12, dtv.ms, "000"

  cur = #2020-01-10 12:35:59#
  set dtv = (new DTSValue)("2020-01-10 10:31:12.123", nothing)
  dtv.date = "12:35:59"
    eqCompare deep, 13, dtv.date, cur
    eqCompare deep, 14, dtv.ms, "000"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.date = string-time"
  end if
end sub

sub test_ctor_string_full()
  set dtv = new DTSValue
  dtv.date = "2021y-08m-25d 12:34:56.789"
    eqCompare 15, deep, dtv.date, #2021-08-25 12:34:56#
    eqCompare 16, deep, dtv.ms, "789"

  set dtv = (new DTSValue)("2020y-08m-10d 12:30:23.111", "123")  
  dtv.date = "2021y-09m-15d 14:35:59.333"
    eqCompare 17, deep, dtv.date, #2021-09-15 14:35:59#
    eqCompare 18, deep, dtv.ms, "333"

  set dtv = (new DTSValue)("2020y-02m-12d 11:32:32.567", nothing)  
  dtv.date = "2021y-08m-25d 12:35:59.123"
    eqCompare 19, deep, dtv.date, #2021-08-25 12:35:59#
    eqCompare 20, deep, dtv.ms, "123"
  
  set dtv = (new DTSValue)("2020y-01m-12d 09:08:08", nothing)  
  dtv.date = "2021-08-25 12:35:59"
    eqCompare 21, deep, dtv.date, #2021-08-25 12:35:59#
    eqCompare 22, deep, dtv.ms, "000"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.date = string-full"
  end if
end sub

sub test_ctor_string_ms()
  set dtv = new DTSValue
  dtv.date = "2021y-08m-25d .123"
    eqCompare deep, 23, dtv.date, #2021-08-25 00:00:00#
    eqCompare deep, 24, dtv.ms, "123"

  set dtv = new DTSValue
  dtv.date = "2021-08-25 .123"
    eqCompare deep, 25, dtv.date, #2021-08-25 00:00:00#
    eqCompare deep, 26, dtv.ms, "123"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.date = string-ms"
  end if
end sub

sub test_invalid(id, text)
  Err.Clear: On Error Resume Next 
  set dtv = (new DTSValue)(text, nothing)
  saveException: On Error goto 0
  checkException deep, id, errorInvalidText
end sub

sub test_ctor_string_invalid()
  test_invalid 27, "2021y-08m-25d .1234"
  test_invalid 28, "2021yy-08m-25d"
  test_invalid 29, "2021y--08m-25d"
  test_invalid 30, "2021y-08m--25d"
  test_invalid 31, "2021y-08m-25d d"
  test_invalid 32, "d 2021y-08m-25d"
  test_invalid 33, "2021-08-25 12:12::34"
  test_invalid 34, "2021-08-25 12::12:34"
  test_invalid 35, "2021-08-25 12:12:34.."
  test_invalid 36, "x021-08-25 12:23:34.123"
  test_invalid 37, "2x21-08-25 12:23:34.123"
  test_invalid 38, "xxxx-08-25 12:23:34.123"
  test_invalid 39, "2021-xx-25 12:23:34.123"
  test_invalid 40, "2021-08-xx 12:23:34.123"
  test_invalid 41, "2021-08-25 xx:23:34.123"
  test_invalid 42, "2021-08-25 12:x3:34.123"
  test_invalid 43, "2021-08-25 12:xx:34.123"
  test_invalid 44, "2021-08-25 12:23:x3.123"
  test_invalid 45, "2021-08-25 12:23:3x.123"
  test_invalid 46, "2021-08-25 12:23:34.x2x"
  test_invalid 47, "2021-08-25 12:23:34.xxx"
  test_invalid 48, "2021-08-25 12:23:34.12"
  test_invalid 49, "20-08-25 12:23:34.123"
  test_invalid 50, "2021-8-25 12:23:34.123"
  test_invalid 51, "2021-08-5 12:23:34.123"
  test_invalid 52, "2021-08-15 2:23:34.123"
  test_invalid 53, "2021-08-15 12:3:34.123"
  test_invalid 54, "2021-08-15 12:35:4.123"
  test_invalid 55, "2021-08-15 12:35:48.1"
  test_invalid 56, "2021-08-15 12:35:48 1"
  test_invalid 57, "1 2021-08-15 12:35:48"
  test_invalid 58, ".123"
  test_invalid 59, "xx .123"
  test_invalid 60, "xxxx"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.date = string-invalid"
  end if
end sub

sub main()
  test_ctor_string_date
  test_ctor_string_time
  test_ctor_string_full
  test_ctor_string_ms
  test_ctor_string_invalid
  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue(string, ms): construct from string"
    WScript.Quit 1
  end if
end sub

main()
