
'--- local/hybrids                             [test][DTSValue][date.string.vbs]
'[2024-08-14][19:00:00] 001 Kartonagnick    
'  --- CastleOfDreams/hybrids                  [test][DTSValue][data.string.vbs]
'  [2022-03-16][19:00:00] 001 Kartonagnick

dim dtv: dim cur

sub test_string_data(deep)
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
    eq_compare deep, 3, dtv.date, #2021-08-25#
    eq_compare deep, 4, dtv.ms, "000"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.date = string-date"
  end if
end sub

sub test_string_time(deep)
  cur = date() + #12:35:59#
  set dtv = (new DTSValue)("11:25:39.456", nothing)  
  dtv.date = "12:35:59.123"
    eq_compare deep, 1, dtv.date, cur
    eq_compare deep, 2, dtv.ms, "123"

  cur = date() + #12:35:59#
  set dtv = (new DTSValue)("11:22:23", nothing)  
  dtv.date = "12:35:59"
    eq_compare deep, 3, dtv.date, cur
    eq_compare deep, 4, dtv.ms, "000"

  cur = date() + #12:35:59#
  set dtv = new DTSValue
  dtv.date = "12:35:59"
    eq_compare deep, 5, dtv.date, cur
    eq_compare deep, 6, dtv.ms, "000"

  cur = #2020-01-10 12:35:59#
  set dtv = (new DTSValue)("2020-01-10 10:31:12.123", nothing)
  dtv.date = "12:35:59"
    eq_compare deep, 7, dtv.date, cur
    eq_compare deep, 8, dtv.ms, "000"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.date = string-time"
  end if
end sub

sub test_string_full(deep)
  set dtv = new DTSValue
  dtv.date = "2021y-08m-25d 12:34:56.789"
    eq_compare deep, 1, dtv.date, #2021-08-25 12:34:56#
    eq_compare deep, 2, dtv.ms, "789"

  set dtv = (new DTSValue)("2020y-08m-10d 12:30:23.111", "123")  
  dtv.date = "2021y-09m-15d 14:35:59.333"
    eq_compare deep, 3, dtv.date, #2021-09-15 14:35:59#
    eq_compare deep, 4, dtv.ms, "333"

  set dtv = (new DTSValue)("2020y-02m-12d 11:32:32.567", nothing)  
  dtv.date = "2021y-08m-25d 12:35:59.123"
    eq_compare deep, 5, dtv.date, #2021-08-25 12:35:59#
    eq_compare deep, 6, dtv.ms, "123"
  
  set dtv = (new DTSValue)("2020y-01m-12d 09:08:08", nothing)  
  dtv.date = "2021-08-25 12:35:59"
    eq_compare deep, 7, dtv.date, #2021-08-25 12:35:59#
    eq_compare deep, 8, dtv.ms, "000"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.date = string-full"
  end if
end sub

sub test_string_ms(deep)
  set dtv = new DTSValue
  dtv.date = "2021y-08m-25d .123"
    eq_compare deep, 1, dtv.date, #2021-08-25 00:00:00#
    eq_compare deep, 2, dtv.ms, "123"

  set dtv = new DTSValue
  dtv.date = "2021-08-25 .123"
    eq_compare deep, 3, dtv.date, #2021-08-25 00:00:00#
    eq_compare deep, 4, dtv.ms, "123"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.date = string-ms"
  end if
end sub

sub test_invalid(deep, id, text)
  set dtv = new DTSValue
  Err.Clear
  On Error Resume Next 
  dtv.date = text
  check_exception deep, id, errorInvalidText
  On Error goto 0
end sub

sub test_string_invalid(deep)
  test_invalid deep,  1, "2021y-08m-25d .1234"
  test_invalid deep,  2, "2021yy-08m-25d"
  test_invalid deep,  3, "2021y--08m-25d"
  test_invalid deep,  4, "2021y-08m--25d"
  test_invalid deep,  5, "2021y-08m-25d d"
  test_invalid deep,  6, "d 2021y-08m-25d"
  test_invalid deep,  7, "2021-08-25 12:12::34"
  test_invalid deep,  8, "2021-08-25 12::12:34"
  test_invalid deep,  9, "2021-08-25 12:12:34.."
  test_invalid deep, 10, "x021-08-25 12:23:34.123"
  test_invalid deep, 11, "2x21-08-25 12:23:34.123"
  test_invalid deep, 12, "xxxx-08-25 12:23:34.123"
  test_invalid deep, 13, "2021-xx-25 12:23:34.123"
  test_invalid deep, 14, "2021-08-xx 12:23:34.123"
  test_invalid deep, 15, "2021-08-25 xx:23:34.123"
  test_invalid deep, 16, "2021-08-25 12:x3:34.123"
  test_invalid deep, 17, "2021-08-25 12:xx:34.123"
  test_invalid deep, 18, "2021-08-25 12:23:x3.123"
  test_invalid deep, 19, "2021-08-25 12:23:3x.123"
  test_invalid deep, 20, "2021-08-25 12:23:34.x2x"
  test_invalid deep, 21, "2021-08-25 12:23:34.xxx"
  test_invalid deep, 22, "2021-08-25 12:23:34.12"
  test_invalid deep, 23, "20-08-25 12:23:34.123"
  test_invalid deep, 24, "2021-8-25 12:23:34.123"
  test_invalid deep, 25, "2021-08-5 12:23:34.123"
  test_invalid deep, 26, "2021-08-15 2:23:34.123"
  test_invalid deep, 27, "2021-08-15 12:3:34.123"
  test_invalid deep, 28, "2021-08-15 12:35:4.123"
  test_invalid deep, 29, "2021-08-15 12:35:48.1"
  test_invalid deep, 30, "2021-08-15 12:35:48 1"
  test_invalid deep, 31, "1 2021-08-15 12:35:48"
  test_invalid deep, 32, ".123"
  test_invalid deep, 33, "xx .123"
  test_invalid deep, 34, "xxxx"
  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.date = string-invalid"
  end if
end sub

sub main()
  dim deep: deep = 0

  test_string_data    deep
  test_string_time    deep
  test_string_full    deep
  test_string_ms      deep
  test_string_invalid deep

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] DTSValue.data = string"
  else
    echo deep, "[ERROR] DTSValue.data = string"
    WScript.Quit 1
  end if
end sub

main()
