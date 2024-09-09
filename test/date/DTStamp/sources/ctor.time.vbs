
'--- local/hybrids                                [test][DTStamp][ctor.time.vbs]
'[2024-09-09][19:00:00] 001 Kartonagnick    

sub main()
  dim obj, deep: deep = 0

  set obj = (new DTStamp)(#12:35:59#)  
   neqCompare deep,  1, obj.date, #01/01/1970 12:35:59#
    eqCompare deep,  2, obj.date, #12:35:59#
    eqCompare deep,  3, obj.ms  , "000"
   neqCompare deep,  4, obj.ms  , "001"

  set obj = (new DTStamp)(#00:00:00#)  
    eqCompare deep,  5, obj.date, #00:00:00#
   neqCompare deep,  6, obj.date, #00:00:01#
    eqCompare deep,  7, obj.ms  , "000"
   neqCompare deep,  8, obj.ms  , "001"

  set obj = (new DTStamp)(#00:00:01#)  
    eqCompare deep,  9, obj.date, #00:00:01#
   neqCompare deep, 10, obj.date, #00:00:00#
    eqCompare deep, 11, obj.ms  , "000"
   neqCompare deep, 12, obj.ms  , "001"

  if not gMY_TEST then
    echo deep, "[ERROR] DTStamp.time"
    WScript.Quit 1
  end if
end sub

main()
