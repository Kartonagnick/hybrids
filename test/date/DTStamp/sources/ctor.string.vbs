
'--- local/hybrids                               [test][DTStamp][ctor.string.vbs]
'[2024-09-09][19:00:00] 001 Kartonagnick    

sub main()
  dim obj, deep: deep = 0

  set obj = (new DTStamp)("")
  eq_compare deep,  1, obj.date  , #1970/01/01 00:00:00#
  eq_compare deep,  2, obj.ms    , "000"
 neq_compare deep,  3, obj.ms    , "001"
 neq_compare deep,  4, obj.date  , #15/05/2021 00:00:01#
  eq_compare deep,  5, obj.import, "YY-MM-DD hh:mm:ss.ms"
  eq_compare deep,  6, obj.export, "YY-MM-DD hh:mm:ss.ms"
 neq_compare deep,  7, obj.import, "YY-MM-DD hh:mm:ss"
 neq_compare deep,  8, obj.export, "YY-MM-DD hh:mm:ss"
 
  set obj = (new DTStamp)("2024-08-28 01:06:39.123")
  eq_compare deep,  9, obj.date  , #2024/08/28 01:06:39#
  eq_compare deep, 10, obj.ms    , "123"
 neq_compare deep, 11, obj.ms    , "000"
 neq_compare deep, 12, obj.ms    , #2024/08/28 01:06:40#

  set obj = (new DTStamp)("2024-08m-28 01:06:39.123")
  eq_compare deep, 13, obj.date  , #2024/08/28 01:06:39#
  eq_compare deep, 14, obj.ms    , "123"
 neq_compare deep, 15, obj.ms    , "000"
 neq_compare deep, 16, obj.ms    , #2024/08/28 01:06:40#

  set obj = (new DTStamp)("2024-08m-28d 01:06:39.123")
  eq_compare deep, 17, obj.date  , #2024/08/28 01:06:39#
  eq_compare deep, 18, obj.ms    , "123"
 neq_compare deep, 19, obj.ms    , "000"
 neq_compare deep, 20, obj.ms    , #2024/08/28 01:06:40#

  set obj = (new DTStamp)("2024y-08m-28d 01:06:39.123")
  eq_compare deep, 21, obj.date  , #2024/08/28 01:06:39#
  eq_compare deep, 22, obj.ms    , "123"
 neq_compare deep, 23, obj.ms    , "000"
 neq_compare deep, 24, obj.ms    , #2024/08/28 01:06:40#

  set obj = (new DTStamp)("2024y-08m-28d 01:06:39")
  eq_compare deep, 25, obj.date  , #2024/08/28 01:06:39#
  eq_compare deep, 26, obj.ms    , "000"
 neq_compare deep, 27, obj.ms    , "001"
 neq_compare deep, 28, obj.ms    , #2024/08/28 01:06:40#

  set obj = (new DTStamp)("2024-08-28 01:06:39")
  eq_compare deep, 29, obj.date  , #2024/08/28 01:06:39#
  eq_compare deep, 30, obj.ms    , "000"
 neq_compare deep, 31, obj.ms    , "001"
 neq_compare deep, 32, obj.ms    , #2024/08/28 01:06:40#

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] DTStamp: constructor with param"
  else
    echo deep, "[ERROR] DTStamp: constructor with param"
    WScript.Quit 1
  end if
end sub

main()
