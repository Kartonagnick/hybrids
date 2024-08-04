
'--- local/hybrids                              [test][DTSValue][ctor.value.vbs]
'[2024-08-08][19:00:00] 001 Kartonagnick PRE
'  --- CastleOfDreams/hybrids                   [test][DTSValue][ctor.value.vbs]
'  [2022-03-16][19:00:00] 001 Kartonagnick

dim deep: deep = 0
dim dtv, ext

sub main()

'-------------1---
  set dtv = (new DTSValue)("2021-09m-15 14:35:59.333", "123")  
    eqCompare deep, 1, dtv.date, #2021-09-15 14:35:59#
    eqCompare deep, 2, dtv.ms, "123"

  set ext = (new DTSValue)(dtv, 456) 
    eqCompare deep, 3, ext.date, #2021-09-15 14:35:59#
    eqCompare deep, 4, ext.ms, "456"

'-------------2---
  set dtv = (new DTSValue)(0, "123")  
    eqCompare deep, 5, dtv.date, #1970-01-01 00:00:00#
    eqCompare deep, 6, dtv.ms, "123"

  set ext = (new DTSValue)(dtv, 456) 
    eqCompare deep, 7, ext.date, #1970-01-01 00:00:00#
    eqCompare deep, 8, ext.ms, "456"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue(DTSValue, ms): construct from other DTSValue"
    WScript.Quit 1
  end if
end sub

main()
