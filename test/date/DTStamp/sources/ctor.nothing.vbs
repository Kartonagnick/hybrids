
'--- local/hybrids                             [test][DTStamp][ctor.nothing.vbs]
'[2024-09-09][19:00:00] 001 Kartonagnick    

sub main()
  dim obj, deep: deep = 0

  set obj = (new DTStamp)(nothing)
  eq_compare deep,  1, obj.date, #1970/01/01 00:00:00#
  eq_compare deep,  2, obj.ms  , "000"
 neq_compare deep,  3, obj.ms  , "001"
 neq_compare deep,  4, obj.date, #15/05/2021 00:00:01#

  set obj = (new DTStamp)(NULL)
  eq_compare deep,  5, obj.date, #1970/01/01 00:00:00#
  eq_compare deep,  6, obj.ms  , "000"
 neq_compare deep,  7, obj.ms  , "001"
 neq_compare deep,  8, obj.date, #15/05/2021 00:00:01#

  set obj = (new DTStamp)(Empty)
  eq_compare deep,  9, obj.date, #1970/01/01 00:00:00#
  eq_compare deep, 10, obj.ms  , "000"
 neq_compare deep, 11, obj.ms  , "001"
 neq_compare deep, 12, obj.date, #15/05/2021 00:00:01#

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] DTStamp: constructor with nothing/NULL/Empty"
  else
    echo deep, "[ERROR] DTStamp: constructor with nothing/NULL/Empty"
    WScript.Quit 1
  end if
end sub

main()
