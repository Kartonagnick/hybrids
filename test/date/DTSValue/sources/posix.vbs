
'--- local/hybrids                                   [test][DTSValue][posix.vbs]
'[2024-08-20][19:00:00] 001 Kartonagnick PRE
'  --- CastleOfDreams/hybrids                        [test][DTSValue][posix.vbs]
'  [2022-03-16][19:00:00] 001 Kartonagnick

dim deep: deep = 0 
dim dtv

sub test_posix_get()
  set dtv = new DTSValue
  dtv.date = #1970-01-01 00:00:03# : eqCompare deep, 1, dtv.posix, 3
  dtv.date = #1970-01-01 00:00:33# : eqCompare deep, 2, dtv.posix, 33
  dtv.date = #1970-01-01 00:01:05# : eqCompare deep, 3, dtv.posix, 65
  dtv.date = #1970-01-01 01:01:05# : eqCompare deep, 4, dtv.posix, 3665
  dtv.date = #1970-01-02 01:01:05# : eqCompare deep, 5, dtv.posix, 90065
  if not gMY_TEST then
    echo deep, "[ERROR] val = DTSValue.posix (getter)"
  end if
end sub

sub test_posix_numeric()
  set dtv = new DTSValue: dtv.posix = 0
    eqCompare deep,  6, dtv.date, #01/01/1970 00:00:00#
    eqCompare deep,  7, dtv.date, #01/01/1970#
    eqCompare deep,  8, dtv.ms, "000"

  set dtv = new DTSValue: dtv.posix = 1
    eqCompare deep,  9, dtv.date, #1970-01-01 00:00:01#
    eqCompare deep, 10, dtv.ms, "000"

  set dtv = new DTSValue: dtv.posix = 3
    eqCompare deep, 11, dtv.date, #01/01/1970 00:00:03#
    eqCompare deep, 12, dtv.ms, "000"
  
  set dtv = new DTSValue: dtv.posix = 33
    eqCompare deep, 13, dtv.date, #01/01/1970 00:00:33#
    eqCompare deep, 14, dtv.ms, "000"
  
  set dtv = new DTSValue: dtv.posix = 65
    eqCompare deep, 15, dtv.date, #01/01/1970 00:01:05#
    eqCompare deep, 16, dtv.ms, "000"
  
  set dtv = new DTSValue: dtv.posix = 3665
    eqCompare deep, 17, dtv.date, #1970-01-01 01:01:05#
    eqCompare deep, 18, dtv.ms, "000"
  
  set dtv = new DTSValue: dtv.posix = 90065
    eqCompare deep, 19, dtv.date, #1970-01-02 01:01:05#
    eqCompare deep, 20, dtv.ms, "000"
  
  set dtv = new DTSValue: dtv.posix = -1
    eqCompare deep, 21, dtv.date, #1969-12-31 23:59:59#
    eqCompare deep, 22, dtv.ms, "000"
  
  set dtv = new DTSValue: dtv.posix = -2
    eqCompare deep, 23, dtv.date, #1969-12-31 23:59:58#
    eqCompare deep, 24, dtv.ms, "000"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.posix = numeric"
  end if
end sub

sub test_posix_string()
  set dtv = new DTSValue: dtv.posix = "0"
    eqCompare deep, 25, dtv.date, #01/01/1970 00:00:00#
    eqCompare deep, 26, dtv.date, #01/01/1970#
    eqCompare deep, 27, dtv.ms, "000"

  set dtv = new DTSValue: dtv.posix = "1"
    eqCompare deep, 28, dtv.date, #1970-01-01 00:00:01#
    eqCompare deep, 29, dtv.ms, "000"

  set dtv = new DTSValue: dtv.posix = "3"
    eqCompare deep, 30, dtv.date, #01/01/1970 00:00:03#
    eqCompare deep, 31, dtv.ms, "000"
  
  set dtv = new DTSValue: dtv.posix = "33"
    eqCompare deep, 32, dtv.date, #01/01/1970 00:00:33#
    eqCompare deep, 33, dtv.ms, "000"
  
  set dtv = new DTSValue: dtv.posix = "65"
    eqCompare deep, 34, dtv.date, #01/01/1970 00:01:05#
    eqCompare deep, 35, dtv.ms, "000"
  
  set dtv = new DTSValue: dtv.posix = "3665"
    eqCompare deep, 36, dtv.date, #1970-01-01 01:01:05#
    eqCompare deep, 37, dtv.ms, "000"
  
  set dtv = new DTSValue: dtv.posix = "90065"
    eqCompare deep, 38, dtv.date, #1970-01-02 01:01:05#
    eqCompare deep, 39, dtv.ms, "000"
  
  set dtv = new DTSValue: dtv.posix = "-1"
    eqCompare deep, 40, dtv.date, #1969-12-31 23:59:59#
    eqCompare deep, 41, dtv.ms, "000"
  
  set dtv = new DTSValue: dtv.posix = "-2"
    eqCompare deep, 42, dtv.date, #1969-12-31 23:59:58#
    eqCompare deep, 43, dtv.ms, "000"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.posix = string"
  end if
end sub

sub test_invalid(id, text)
  set dtv = new DTSValue
  On Error Resume Next: Err.Clear
  dtv.posix = text
  saveException: On Error goto 0
  checkException deep, id, errorInvalidText
end sub

sub test_posix_invalid()
  test_invalid 44, "aa"
  test_invalid 45, "1a"
  test_invalid 46, "a1"
  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.posix = string-invalid"
  end if
end sub

sub main()
  test_posix_get
  test_posix_numeric
  test_posix_string
  test_posix_invalid

  if not gMY_TEST = true then
    echo deep, "[ERROR] DTSValue.posix"
    WScript.Quit 1
  end if
end sub

main()
