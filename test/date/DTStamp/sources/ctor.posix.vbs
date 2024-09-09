
'--- local/hybrids                                [test][DTStamp][ctor.posix.vbs]
'[2024-09-09][19:00:00] 001 Kartonagnick PRE

sub main()
  dim obj, deep: deep = 0

  set obj = (new DTStamp)(10)
    eqCompare deep,  1, obj.date, #1970/01/01 00:00:10#
    eqCompare deep,  2, obj.ms  , "000"
   neqCompare deep,  3, obj.ms  , "001"
   neqCompare deep,  4, obj.date, #15/05/2021 00:00:01#

  set obj = (new DTStamp)(0)
    eqCompare deep,  5, obj.date, #01/01/1970 00:00:00#
    eqCompare deep,  6, obj.date, #01/01/1970#
    eqCompare deep,  7, obj.ms  , "000"
   neqCompare deep,  8, obj.ms  , "001"
   neqCompare deep,  9, obj.date, #15/05/2021 00:00:01#

  set obj = (new DTStamp)(3)
    eqCompare deep, 10, obj.date, #01/01/1970 00:00:03#
    eqCompare deep, 11, obj.ms  , "000"
   neqCompare deep, 12, obj.ms  , "001"
   neqCompare deep, 13, obj.date, #15/05/2021 00:00:01#
  
  set obj = (new DTStamp)(33)
    eqCompare deep, 14, obj.date, #01/01/1970 00:00:33#
    eqCompare deep, 15, obj.ms  , "000"
   neqCompare deep, 16, obj.ms  , "001"
   neqCompare deep, 17, obj.date, #15/05/2021 00:00:01#
  
  set obj = (new DTStamp)(65)
    eqCompare deep, 18, obj.date, #01/01/1970 00:01:05#
    eqCompare deep, 19, obj.ms  , "000"
   neqCompare deep, 20, obj.ms  , "001"
   neqCompare deep, 21, obj.date, #15/05/2021 00:00:01#
  
  set obj = (new DTStamp)(3665)  
    eqCompare deep, 22, obj.date, #1970-01-01 01:01:05#
    eqCompare deep, 23, obj.ms  , "000"
   neqCompare deep, 24, obj.ms  , "001"
   neqCompare deep, 25, obj.date, #15/05/2021 00:00:01#
  
  set obj = (new DTStamp)(90065)  
    eqCompare deep, 26, obj.date, #1970-01-02 01:01:05#
    eqCompare deep, 27, obj.ms  , "000"
   neqCompare deep, 28, obj.ms  , "001"
   neqCompare deep, 29, obj.date, #15/05/2021 00:00:01#
  
  set obj = (new DTStamp)(-1)  
    eqCompare deep, 30, obj.date, #1969-12-31 23:59:59#
    eqCompare deep, 31, obj.ms  , "000"
   neqCompare deep, 32, obj.ms  , "001"
   neqCompare deep, 33, obj.date, #15/05/2021 00:00:01#
  
  set obj = (new DTStamp)(-2)  
    eqCompare deep, 34, obj.date, #1969-12-31 23:59:58#
    eqCompare deep, 35, obj.ms  , "000"
   neqCompare deep, 36, obj.ms  , "001"
   neqCompare deep, 37, obj.date, #15/05/2021 00:00:01#

  if not gMY_TEST then
    echo deep, "[ERROR] DTStamp.posix"
    WScript.Quit 1
  end if
end sub

main()
