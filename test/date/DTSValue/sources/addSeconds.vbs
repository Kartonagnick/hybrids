
'--- local/hybrids                              [test][DTSValue][addSeconds.vbs]
'[2024-08-08][19:00:00] 001 Kartonagnick    
'  --- CastleOfDreams/hybrids                   [test][DTSValue][addSeconds.vbs]
'  [2022-03-16][19:00:00] 001 Kartonagnick

dim dtv

sub test_numeric(deep)
  set dtv = (new DTSValue)(4, 0)
  dtv.addSeconds 1:     eq_compare deep, 1, dtv.date, #1970-01-01 00:00:05#
  dtv.addSeconds 1:     eq_compare deep, 2, dtv.date, #1970-01-01 00:00:06#
  dtv.addSeconds 1:     eq_compare deep, 3, dtv.date, #1970-01-01 00:00:07#
  dtv.addSeconds 7:     eq_compare deep, 4, dtv.date, #1970-01-01 00:00:14#
  dtv.addSeconds 66:    eq_compare deep, 5, dtv.date, #1970-01-01 00:01:20#
  dtv.addSeconds 3665:  eq_compare deep, 6, dtv.date, #1970-01-01 01:02:25#
  dtv.addSeconds 90065: eq_compare deep, 7, dtv.date, #1970-01-02 02:03:30#

  set dtv = (new DTSValue)(0, 0)
  dtv.addSeconds -1: eq_compare deep,  8, dtv.date, #1969-12-31 23:59:59#
  dtv.addSeconds -1: eq_compare deep,  9, dtv.date, #1969-12-31 23:59:58#
  dtv.addSeconds -2: eq_compare deep, 10, dtv.date, #1969-12-31 23:59:56#

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.addSeconds(numeric)"
  end if
end sub

sub test_string(deep)
  set dtv = (new DTSValue)(4, 0)
  dtv.addSeconds "1":     eq_compare deep, 1, dtv.date, #1970-01-01 00:00:05#
  dtv.addSeconds "1":     eq_compare deep, 2, dtv.date, #1970-01-01 00:00:06#
  dtv.addSeconds "1":     eq_compare deep, 3, dtv.date, #1970-01-01 00:00:07#
  dtv.addSeconds "7":     eq_compare deep, 4, dtv.date, #1970-01-01 00:00:14#
  dtv.addSeconds "66":    eq_compare deep, 5, dtv.date, #1970-01-01 00:01:20#
  dtv.addSeconds "3665":  eq_compare deep, 6, dtv.date, #1970-01-01 01:02:25#
  dtv.addSeconds "90065": eq_compare deep, 7, dtv.date, #1970-01-02 02:03:30#

  set dtv = (new DTSValue)(0, 0)
  dtv.addSeconds "-1": eq_compare deep,  8, dtv.date, #1969-12-31 23:59:59#
  dtv.addSeconds "-1": eq_compare deep,  9, dtv.date, #1969-12-31 23:59:58#
  dtv.addSeconds "-2": eq_compare deep, 10, dtv.date, #1969-12-31 23:59:56#

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.addSeconds(string)"
  end if
end sub

sub test_invalid(deep)
  set dtv = (new DTSValue)(0, 0)  
  
  On Error Resume Next
  Err.Clear: dtv.addSeconds("aa")
  check_exception deep, 1, errorInvalidText
  
  Err.Clear: dtv.addSeconds("a1")
  check_exception deep, 2, errorInvalidText

  Err.Clear: dtv.addSeconds("1a")
  check_exception deep, 3, errorInvalidText

  On Error goto 0
  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.addSeconds(string-invalid)"
  end if
end sub

sub main()
  dim deep: deep = 0

  test_numeric deep
  test_string  deep
  test_invalid deep

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] DTSValue.addSeconds"
  else
    echo deep, "[ERROR] DTSValue.addSeconds"
    WScript.Quit 1
  end if
end sub

main()
