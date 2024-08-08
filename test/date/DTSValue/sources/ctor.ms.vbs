
'--- local/hybrids                                 [test][DTSValue][ctor.ms.vbs]
'[2024-08-08][19:00:00] 001 Kartonagnick PRE
'  --- CastleOfDreams/hybrids                      [test][DTSValue][ctor.ms.vbs]
'  [2022-03-16][19:00:00] 001 Kartonagnick

dim dtv

sub test_ctor_ms_typical(deep)

  set dtv = (new DTSValue)(2, 999)  
    eq_compare deep, 1, dtv.date, #1970-01-01 00:00:02#
    eq_compare deep, 2, dtv.ms, "999"

  set dtv = (new DTSValue)(2, 1000)  
    eq_compare deep, 3, dtv.date, #1970-01-01 00:00:03#
    eq_compare deep, 4, dtv.ms, "000"

  set dtv = (new DTSValue)(2, 1001)  
    eq_compare deep, 5, dtv.date, #1970-01-01 00:00:03#
    eq_compare deep, 6, dtv.ms, "001"

  set dtv = (new DTSValue)(2, 1011)  
    eq_compare deep, 7, dtv.date, #1970-01-01 00:00:03#
    eq_compare deep, 8, dtv.ms, "011"

  set dtv = (new DTSValue)(2, 1111)  
    eq_compare deep, 9 , dtv.date, #1970-01-01 00:00:03#
    eq_compare deep, 10, dtv.ms, "111"

  set dtv = (new DTSValue)(-2, -1)  
    eq_compare deep, 11, dtv.date, #1969-12-31 23:59:57#
    eq_compare deep, 12, dtv.ms, "999"
   neq_compare deep, 13, dtv.ms, "998"
'---------------
  set dtv = (new DTSValue)(2, "999")  
    eq_compare deep, 14, dtv.date, #1970-01-01 00:00:02#
    eq_compare deep, 15, dtv.ms, "999"

  set dtv = (new DTSValue)(2, "1000")  
    eq_compare deep, 16, dtv.date, #1970-01-01 00:00:03#
    eq_compare deep, 17, dtv.ms, "000"

  set dtv = (new DTSValue)(2, "1001")  
    eq_compare deep, 18, dtv.date, #1970-01-01 00:00:03#
    eq_compare deep, 19, dtv.ms, "001"

  set dtv = (new DTSValue)(2, "1011")  
    eq_compare deep, 20, dtv.date, #1970-01-01 00:00:03#
    eq_compare deep, 21, dtv.ms, "011"

  set dtv = (new DTSValue)(2, "1111")  
    eq_compare deep, 22 , dtv.date, #1970-01-01 00:00:03#
    eq_compare deep, 23, dtv.ms, "111"

  set dtv = (new DTSValue)(-2, "-1")  
    eq_compare deep, 24, dtv.date, #1969-12-31 23:59:57#
    eq_compare deep, 25, dtv.ms, "999"
   neq_compare deep, 26, dtv.ms, "998"

  set dtv = (new DTSValue)(-2, "-1.2")  
    eq_compare deep, 27, dtv.date, #1969-12-31 23:59:57#
    eq_compare deep, 28, dtv.ms, "999"
   neq_compare deep, 29, dtv.ms, "998"

  set dtv = (new DTSValue)(2, "1111.23")  
    eq_compare deep, 30, dtv.date, #1970-01-01 00:00:03#
    eq_compare deep, 31, dtv.ms, "111"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue(value, ms): construct with milliseconds"
  end if
end sub

sub test_ctor_ms_nothing(deep)
  set dtv = (new DTSValue)("2021y-08m-25d 12:35:59.123", nothing)  
    eq_compare deep, 32, dtv.date, #2021-08-25 12:35:59#
    eq_compare deep, 33, dtv.ms, "123"

  set dtv = (new DTSValue)("2021y-08m-25d 12:35:59.123", Empty)  
    eq_compare deep, 34, dtv.date, #2021-08-25 12:35:59#
    eq_compare deep, 35, dtv.ms, "123"

  set dtv = (new DTSValue)("2021y-08m-25d 12:35:59.123", Null)  
    eq_compare deep, 36, dtv.date, #2021-08-25 12:35:59#
    eq_compare deep, 37, dtv.ms, "123"

  set dtv = (new DTSValue)(#2021-08-25 12:35:59#, nothing)  
    eq_compare deep, 38, dtv.date, #2021-08-25 12:35:59#
    eq_compare deep, 39, dtv.ms, "000"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue(value, nothing): construct with 'nothing' ms"
  end if
end sub


sub test_invalid(deep, id, text)
  Err.Clear
  On Error Resume Next 
  set dtv = (new DTSValue)(0, text)
  check_exception deep, id, errorInvalidText
  On Error goto 0
end sub

sub test_ctor_ms_invalid(deep)
  test_invalid deep, 40, "aa"
  test_invalid deep, 41, "a1"
  test_invalid deep, 42, "1a"
  test_invalid deep, 43, "  "
  test_invalid deep, 44, "0xf"
  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue(value, invalid): construct with 'invalid' ms"
  end if
end sub

sub main()

  dim deep: deep = 0
  test_ctor_ms_typical  deep
  test_ctor_ms_nothing  deep
  test_ctor_ms_invalid  deep

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] DTSValue: constructor with ms"
  else
    echo deep, "[ERROR] DTSValue: constructor with ms"
    WScript.Quit 1
  end if
end sub

main()
