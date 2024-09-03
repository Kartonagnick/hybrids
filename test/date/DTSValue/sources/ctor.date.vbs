
'--- local/hybrids                               [test][DTSValue][ctor.date.vbs]
'[2024-08-01][19:00:00] 001 Kartonagnick    
'  --- CastleOfDreams/hybrids                    [test][DTSValue][ctor.date.vbs]
'  [2022-03-16][19:00:00] 001 Kartonagnick

dim deep: deep = 0

sub main()
  dim dtv

  set dtv = (new DTSValue)(#1970-01-01 00:00:00#, "1")  
    eqCompare deep,  1, dtv.date, #01/01/1970 00:00:00#
    eqCompare deep,  2, dtv.date, #01/01/1970#
    eqCompare deep,  3, dtv.ms  , "001"

  set dtv = (new DTSValue)(#2022-05-25 12:35:47#, "1")  
    eqCompare deep,  4, dtv.date, #25/05/2022 12:35:47#
    eqCompare deep,  5, dtv.date, #2022-05-25 12:35:47#
   neqCompare deep,  6, dtv.date, #25/05/2022#
    eqCompare deep,  7, dtv.ms  , "001"

  set dtv = (new DTSValue)(#1970-01-01 00:00:00#, nothing)  
    eqCompare deep,  8, dtv.date, #01/01/1970 00:00:00#
    eqCompare deep,  9, dtv.date, #01/01/1970#
    eqCompare deep, 10, dtv.date, #1970-01-01 00:00:00#
    eqCompare deep, 11, dtv.date, #1970-01-01#
    eqCompare deep, 12, dtv.ms  , "000"

  set dtv = (new DTSValue)(#2022-05-25 12:35:47#, nothing)  
    eqCompare deep, 13, dtv.date, #25/05/2022 12:35:47#
   neqCompare deep, 14, dtv.date, #25/05/2022#
    eqCompare deep, 15, dtv.ms  , "000"

  set dtv = (new DTSValue)(#1970-01-01#, 1.2)  
    eqCompare deep, 16, dtv.date, #01/01/1970 00:00:00#
    eqCompare deep, 17, dtv.date, #01/01/1970#
    eqCompare deep, 18, dtv.ms  , "001"

  set dtv = (new DTSValue)(#2021-05-15#, 1.2)  
    eqCompare deep, 10, dtv.date, #15/05/2021 00:00:00#
    eqCompare deep, 11, dtv.date, #15/05/2021#
    eqCompare deep, 12, dtv.ms  , "001"
   neqCompare deep, 13, dtv.ms  , "002"
   neqCompare deep, 14, dtv.date, #15/05/2021 00:00:01#
   neqCompare deep, 15, dtv.date, #15/05/2022#

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue(Date, ms): construct from Date"
    WScript.Quit 1
  end if
end sub

main()
