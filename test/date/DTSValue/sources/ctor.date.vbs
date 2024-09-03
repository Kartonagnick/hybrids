
'--- local/hybrids                               [test][DTSValue][ctor.date.vbs]
'[2024-08-01][19:00:00] 001 Kartonagnick    
'  --- CastleOfDreams/hybrids                    [test][DTSValue][ctor.date.vbs]
'  [2022-03-16][19:00:00] 001 Kartonagnick

sub main()
  dim deep: deep = 0: dim dtv

  set dtv = (new DTSValue)(#1970-01-01 00:00:00#, "1")  
    eq_compare deep,  1, dtv.date, #01/01/1970 00:00:00#
    eq_compare deep,  2, dtv.date, #01/01/1970#
    eq_compare deep,  3, dtv.ms, "001"

  set dtv = (new DTSValue)(#2022-05-25 12:35:47#, "1")  
    eq_compare deep,  4, dtv.date, #25/05/2022 12:35:47#
    eq_compare deep,  5, dtv.date, #2022-05-25 12:35:47#
   neq_compare deep,  6, dtv.date, #25/05/2022#
    eq_compare deep,  7, dtv.ms, "001"

  set dtv = (new DTSValue)(#1970-01-01 00:00:00#, nothing)  
    eq_compare deep,  8, dtv.date, #01/01/1970 00:00:00#
    eq_compare deep,  9, dtv.date, #01/01/1970#
    eq_compare deep, 10, dtv.date, #1970-01-01 00:00:00#
    eq_compare deep, 11, dtv.date, #1970-01-01#
    eq_compare deep, 12, dtv.ms, "000"

  set dtv = (new DTSValue)(#2022-05-25 12:35:47#, nothing)  
    eq_compare deep, 13, dtv.date, #25/05/2022 12:35:47#
   neq_compare deep, 14, dtv.date, #25/05/2022#
    eq_compare deep, 15, dtv.ms, "000"

  set dtv = (new DTSValue)(#1970-01-01#, 1.2)  
    eq_compare deep, 16, dtv.date, #01/01/1970 00:00:00#
    eq_compare deep, 17, dtv.date, #01/01/1970#
    eq_compare deep, 18, dtv.ms, "001"

  set dtv = (new DTSValue)(#2021-05-15#, 1.2)  
    eq_compare deep, 10, dtv.date, #15/05/2021 00:00:00#
    eq_compare deep, 11, dtv.date, #15/05/2021#
    eq_compare deep, 12, dtv.ms, "001"
   neq_compare deep, 13, dtv.ms, "002"
   neq_compare deep, 14, dtv.date, #15/05/2021 00:00:01#
   neq_compare deep, 15, dtv.date, #15/05/2022#

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] DTSValue(Date, ms): construct from Date"
  else
    echo deep, "[ERROR] DTSValue(Date, ms): construct from Date"
    WScript.Quit 1
  end if
end sub

main()
