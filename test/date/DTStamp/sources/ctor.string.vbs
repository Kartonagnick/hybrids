
'--- local/hybrids                               [test][DTStamp][ctor.string.vbs]
'[2024-09-09][19:00:00] 001 Kartonagnick PRE

sub main()
  dim obj, deep: deep = 0

  set obj = (new DTStamp)("")
  eqCompare deep,  1, obj.date  , #1970/01/01 00:00:00#
  eqCompare deep,  2, obj.ms    , "000"
 neqCompare deep,  3, obj.ms    , "001"
 neqCompare deep,  4, obj.date  , #15/05/2021 00:00:01#
  eqCompare deep,  5, obj.import, "YY-MM-DD hh:mm:ss.ms"
  eqCompare deep,  6, obj.export, "YY-MM-DD hh:mm:ss.ms"
 neqCompare deep,  7, obj.import, "YY-MM-DD hh:mm:ss"
 neqCompare deep,  8, obj.export, "YY-MM-DD hh:mm:ss"
 
  set obj = (new DTStamp)("2024-08-28 01:06:39.123")
  eqCompare deep,  9, obj.date  , #2024/08/28 01:06:39#
  eqCompare deep, 10, obj.ms    , "123"
 neqCompare deep, 11, obj.ms    , "000"
 neqCompare deep, 12, obj.ms    , #2024/08/28 01:06:40#

  set obj = (new DTStamp)("2024-08m-28 01:06:39.123")
  eqCompare deep, 13, obj.date  , #2024/08/28 01:06:39#
  eqCompare deep, 14, obj.ms    , "123"
 neqCompare deep, 15, obj.ms    , "000"
 neqCompare deep, 16, obj.ms    , #2024/08/28 01:06:40#

  set obj = (new DTStamp)("2024-08m-28d 01:06:39.123")
  eqCompare deep, 17, obj.date  , #2024/08/28 01:06:39#
  eqCompare deep, 18, obj.ms    , "123"
 neqCompare deep, 19, obj.ms    , "000"
 neqCompare deep, 20, obj.ms    , #2024/08/28 01:06:40#

  set obj = (new DTStamp)("2024y-08m-28d 01:06:39.123")
  eqCompare deep, 21, obj.date  , #2024/08/28 01:06:39#
  eqCompare deep, 22, obj.ms    , "123"
 neqCompare deep, 23, obj.ms    , "000"
 neqCompare deep, 24, obj.ms    , #2024/08/28 01:06:40#

  set obj = (new DTStamp)("2024y-08m-28d 01:06:39")
  eqCompare deep, 25, obj.date  , #2024/08/28 01:06:39#
  eqCompare deep, 26, obj.ms    , "000"
 neqCompare deep, 27, obj.ms    , "001"
 neqCompare deep, 28, obj.ms    , #2024/08/28 01:06:40#

  set obj = (new DTStamp)("2024-08-28 01:06:39")
  eqCompare deep, 29, obj.date  , #2024/08/28 01:06:39#
  eqCompare deep, 30, obj.ms    , "000"
 neqCompare deep, 31, obj.ms    , "001"
 neqCompare deep, 32, obj.ms    , #2024/08/28 01:06:40#

  if not gMY_TEST then
    echo deep, "[ERROR] DTStamp: constructor with param"
    WScript.Quit 1
  end if
end sub

main()
