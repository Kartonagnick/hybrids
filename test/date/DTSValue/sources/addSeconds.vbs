
'--- local/hybrids                              [test][DTSValue][addSeconds.vbs]
'[2024-08-08][19:00:00] 001 Kartonagnick PRE
'  --- CastleOfDreams/hybrids                   [test][DTSValue][addSeconds.vbs]
'  [2022-03-16][19:00:00] 001 Kartonagnick

dim deep: deep = 0
dim dtv

sub test_numeric()
  set dtv = (new DTSValue)(4, 0)
  dtv.addSeconds 1:     eqCompare deep, 1, dtv.date, #1970-01-01 00:00:05#
  dtv.addSeconds 1:     eqCompare deep, 2, dtv.date, #1970-01-01 00:00:06#
  dtv.addSeconds 1:     eqCompare deep, 3, dtv.date, #1970-01-01 00:00:07#
  dtv.addSeconds 7:     eqCompare deep, 4, dtv.date, #1970-01-01 00:00:14#
  dtv.addSeconds 66:    eqCompare deep, 5, dtv.date, #1970-01-01 00:01:20#
  dtv.addSeconds 3665:  eqCompare deep, 6, dtv.date, #1970-01-01 01:02:25#
  dtv.addSeconds 90065: eqCompare deep, 7, dtv.date, #1970-01-02 02:03:30#

  set dtv = (new DTSValue)(0, 0)
  dtv.addSeconds -1: eqCompare deep,  8, dtv.date, #1969-12-31 23:59:59#
  dtv.addSeconds -1: eqCompare deep,  9, dtv.date, #1969-12-31 23:59:58#
  dtv.addSeconds -2: eqCompare deep, 10, dtv.date, #1969-12-31 23:59:56#

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.addSeconds(numeric)"
  end if
end sub

sub test_string()
  set dtv = (new DTSValue)(4, 0)
  dtv.addSeconds "1":     eqCompare deep, 1, dtv.date, #1970-01-01 00:00:05#
  dtv.addSeconds "1":     eqCompare deep, 2, dtv.date, #1970-01-01 00:00:06#
  dtv.addSeconds "1":     eqCompare deep, 3, dtv.date, #1970-01-01 00:00:07#
  dtv.addSeconds "7":     eqCompare deep, 4, dtv.date, #1970-01-01 00:00:14#
  dtv.addSeconds "66":    eqCompare deep, 5, dtv.date, #1970-01-01 00:01:20#
  dtv.addSeconds "3665":  eqCompare deep, 6, dtv.date, #1970-01-01 01:02:25#
  dtv.addSeconds "90065": eqCompare deep, 7, dtv.date, #1970-01-02 02:03:30#

  set dtv = (new DTSValue)(0, 0)
  dtv.addSeconds "-1": eqCompare deep,  8, dtv.date, #1969-12-31 23:59:59#
  dtv.addSeconds "-1": eqCompare deep,  9, dtv.date, #1969-12-31 23:59:58#
  dtv.addSeconds "-2": eqCompare deep, 10, dtv.date, #1969-12-31 23:59:56#

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.addSeconds(string)"
  end if
end sub

sub test_invalid()
  set dtv = (new DTSValue)(0, 0)  
  
  On Error Resume Next: Err.Clear
  dtv.addSeconds("aa")
  saveException: On Error goto 0
  checkException deep, 1, errorInvalidText
  
  On Error Resume Next: Err.Clear
  dtv.addSeconds("a1")
  saveException: On Error goto 0
  checkException deep, 2, errorInvalidText

  On Error Resume Next: Err.Clear  
  dtv.addSeconds("1a")
  saveException: On Error goto 0
  checkException deep, 3, errorInvalidText

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.addSeconds(string-invalid)"
  end if
end sub

sub main()
  test_numeric
  test_string
  test_invalid
  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.addSeconds"
    WScript.Quit 1
  end if
end sub

main()
