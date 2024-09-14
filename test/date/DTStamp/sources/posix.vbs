
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
  obj.posix =  3    : eq_compare deep, 1, obj.date, #1970-01-01 00:00:03#
  obj.posix = 33    : eq_compare deep, 2, obj.date, #1970-01-01 00:00:33#
  obj.posix = 65    : eq_compare deep, 3, obj.date, #1970-01-01 00:01:05#
  obj.posix = 3665  : eq_compare deep, 4, obj.date, #1970-01-01 01:01:05#
  obj.posix = 90065 : eq_compare deep, 5, obj.date, #1970-01-02 01:01:05#
  obj.posix = 0     : eq_compare deep, 6, obj.date, #1970-01-01 00:00:00#
  obj.posix = -1    : eq_compare deep, 7, obj.date, #1969-12-31 23:59:59#
  obj.posix = -2    : eq_compare deep, 8, obj.date, #1969-12-31 23:59:58#

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] DTStamp.posix"
  else
    echo deep, "[ERROR] DTStamp.posix"
    WScript.Quit 1
  end if
end sub

main()
