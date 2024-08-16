
'--- local/hybrids                                 [test][DTSValue][getters.vbs]
'[2024-08-20][19:00:00] 001 Kartonagnick PRE
'  --- CastleOfDreams/hybrids                      [test][DTSValue][getters.vbs]
'  [2022-03-16][19:00:00] 001 Kartonagnick

dim deep: deep = 0
dim dtv

sub main()

  set dtv = (new DTSValue)("2021-08-31", "1")  
    eqCompare deep,  1, dtv.date, #2021-08-31#
    eqCompare deep,  2, dtv.yy  , "2021"
    eqCompare deep,  3, dtv.mo  , "08"
    eqCompare deep,  4, dtv.dd  , "31"
    eqCompare deep,  5, dtv.hh  , "00"
    eqCompare deep,  6, dtv.mm  , "00"
    eqCompare deep,  7, dtv.ss  , "00"
    eqCompare deep,  8, dtv.ms  , "001"

  set dtv = (new DTSValue)("2021-08-31 02:05:04", "234")  
    eqCompare deep,  9, dtv.date, #2021-08-31 02:05:04#
    eqCompare deep, 10, dtv.yy  , "2021"
    eqCompare deep, 11, dtv.mo  , "08"
    eqCompare deep, 12, dtv.dd  , "31"
    eqCompare deep, 13, dtv.hh  , "02"
    eqCompare deep, 14, dtv.mm  , "05"
    eqCompare deep, 15, dtv.ss  , "04"
    eqCompare deep, 16, dtv.ms  , "234"

  if not gMY_TEST = true then
    echo deep, "[ERROR] DTSValue.getter (yy/mo/dd/hh/mm/ss/ms)"
    WScript.Quit 1
  end if
end sub

main()
