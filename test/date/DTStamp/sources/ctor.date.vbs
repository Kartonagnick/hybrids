
'--- local/hybrids                                [test][DTStamp][ctor.date.vbs]
'[2024-09-09][19:00:00] 001 Kartonagnick    

sub main()
  dim obj, deep: deep = 0

  set obj = (new DTStamp)(#1970-01-01 00:00:00#)  
    eq_compare deep,  1, obj.date, #01/01/1970 00:00:00#
    eq_compare deep,  2, obj.date, #01/01/1970#
    eq_compare deep,  3, obj.ms  , "000"

  set obj = (new DTStamp)(#2022-05-25 12:35:47#)  
    eq_compare deep,  4, obj.date, #25/05/2022 12:35:47#
    eq_compare deep,  5, obj.date, #2022-05-25 12:35:47#
   neq_compare deep,  6, obj.date, #25/05/2022#
    eq_compare deep,  7, obj.ms  , "000"

  set obj = (new DTStamp)(#1970-01-01 00:00:00#)  
    eq_compare deep,  8, obj.date, #01/01/1970 00:00:00#
    eq_compare deep,  9, obj.date, #01/01/1970#
    eq_compare deep, 10, obj.date, #1970-01-01 00:00:00#
    eq_compare deep, 11, obj.date, #1970-01-01#
    eq_compare deep, 12, obj.ms  , "000"

  set obj = (new DTStamp)(#2022-05-25 12:35:47#)  
    eq_compare deep, 13, obj.date, #25/05/2022 12:35:47#
   neq_compare deep, 14, obj.date, #25/05/2022#
    eq_compare deep, 15, obj.ms  , "000"

  set obj = (new DTStamp)(#1970-01-01#)  
    eq_compare deep, 16, obj.date, #01/01/1970 00:00:00#
    eq_compare deep, 17, obj.date, #01/01/1970#
    eq_compare deep, 18, obj.ms  , "000"

  set obj = (new DTStamp)(#2021-05-15#)  
    eq_compare deep, 10, obj.date, #15/05/2021 00:00:00#
    eq_compare deep, 11, obj.date, #15/05/2021#
    eq_compare deep, 12, obj.ms  , "000"
   neq_compare deep, 13, obj.ms  , "001"
   neq_compare deep, 14, obj.date, #15/05/2021 00:00:01#
   neq_compare deep, 15, obj.date, #15/05/2022#

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] DTStamp.date"
  else
    echo deep, "[ERROR] DTStamp.date"
    WScript.Quit 1
  end if
end sub

main()
