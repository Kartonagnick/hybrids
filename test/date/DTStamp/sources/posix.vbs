
'--- local/hybrids                                    [test][DTStamp][posix.vbs]
'[2024-09-14][19:00:00] 005 Kartonagnick PRE
'  --- CastleOfDreams/vbs                                [test][date][stamp.vbs]
'  [2021-09-06][19:00:00] 004 Kartonagnick
'  [2021-09-02][18:00:00] 003 Kartonagnick
'  [2021-09-01][18:00:00] 002 Kartonagnick
'  [2021-08-25][18:00:00] 001 Kartonagnick

sub main()
  dim obj, deep: deep = 0

  set obj = new DTStamp
  obj.posix =  3    : eqCompare deep, 1, obj.date, #1970-01-01 00:00:03#
  obj.posix = 33    : eqCompare deep, 2, obj.date, #1970-01-01 00:00:33#
  obj.posix = 65    : eqCompare deep, 3, obj.date, #1970-01-01 00:01:05#
  obj.posix = 3665  : eqCompare deep, 4, obj.date, #1970-01-01 01:01:05#
  obj.posix = 90065 : eqCompare deep, 5, obj.date, #1970-01-02 01:01:05#
  obj.posix = 0     : eqCompare deep, 6, obj.date, #1970-01-01 00:00:00#
  obj.posix = -1    : eqCompare deep, 7, obj.date, #1969-12-31 23:59:59#
  obj.posix = -2    : eqCompare deep, 8, obj.date, #1969-12-31 23:59:58#

  if not gMY_TEST then
    echo deep, "[ERROR] DTStamp.posix"
    WScript.Quit 1
  end if
end sub

main()
