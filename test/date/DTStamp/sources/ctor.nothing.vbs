
'--- local/hybrids                             [test][DTStamp][ctor.nothing.vbs]
'[2024-09-09][19:00:00] 001 Kartonagnick    

sub main()
  dim obj, deep: deep = 0

  set obj = (new DTStamp)(nothing)
  eqCompare deep,  1, obj.date, #1970/01/01 00:00:00#
  eqCompare deep,  2, obj.ms  , "000"
 neqCompare deep,  3, obj.ms  , "001"
 neqCompare deep,  4, obj.date, #15/05/2021 00:00:01#

  set obj = (new DTStamp)(NULL)
  eqCompare deep,  5, obj.date, #1970/01/01 00:00:00#
  eqCompare deep,  6, obj.ms  , "000"
 neqCompare deep,  7, obj.ms  , "001"
 neqCompare deep,  8, obj.date, #15/05/2021 00:00:01#

  set obj = (new DTStamp)(Empty)
  eqCompare deep,  9, obj.date, #1970/01/01 00:00:00#
  eqCompare deep, 10, obj.ms  , "000"
 neqCompare deep, 11, obj.ms  , "001"
 neqCompare deep, 12, obj.date, #15/05/2021 00:00:01#

  if not gMY_TEST then
    echo deep, "[ERROR] DTStamp: constructor with nothing/NULL/Empty"
    WScript.Quit 1
  end if
end sub

main()
