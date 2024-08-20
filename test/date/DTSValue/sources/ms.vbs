
'--- local/hybrids                                      [test][DTSValue][ms.vbs]
'[2024-08-20][19:00:00] 001 Kartonagnick    
'  --- CastleOfDreams/hybrids                           [test][DTSValue][ms.vbs]
'  [2022-03-16][19:00:00] 001 Kartonagnick

dim dtv

sub test_ms_numeric(deep)
  set dtv = (new DTSValue)(2, 0)  
  dtv.ms = 999
    eq_compare deep, 1, dtv.date, #1970-01-01 00:00:02#
    eq_compare deep, 2, dtv.ms, "999"

  set dtv = (new DTSValue)(2, 0)  
  dtv.ms = 1000
    eq_compare deep, 3, dtv.date, #1970-01-01 00:00:03#
    eq_compare deep, 4, dtv.ms, "000"

  set dtv = (new DTSValue)(2, 0)  
  dtv.ms = 1001
    eq_compare deep, 5, dtv.date, #1970-01-01 00:00:03#
    eq_compare deep, 6, dtv.ms, "001"

  set dtv = (new DTSValue)(2, 0)  
  dtv.ms = 1011
    eq_compare deep, 7, dtv.date, #1970-01-01 00:00:03#
    eq_compare deep, 8, dtv.ms, "011"

  set dtv = (new DTSValue)(2, 0)  
  dtv.ms = 1111
    eq_compare deep, 9 , dtv.date, #1970-01-01 00:00:03#
    eq_compare deep, 10, dtv.ms, "111"

  set dtv = (new DTSValue)(-2, 0)  
  dtv.ms = -1
    eq_compare deep, 11, dtv.date, #1969-12-31 23:59:57#
    eq_compare deep, 12, dtv.ms, "999"
   neq_compare deep, 13, dtv.ms, "998"

  set dtv = (new DTSValue)(-2, 0)  
  dtv.ms = -1.4
    eq_compare deep, 14, dtv.date, #1969-12-31 23:59:57#
    eq_compare deep, 15, dtv.ms, "999"
   neq_compare deep, 16, dtv.ms, "998"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.ms = numeric"
  end if
end sub

sub test_ms_string(deep)
  set dtv = (new DTSValue)(2, 0)  
  dtv.ms = "999"
    eq_compare deep, 1, dtv.date, #1970-01-01 00:00:02#
    eq_compare deep, 2, dtv.ms, "999"

  set dtv = (new DTSValue)(2, 0)  
  dtv.ms = "1000"
    eq_compare deep, 3, dtv.date, #1970-01-01 00:00:03#
    eq_compare deep, 4, dtv.ms, "000"

  set dtv = (new DTSValue)(2, 0)  
  dtv.ms = "1001"
    eq_compare deep, 5, dtv.date, #1970-01-01 00:00:03#
    eq_compare deep, 6, dtv.ms, "001"

  set dtv = (new DTSValue)(2, 0)  
  dtv.ms = "1011"
    eq_compare deep, 7, dtv.date, #1970-01-01 00:00:03#
    eq_compare deep, 8, dtv.ms, "011"

  set dtv = (new DTSValue)(2, 0)  
  dtv.ms = "1111"
    eq_compare deep, 9 , dtv.date, #1970-01-01 00:00:03#
    eq_compare deep, 10, dtv.ms, "111"

  set dtv = (new DTSValue)(-2, 0)  
  dtv.ms = "-1"
    eq_compare deep, 11, dtv.date, #1969-12-31 23:59:57#
    eq_compare deep, 12, dtv.ms, "999"
   neq_compare deep, 13, dtv.ms, "998"

  set dtv = (new DTSValue)(-2, 0)  
  dtv.ms = "-1.4"
    eq_compare deep, 14, dtv.date, #1969-12-31 23:59:57#
    eq_compare deep, 15, dtv.ms, "999"
   neq_compare deep, 16, dtv.ms, "998"

  set dtv = (new DTSValue)(-2, "0")  
  dtv.ms = "-1.2"
    eq_compare deep, 27, dtv.date, #1969-12-31 23:59:57#
    eq_compare deep, 28, dtv.ms, "999"
   neq_compare deep, 29, dtv.ms, "998"

  set dtv = (new DTSValue)(2, "0")  
  dtv.ms = "1111.23"
    eq_compare deep, 30, dtv.date, #1970-01-01 00:00:03#
    eq_compare deep, 31, dtv.ms, "111"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.ms = string"
  end if
end sub

sub test_invalid(deep, id, text)
  set dtv = new DTSValue 
  On Error Resume Next   
  Err.Clear
  dtv.ms = text
  check_exception deep, id, errorInvalidText
  On Error goto 0
end sub

sub test_ms_invalid(deep)

  test_invalid deep, 1, "aa"
  test_invalid deep, 2, "a1"
  test_invalid deep, 3, "1a"
  test_invalid deep, 3, "-"
  test_invalid deep, 3, " "
  test_invalid deep, 3, "0xf"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.ms = invalid"
  end if
end sub

sub main()
  dim deep: deep = 0 

  test_ms_numeric deep
  test_ms_string  deep
  test_ms_invalid deep

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] DTSValue.ms"
  else
    echo deep, "[ERROR] DTSValue.ms"
    WScript.Quit 1
  end if
end sub

main()
