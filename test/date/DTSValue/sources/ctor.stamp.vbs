
'--- local/hybrids                              [test][DTSValue][ctor.stamp.vbs]
'[2024-08-08][19:00:00] 001 Kartonagnick PRE
'  --- CastleOfDreams/hybrids                   [test][DTSValue][ctor.stamp.vbs]
'  [2022-03-16][19:00:00] 001 Kartonagnick

dim deep: deep = 0
dim dtv, ext

sub main()

  echo deep, "[IN DEV] DTSValue(DTStamp, ms): construct from other DTStamp"
  exit sub

'-------------1---
 set dts = (new DTStamp)("1970-01-01 00:00:01.123") 
 set ext = (new DTSValue)(dts, nothing) 
   eqCompare deep, 3, ext.date, #1970-01-01 00:00:01#
   eqCompare deep, 4, ext.ms, "123"

'-------------2---
 set dts = (new DTStamp)("1970-01-01 00:00:01.123") 
 set ext = (new DTSValue)(dts, 456) 
   eqCompare deep, 5, ext.date, #1970-01-01 00:00:01#
   eqCompare deep, 6, ext.ms, "456"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue(DTStamp, ms): construct from other DTStamp"
    WScript.Quit 1
  end if
end sub

main()
