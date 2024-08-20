
'--- local/hybrids                                 [test][DTSValue][getters.vbs]
'[2024-08-20][19:00:00] 001 Kartonagnick PRE
'  --- CastleOfDreams/hybrids                      [test][DTSValue][getters.vbs]
'  [2022-03-16][19:00:00] 001 Kartonagnick

sub main()
  dim deep: deep = 0: dim dtv

  set dtv = (new DTSValue)("2021-08-31", "1")  
    eq_compare deep,  1, dtv.date, #2021-08-31#
    eq_compare deep,  2, dtv.yy  , "2021"
    eq_compare deep,  3, dtv.mo  , "08"
    eq_compare deep,  4, dtv.dd  , "31"
    eq_compare deep,  5, dtv.hh  , "00"
    eq_compare deep,  6, dtv.mm  , "00"
    eq_compare deep,  7, dtv.ss  , "00"
    eq_compare deep,  8, dtv.ms  , "001"

  set dtv = (new DTSValue)("2021-08-31 02:05:04", "234")  
    eq_compare deep,  9, dtv.date, #2021-08-31 02:05:04#
    eq_compare deep, 10, dtv.yy  , "2021"
    eq_compare deep, 11, dtv.mo  , "08"
    eq_compare deep, 12, dtv.dd  , "31"
    eq_compare deep, 13, dtv.hh  , "02"
    eq_compare deep, 14, dtv.mm  , "05"
    eq_compare deep, 15, dtv.ss  , "04"
    eq_compare deep, 16, dtv.ms  , "234"

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] DTSValue.getter (yy/mo/dd/hh/mm/ss/ms)"
  else
    echo deep, "[ERROR] DTSValue.getter (yy/mo/dd/hh/mm/ss/ms)"
    WScript.Quit 1
  end if
end sub

main()
