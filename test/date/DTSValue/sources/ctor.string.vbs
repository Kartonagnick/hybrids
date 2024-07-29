
'--- local/hybrids                             [test][DTSValue][ctor.string.vbs]
'[2024-08-01][19:00:00] 001 Kartonagnick PRE
'  --- CastleOfDreams/hybrids                   [test][DTSValue][ctor.value.vbs]
'  [2022-03-16][19:00:00] 001 Kartonagnick

dim dtv: dim cur

sub test_ctor_string_date(deep)
  set dtv = (new DTSValue)("2022y-05m-20d", "1")  
    eq_compare deep, 1, dtv.date, #2022-05-20#
    eq_compare deep, 2, dtv.ms, "001"

  set dtv = (new DTSValue)("2022y-05m-20d", "1")  
  dtv.date = "2021y-08m-25d"
    eq_compare deep, 1, dtv.date, #2021-08-25#
    eq_compare deep, 2, dtv.ms, "000"

  set dtv = (new DTSValue)("2022y-02m-22d", 123)  
  dtv.date = "2021-08-25"
    eq_compare deep, 3, dtv.date, #2021-08-25#
    eq_compare deep, 4, dtv.ms, "000"

  set dtv = (new DTSValue)("2022y-02m-22d", nothing)  
  dtv.date = "2021-08-25"
    eq_compare deep, 5, dtv.date, #2021-08-25#
    eq_compare deep, 6, dtv.ms, "000"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.date = string-date"
  end if
end sub


sub test_ctor_string_time(deep)
  cur = date() + #12:35:59#
  set dtv = (new DTSValue)("11:25:39.456", nothing)  
  dtv.date = "12:35:59.123"
    eq_compare deep, 7, dtv.date, cur
    eq_compare deep, 8, dtv.ms, "123"

  cur = date() + #12:35:59#
  set dtv = (new DTSValue)("11:22:23", nothing)  
  dtv.date = "12:35:59"
    eq_compare deep,  9, dtv.date, cur
    eq_compare deep, 10, dtv.ms, "000"

  cur = date() + #12:35:59#
  set dtv = new DTSValue
  dtv.date = "12:35:59"
    eq_compare deep, 11, dtv.date, cur
    eq_compare deep, 12, dtv.ms, "000"

  cur = #2020-01-10 12:35:59#
  set dtv = (new DTSValue)("2020-01-10 10:31:12.123", nothing)
  dtv.date = "12:35:59"
    eq_compare deep, 13, dtv.date, cur
    eq_compare deep, 14, dtv.ms, "000"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.date = string-time"
  end if
end sub

sub test_ctor_string_full(deep)
  set dtv = new DTSValue
  dtv.date = "2021y-08m-25d 12:34:56.789"
    eq_compare deep, 15, dtv.date, #2021-08-25 12:34:56#
    eq_compare deep, 16, dtv.ms, "789"

  set dtv = (new DTSValue)("2020y-08m-10d 12:30:23.111", "123")  
  dtv.date = "2021y-09m-15d 14:35:59.333"
    eq_compare deep, 17, dtv.date, #2021-09-15 14:35:59#
    eq_compare deep, 18, dtv.ms, "333"

  set dtv = (new DTSValue)("2020y-02m-12d 11:32:32.567", nothing)  
  dtv.date = "2021y-08m-25d 12:35:59.123"
    eq_compare deep, 19, dtv.date, #2021-08-25 12:35:59#
    eq_compare deep, 20, dtv.ms, "123"
  
  set dtv = (new DTSValue)("2020y-01m-12d 09:08:08", nothing)  
  dtv.date = "2021-08-25 12:35:59"
    eq_compare deep, 21, dtv.date, #2021-08-25 12:35:59#
    eq_compare deep, 22, dtv.ms, "000"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.date = string-full"
  end if
end sub

sub test_ctor_string_ms(deep)
  set dtv = new DTSValue
  dtv.date = "2021y-08m-25d .123"
    eq_compare deep, 23, dtv.date, #2021-08-25 00:00:00#
    eq_compare deep, 24, dtv.ms, "123"

  set dtv = new DTSValue
  dtv.date = "2021-08-25 .123"
    eq_compare deep, 25, dtv.date, #2021-08-25 00:00:00#
    eq_compare deep, 26, dtv.ms, "123"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.date = string-ms"
  end if
end sub

sub test_invalid(deep, id, text)
  Err.Clear
  On Error Resume Next 
  set dtv = (new DTSValue)(text, nothing)
  check_exception deep, id, errorInvalidText
  On Error goto 0
end sub

sub test_ctor_string_invalid(deep)
  test_invalid deep, 27, "2021y-08m-25d .1234"
  test_invalid deep, 28, "2021yy-08m-25d"
  test_invalid deep, 29, "2021y--08m-25d"
  test_invalid deep, 30, "2021y-08m--25d"
  test_invalid deep, 31, "2021y-08m-25d d"
  test_invalid deep, 32, "d 2021y-08m-25d"
  test_invalid deep, 33, "2021-08-25 12:12::34"
  test_invalid deep, 34, "2021-08-25 12::12:34"
  test_invalid deep, 35, "2021-08-25 12:12:34.."
  test_invalid deep, 36, "x021-08-25 12:23:34.123"
  test_invalid deep, 37, "2x21-08-25 12:23:34.123"
  test_invalid deep, 38, "xxxx-08-25 12:23:34.123"
  test_invalid deep, 39, "2021-xx-25 12:23:34.123"
  test_invalid deep, 40, "2021-08-xx 12:23:34.123"
  test_invalid deep, 41, "2021-08-25 xx:23:34.123"
  test_invalid deep, 42, "2021-08-25 12:x3:34.123"
  test_invalid deep, 43, "2021-08-25 12:xx:34.123"
  test_invalid deep, 44, "2021-08-25 12:23:x3.123"
  test_invalid deep, 45, "2021-08-25 12:23:3x.123"
  test_invalid deep, 46, "2021-08-25 12:23:34.x2x"
  test_invalid deep, 47, "2021-08-25 12:23:34.xxx"
  test_invalid deep, 48, "2021-08-25 12:23:34.12"
  test_invalid deep, 49, "20-08-25 12:23:34.123"
  test_invalid deep, 50, "2021-8-25 12:23:34.123"
  test_invalid deep, 51, "2021-08-5 12:23:34.123"
  test_invalid deep, 52, "2021-08-15 2:23:34.123"
  test_invalid deep, 53, "2021-08-15 12:3:34.123"
  test_invalid deep, 54, "2021-08-15 12:35:4.123"
  test_invalid deep, 55, "2021-08-15 12:35:48.1"
  test_invalid deep, 56, "2021-08-15 12:35:48 1"
  test_invalid deep, 57, "1 2021-08-15 12:35:48"
  test_invalid deep, 58, ".123"
  test_invalid deep, 59, "xx .123"
  test_invalid deep, 60, "xxxx"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.date = string-invalid"
  end if
end sub

sub main()
  dim deep: deep = 0
  dim dtv: dim ext

  test_ctor_string_date     deep
  test_ctor_string_time     deep
  test_ctor_string_full     deep
  test_ctor_string_ms       deep
  test_ctor_string_invalid  deep

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] DTSValue(string, ms): construct from string"
  else
    echo deep, "[ERROR] DTSValue(string, ms): construct from string"
    WScript.Quit 1
  end if
end sub

main()
