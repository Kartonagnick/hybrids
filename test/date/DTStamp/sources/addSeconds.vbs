
'--- local/hybrids                               [test][DTStamp][addSeconds.vbs]
'[2024-09-14][19:00:00] 005 Kartonagnick PRE
'  --- CastleOfDreams/vbs                                [test][date][stamp.vbs]
'  [2021-09-06][19:00:00] 004 Kartonagnick
'  [2021-09-02][18:00:00] 003 Kartonagnick
'  [2021-09-01][18:00:00] 002 Kartonagnick
'  [2021-08-25][18:00:00] 001 Kartonagnick

sub main()
  dim obj, dt, deep: deep = 0

  set obj = new DTStamp
  obj.posix = 3 
  obj.addSeconds(0)     : eqCompare deep, 1, obj.date, #1970-01-01 00:00:03#
  obj.addSeconds(1)     : eqCompare deep, 2, obj.date, #1970-01-01 00:00:04#
  obj.addSeconds(1)     : eqCompare deep, 3, obj.date, #1970-01-01 00:00:05#
  obj.addSeconds(1)     : eqCompare deep, 4, obj.date, #1970-01-01 00:00:06#
  obj.addSeconds(8)     : eqCompare deep, 5, obj.date, #1970-01-01 00:00:14#
  obj.addSeconds(66)    : eqCompare deep, 6, obj.date, #1970-01-01 00:01:20#
  obj.addSeconds(3665)  : eqCompare deep, 7, obj.date, #1970-01-01 01:02:25#
  obj.addSeconds(90065) : eqCompare deep, 8, obj.date, #1970-01-02 02:03:30#

  obj.posix = 1 
  obj.addSeconds(-1) : eqCompare deep,  9, obj.date, #1970-01-01 00:00:00#
  obj.addSeconds(-1) : eqCompare deep, 10, obj.date, #1969-12-31 23:59:59#
  
  obj.posix = 0
  dt = #1970-01-01 00:00:00#
  eqCompare deep, 11, obj.date, dt
  
  obj.addSeconds(-1): eqCompare deep, 12, obj.date, #1969-12-31 23:59:59#
  obj.addSeconds(-2): eqCompare deep, 13, obj.date, #1969-12-31 23:59:57#
  obj.addSeconds(-1): eqCompare deep, 14, obj.date, #1969-12-31 23:59:56#
  
  obj.posix = 0
  obj.addSeconds(-1)
  obj.addSeconds(-1)
  dt = #1969-12-31 23:59:58#
  eqCompare deep, 15, obj.date, dt

  if not gMY_TEST then
    echo deep, "[ERROR] DTStamp.addSeconds"
    WScript.Quit 1
  end if
end sub

main()
