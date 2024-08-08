
'--- local/hybrids                              [test][DTSValue][ctor.stamp.vbs]
'[2024-08-08][19:00:00] 001 Kartonagnick    
'  --- CastleOfDreams/hybrids                   [test][DTSValue][ctor.stamp.vbs]
'  [2022-03-16][19:00:00] 001 Kartonagnick

sub main()
  dim deep: deep = 0
  dim dtv: dim ext

  echo deep, "[IN DEV] DTSValue(DTStamp, ms): construct from other DTStamp"
  exit sub

'-------------1---
 set dts = (new DTStamp)("1970-01-01 00:00:01.123") 
 set ext = (new DTSValue)(dts, nothing) 
   eq_compare deep, 3, ext.date, #1970-01-01 00:00:01#
   eq_compare deep, 4, ext.ms, "123"

'-------------2---
 set dts = (new DTStamp)("1970-01-01 00:00:01.123") 
 set ext = (new DTSValue)(dts, 456) 
   eq_compare deep, 5, ext.date, #1970-01-01 00:00:01#
   eq_compare deep, 6, ext.ms, "456"

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] DTSValue(DTStamp, ms): construct from other DTStamp"
  else
    echo deep, "[ERROR] DTSValue(DTStamp, ms): construct from other DTStamp"
    WScript.Quit 1
  end if
end sub

main()
