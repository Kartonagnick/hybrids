
'--- local/hybrids                                [test][DTStamp][ctor.date.vbs]
'[2024-09-09][19:00:00] 001 Kartonagnick    

sub main()
  dim obj, deep: deep = 0

  set obj = (new DTStamp)(#1970-01-01 00:00:00#)  
    eqCompare deep,  1, obj.date, #01/01/1970 00:00:00#
    eqCompare deep,  2, obj.date, #01/01/1970#
    eqCompare deep,  3, obj.ms  , "000"

  set obj = (new DTStamp)(#2022-05-25 12:35:47#)  
    eqCompare deep,  4, obj.date, #25/05/2022 12:35:47#
    eqCompare deep,  5, obj.date, #2022-05-25 12:35:47#
   neqCompare deep,  6, obj.date, #25/05/2022#
    eqCompare deep,  7, obj.ms  , "000"

  set obj = (new DTStamp)(#1970-01-01 00:00:00#)  
    eqCompare deep,  8, obj.date, #01/01/1970 00:00:00#
    eqCompare deep,  9, obj.date, #01/01/1970#
    eqCompare deep, 10, obj.date, #1970-01-01 00:00:00#
    eqCompare deep, 11, obj.date, #1970-01-01#
    eqCompare deep, 12, obj.ms  , "000"

  set obj = (new DTStamp)(#2022-05-25 12:35:47#)  
    eqCompare deep, 13, obj.date, #25/05/2022 12:35:47#
   neqCompare deep, 14, obj.date, #25/05/2022#
    eqCompare deep, 15, obj.ms  , "000"

  set obj = (new DTStamp)(#1970-01-01#)  
    eqCompare deep, 16, obj.date, #01/01/1970 00:00:00#
    eqCompare deep, 17, obj.date, #01/01/1970#
    eqCompare deep, 18, obj.ms  , "000"

  set obj = (new DTStamp)(#2021-05-15#)  
    eqCompare deep, 10, obj.date, #15/05/2021 00:00:00#
    eqCompare deep, 11, obj.date, #15/05/2021#
    eqCompare deep, 12, obj.ms  , "000"
   neqCompare deep, 13, obj.ms  , "001"
   neqCompare deep, 14, obj.date, #15/05/2021 00:00:01#
   neqCompare deep, 15, obj.date, #15/05/2022#

  if not gMY_TEST then
    echo deep, "[ERROR] DTStamp.date"
    WScript.Quit 1
  end if
end sub

main()
