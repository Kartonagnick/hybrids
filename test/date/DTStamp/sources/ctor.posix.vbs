
'--- local/hybrids                                [test][DTStamp][ctor.posix.vbs]
'[2024-09-09][19:00:00] 001 Kartonagnick PRE

sub main()
  dim obj, deep: deep = 0

  set obj = (new DTStamp)(10)
    eq_compare deep,  1, obj.date, #1970/01/01 00:00:10#
    eq_compare deep,  2, obj.ms  , "000"
   neq_compare deep,  3, obj.ms  , "001"
   neq_compare deep,  4, obj.date, #15/05/2021 00:00:01#

  set obj = (new DTStamp)(0)
    eq_compare deep,  5, obj.date, #01/01/1970 00:00:00#
    eq_compare deep,  6, obj.date, #01/01/1970#
    eq_compare deep,  7, obj.ms  , "000"
   neq_compare deep,  8, obj.ms  , "001"
   neq_compare deep,  9, obj.date, #15/05/2021 00:00:01#

  set obj = (new DTStamp)(3)
    eq_compare deep, 10, obj.date, #01/01/1970 00:00:03#
    eq_compare deep, 11, obj.ms  , "000"
   neq_compare deep, 12, obj.ms  , "001"
   neq_compare deep, 13, obj.date, #15/05/2021 00:00:01#
  
  set obj = (new DTStamp)(33)
    eq_compare deep, 14, obj.date, #01/01/1970 00:00:33#
    eq_compare deep, 15, obj.ms  , "000"
   neq_compare deep, 16, obj.ms  , "001"
   neq_compare deep, 17, obj.date, #15/05/2021 00:00:01#
  
  set obj = (new DTStamp)(65)
    eq_compare deep, 18, obj.date, #01/01/1970 00:01:05#
    eq_compare deep, 19, obj.ms  , "000"
   neq_compare deep, 20, obj.ms  , "001"
   neq_compare deep, 21, obj.date, #15/05/2021 00:00:01#
  
  set obj = (new DTStamp)(3665)  
    eq_compare deep, 22, obj.date, #1970-01-01 01:01:05#
    eq_compare deep, 23, obj.ms  , "000"
   neq_compare deep, 24, obj.ms  , "001"
   neq_compare deep, 25, obj.date, #15/05/2021 00:00:01#
  
  set obj = (new DTStamp)(90065)  
    eq_compare deep, 26, obj.date, #1970-01-02 01:01:05#
    eq_compare deep, 27, obj.ms  , "000"
   neq_compare deep, 28, obj.ms  , "001"
   neq_compare deep, 29, obj.date, #15/05/2021 00:00:01#
  
  set obj = (new DTStamp)(-1)  
    eq_compare deep, 30, obj.date, #1969-12-31 23:59:59#
    eq_compare deep, 31, obj.ms  , "000"
   neq_compare deep, 32, obj.ms  , "001"
   neq_compare deep, 33, obj.date, #15/05/2021 00:00:01#
  
  set obj = (new DTStamp)(-2)  
    eq_compare deep, 34, obj.date, #1969-12-31 23:59:58#
    eq_compare deep, 35, obj.ms  , "000"
   neq_compare deep, 36, obj.ms  , "001"
   neq_compare deep, 37, obj.date, #15/05/2021 00:00:01#

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] DTStamp.posix"
  else
    echo deep, "[ERROR] DTStamp.posix"
    WScript.Quit 1
  end if
end sub

main()
