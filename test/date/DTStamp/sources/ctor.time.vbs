
'--- local/hybrids                                [test][DTStamp][ctor.time.vbs]
'[2024-09-09][19:00:00] 001 Kartonagnick PRE

sub main()
  dim obj, deep: deep = 0

  set obj = (new DTStamp)(#12:35:59#)  
   neq_compare deep,  1, obj.date, #01/01/1970 12:35:59#
    eq_compare deep,  2, obj.date, #12:35:59#
    eq_compare deep,  3, obj.ms  , "000"
   neq_compare deep,  4, obj.ms  , "001"

  set obj = (new DTStamp)(#00:00:00#)  
    eq_compare deep,  5, obj.date, #00:00:00#
   neq_compare deep,  6, obj.date, #00:00:01#
    eq_compare deep,  7, obj.ms  , "000"
   neq_compare deep,  8, obj.ms  , "001"

  set obj = (new DTStamp)(#00:00:01#)  
    eq_compare deep,  9, obj.date, #00:00:01#
   neq_compare deep, 10, obj.date, #00:00:00#
    eq_compare deep, 11, obj.ms  , "000"
   neq_compare deep, 12, obj.ms  , "001"

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] DTStamp.time"
  else
    echo deep, "[ERROR] DTStamp.time"
    WScript.Quit 1
  end if
end sub

main()
