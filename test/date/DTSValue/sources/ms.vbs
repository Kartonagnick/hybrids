
'--- local/hybrids                                      [test][DTSValue][ms.vbs]
'[2024-08-20][19:00:00] 001 Kartonagnick    
'  --- CastleOfDreams/hybrids                           [test][DTSValue][ms.vbs]
'  [2022-03-16][19:00:00] 001 Kartonagnick

dim deep: deep = 0 
dim dtv

sub test_ms_numeric()
  set dtv = (new DTSValue)(2, 0)  
  dtv.ms = 999
    eqCompare deep, 1, dtv.date, #1970-01-01 00:00:02#
    eqCompare deep, 2, dtv.ms, "999"

  set dtv = (new DTSValue)(2, 0)  
  dtv.ms = 1000
    eqCompare deep, 3, dtv.date, #1970-01-01 00:00:03#
    eqCompare deep, 4, dtv.ms, "000"

  set dtv = (new DTSValue)(2, 0)  
  dtv.ms = 1001
    eqCompare deep, 5, dtv.date, #1970-01-01 00:00:03#
    eqCompare deep, 6, dtv.ms, "001"

  set dtv = (new DTSValue)(2, 0)  
  dtv.ms = 1011
    eqCompare deep, 7, dtv.date, #1970-01-01 00:00:03#
    eqCompare deep, 8, dtv.ms, "011"

  set dtv = (new DTSValue)(2, 0)  
  dtv.ms = 1111
    eqCompare deep, 9 , dtv.date, #1970-01-01 00:00:03#
    eqCompare deep, 10, dtv.ms, "111"

  set dtv = (new DTSValue)(-2, 0)  
  dtv.ms = -1
    eqCompare deep, 11, dtv.date, #1969-12-31 23:59:57#
    eqCompare deep, 12, dtv.ms, "999"
   neqCompare deep, 13, dtv.ms, "998"

  set dtv = (new DTSValue)(-2, 0)  
  dtv.ms = -1.4
    eqCompare deep, 14, dtv.date, #1969-12-31 23:59:57#
    eqCompare deep, 15, dtv.ms, "999"
   neqCompare deep, 16, dtv.ms, "998"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.ms = numeric"
  end if
end sub

sub test_ms_string()
  set dtv = (new DTSValue)(2, 0)  
  dtv.ms = "999"
    eqCompare deep, 1, dtv.date, #1970-01-01 00:00:02#
    eqCompare deep, 2, dtv.ms, "999"

  set dtv = (new DTSValue)(2, 0)  
  dtv.ms = "1000"
    eqCompare deep, 3, dtv.date, #1970-01-01 00:00:03#
    eqCompare deep, 4, dtv.ms, "000"

  set dtv = (new DTSValue)(2, 0)  
  dtv.ms = "1001"
    eqCompare deep, 5, dtv.date, #1970-01-01 00:00:03#
    eqCompare deep, 6, dtv.ms, "001"

  set dtv = (new DTSValue)(2, 0)  
  dtv.ms = "1011"
    eqCompare deep, 7, dtv.date, #1970-01-01 00:00:03#
    eqCompare deep, 8, dtv.ms, "011"

  set dtv = (new DTSValue)(2, 0)  
  dtv.ms = "1111"
    eqCompare deep, 9 , dtv.date, #1970-01-01 00:00:03#
    eqCompare deep, 10, dtv.ms, "111"

  set dtv = (new DTSValue)(-2, 0)  
  dtv.ms = "-1"
    eqCompare deep, 11, dtv.date, #1969-12-31 23:59:57#
    eqCompare deep, 12, dtv.ms, "999"
   neqCompare deep, 13, dtv.ms, "998"

  set dtv = (new DTSValue)(-2, 0)  
  dtv.ms = "-1.4"
    eqCompare deep, 14, dtv.date, #1969-12-31 23:59:57#
    eqCompare deep, 15, dtv.ms, "999"
   neqCompare deep, 16, dtv.ms, "998"

  set dtv = (new DTSValue)(-2, "0")  
  dtv.ms = "-1.2"
    eqCompare deep, 27, dtv.date, #1969-12-31 23:59:57#
    eqCompare deep, 28, dtv.ms, "999"
   neqCompare deep, 29, dtv.ms, "998"

  set dtv = (new DTSValue)(2, "0")  
  dtv.ms = "1111.23"
    eqCompare deep, 30, dtv.date, #1970-01-01 00:00:03#
    eqCompare deep, 31, dtv.ms, "111"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.ms = string"
  end if
end sub

sub test_invalid(id, text)
  set dtv = new DTSValue 
  On Error Resume Next: Err.Clear
  dtv.ms = text
  saveException: On Error goto 0
  checkException deep, id, errorInvalidText
end sub

sub test_ms_invalid()
  test_invalid 1, "aa"
  test_invalid 2, "a1"
  test_invalid 3, "1a"
  test_invalid 3, "-"
  test_invalid 3, " "
  test_invalid 3, "0xf"
  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.ms = invalid"
  end if
end sub

sub main()
  test_ms_numeric
  test_ms_string
  test_ms_invalid
  if not gMY_TEST = true then
    echo deep, "[ERROR] DTSValue.ms"
    WScript.Quit 1
  end if
end sub

main()
