
'--- local/hybrids                                 [test][DTSValue][ctor.ms.vbs]
'[2024-08-08][19:00:00] 001 Kartonagnick    
'  --- CastleOfDreams/hybrids                      [test][DTSValue][ctor.ms.vbs]
'  [2022-03-16][19:00:00] 001 Kartonagnick

dim deep: deep = 0
dim dtv

sub test_ctor_ms_typical()

  set dtv = (new DTSValue)(2, 999)  
    eqCompare deep, 1, dtv.date, #1970-01-01 00:00:02#
    eqCompare deep, 2, dtv.ms, "999"

  set dtv = (new DTSValue)(2, 1000)  
    eqCompare deep, 3, dtv.date, #1970-01-01 00:00:03#
    eqCompare deep, 4, dtv.ms, "000"

  set dtv = (new DTSValue)(2, 1001)  
    eqCompare deep, 5, dtv.date, #1970-01-01 00:00:03#
    eqCompare deep, 6, dtv.ms, "001"

  set dtv = (new DTSValue)(2, 1011)  
    eqCompare deep, 7, dtv.date, #1970-01-01 00:00:03#
    eqCompare deep, 8, dtv.ms, "011"

  set dtv = (new DTSValue)(2, 1111)  
    eqCompare deep, 9 , dtv.date, #1970-01-01 00:00:03#
    eqCompare deep, 10, dtv.ms, "111"

  set dtv = (new DTSValue)(-2, -1)  
    eqCompare deep, 11, dtv.date, #1969-12-31 23:59:57#
    eqCompare deep, 12, dtv.ms, "999"
   neqCompare deep, 13, dtv.ms, "998"
   
'---------------

  set dtv = (new DTSValue)(2, "999")  
    eqCompare deep, 14, dtv.date, #1970-01-01 00:00:02#
    eqCompare deep, 15, dtv.ms, "999"

  set dtv = (new DTSValue)(2, "1000")  
    eqCompare deep, 16, dtv.date, #1970-01-01 00:00:03#
    eqCompare deep, 17, dtv.ms, "000"

  set dtv = (new DTSValue)(2, "1001")  
    eqCompare deep, 18, dtv.date, #1970-01-01 00:00:03#
    eqCompare deep, 19, dtv.ms, "001"

  set dtv = (new DTSValue)(2, "1011")  
    eqCompare deep, 20, dtv.date, #1970-01-01 00:00:03#
    eqCompare deep, 21, dtv.ms, "011"

  set dtv = (new DTSValue)(2, "1111")  
    eqCompare deep, 22 , dtv.date, #1970-01-01 00:00:03#
    eqCompare deep, 23, dtv.ms, "111"

  set dtv = (new DTSValue)(-2, "-1")  
    eqCompare deep, 24, dtv.date, #1969-12-31 23:59:57#
    eqCompare deep, 25, dtv.ms, "999"
   neqCompare deep, 26, dtv.ms, "998"

  set dtv = (new DTSValue)(-2, "-1.2")  
    eqCompare deep, 27, dtv.date, #1969-12-31 23:59:57#
    eqCompare deep, 28, dtv.ms, "999"
   neqCompare deep, 29, dtv.ms, "998"

  set dtv = (new DTSValue)(2, "1111.23")  
    eqCompare deep, 30, dtv.date, #1970-01-01 00:00:03#
    eqCompare deep, 31, dtv.ms, "111"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue(value, ms): construct with milliseconds"
  end if
end sub

sub test_ctor_ms_nothing()
  set dtv = (new DTSValue)("2021y-08m-25d 12:35:59.123", nothing)  
    eqCompare deep, 32, dtv.date, #2021-08-25 12:35:59#
    eqCompare deep, 33, dtv.ms, "123"

  set dtv = (new DTSValue)("2021y-08m-25d 12:35:59.123", Empty)  
    eqCompare deep, 34, dtv.date, #2021-08-25 12:35:59#
    eqCompare deep, 35, dtv.ms, "123"

  set dtv = (new DTSValue)("2021y-08m-25d 12:35:59.123", Null)  
    eqCompare deep, 36, dtv.date, #2021-08-25 12:35:59#
    eqCompare deep, 37, dtv.ms, "123"

  set dtv = (new DTSValue)(#2021-08-25 12:35:59#, nothing)  
    eqCompare deep, 38, dtv.date, #2021-08-25 12:35:59#
    eqCompare deep, 39, dtv.ms, "000"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue(value, nothing): construct with 'nothing' ms"
  end if
end sub


sub test_invalid(id, text)
  Err.Clear:  On Error Resume Next 
  set dtv = (new DTSValue)(0, text)
  saveException: On Error goto 0
  checkException deep, id, errorInvalidText
end sub

sub test_ctor_ms_invalid()
  test_invalid 40, "aa"
  test_invalid 41, "a1"
  test_invalid 42, "1a"
  test_invalid 43, "  "
  test_invalid 44, "0xf"
  
  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue(value, invalid): construct with 'invalid' ms"
  end if
end sub

sub main()
  test_ctor_ms_typical
  test_ctor_ms_nothing
  test_ctor_ms_invalid

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue: constructor with ms"
    WScript.Quit 1
  end if
end sub

main()
