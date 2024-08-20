
'--- local/hybrids                                   [test][DTSValue][posix.vbs]
'[2024-08-20][19:00:00] 001 Kartonagnick    
'  --- CastleOfDreams/hybrids                        [test][DTSValue][posix.vbs]
'  [2022-03-16][19:00:00] 001 Kartonagnick

dim dtv

sub test_posix_get(deep)
  set dtv = new DTSValue
  dtv.date = #1970-01-01 00:00:03# : eq_compare deep, 1, dtv.posix, 3
  dtv.date = #1970-01-01 00:00:33# : eq_compare deep, 2, dtv.posix, 33
  dtv.date = #1970-01-01 00:01:05# : eq_compare deep, 3, dtv.posix, 65
  dtv.date = #1970-01-01 01:01:05# : eq_compare deep, 4, dtv.posix, 3665
  dtv.date = #1970-01-02 01:01:05# : eq_compare deep, 5, dtv.posix, 90065
  if not gMY_TEST then
    echo deep, "[ERROR] val = DTSValue.posix (getter)"
  end if
end sub

sub test_posix_numeric(deep)
  set dtv = new DTSValue: dtv.posix = 0
    eq_compare deep,  6, dtv.date, #01/01/1970 00:00:00#
    eq_compare deep,  7, dtv.date, #01/01/1970#
    eq_compare deep,  8, dtv.ms, "000"

  set dtv = new DTSValue: dtv.posix = 1
    eq_compare deep,  9, dtv.date, #1970-01-01 00:00:01#
    eq_compare deep, 10, dtv.ms, "000"

  set dtv = new DTSValue: dtv.posix = 3
    eq_compare deep, 11, dtv.date, #01/01/1970 00:00:03#
    eq_compare deep, 12, dtv.ms, "000"
  
  set dtv = new DTSValue: dtv.posix = 33
    eq_compare deep, 13, dtv.date, #01/01/1970 00:00:33#
    eq_compare deep, 14, dtv.ms, "000"
  
  set dtv = new DTSValue: dtv.posix = 65
    eq_compare deep, 15, dtv.date, #01/01/1970 00:01:05#
    eq_compare deep, 16, dtv.ms, "000"
  
  set dtv = new DTSValue: dtv.posix = 3665
    eq_compare deep, 17, dtv.date, #1970-01-01 01:01:05#
    eq_compare deep, 18, dtv.ms, "000"
  
  set dtv = new DTSValue: dtv.posix = 90065
    eq_compare deep, 19, dtv.date, #1970-01-02 01:01:05#
    eq_compare deep, 20, dtv.ms, "000"
  
  set dtv = new DTSValue: dtv.posix = -1
    eq_compare deep, 21, dtv.date, #1969-12-31 23:59:59#
    eq_compare deep, 22, dtv.ms, "000"
  
  set dtv = new DTSValue: dtv.posix = -2
    eq_compare deep, 23, dtv.date, #1969-12-31 23:59:58#
    eq_compare deep, 24, dtv.ms, "000"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.posix = numeric"
  end if
end sub

sub test_posix_string(deep)
  set dtv = new DTSValue: dtv.posix = "0"
    eq_compare deep, 25, dtv.date, #01/01/1970 00:00:00#
    eq_compare deep, 26, dtv.date, #01/01/1970#
    eq_compare deep, 27, dtv.ms, "000"

  set dtv = new DTSValue: dtv.posix = "1"
    eq_compare deep, 28, dtv.date, #1970-01-01 00:00:01#
    eq_compare deep, 29, dtv.ms, "000"

  set dtv = new DTSValue: dtv.posix = "3"
    eq_compare deep, 30, dtv.date, #01/01/1970 00:00:03#
    eq_compare deep, 31, dtv.ms, "000"
  
  set dtv = new DTSValue: dtv.posix = "33"
    eq_compare deep, 32, dtv.date, #01/01/1970 00:00:33#
    eq_compare deep, 33, dtv.ms, "000"
  
  set dtv = new DTSValue: dtv.posix = "65"
    eq_compare deep, 34, dtv.date, #01/01/1970 00:01:05#
    eq_compare deep, 35, dtv.ms, "000"
  
  set dtv = new DTSValue: dtv.posix = "3665"
    eq_compare deep, 36, dtv.date, #1970-01-01 01:01:05#
    eq_compare deep, 37, dtv.ms, "000"
  
  set dtv = new DTSValue: dtv.posix = "90065"
    eq_compare deep, 38, dtv.date, #1970-01-02 01:01:05#
    eq_compare deep, 39, dtv.ms, "000"
  
  set dtv = new DTSValue: dtv.posix = "-1"
    eq_compare deep, 40, dtv.date, #1969-12-31 23:59:59#
    eq_compare deep, 41, dtv.ms, "000"
  
  set dtv = new DTSValue: dtv.posix = "-2"
    eq_compare deep, 42, dtv.date, #1969-12-31 23:59:58#
    eq_compare deep, 43, dtv.ms, "000"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.posix = string"
  end if
end sub

sub test_invalid(deep,id, text)
  set dtv = new DTSValue
  On Error Resume Next 
  Err.Clear:
  dtv.posix = text
  check_exception deep, id, errorInvalidText
  On Error goto 0
end sub

sub test_posix_invalid(deep)
  test_invalid deep, 44, "aa"
  test_invalid deep, 45, "1a"
  test_invalid deep, 46, "a1"
  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.posix = string-invalid"
  end if
end sub

sub main()
  dim deep: deep = 0 

  test_posix_get     deep
  test_posix_numeric deep
  test_posix_string  deep
  test_posix_invalid deep

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] DTSValue.posix"
  else
    echo deep, "[ERROR] DTSValue.posix"
    WScript.Quit 1
  end if
end sub

main()
