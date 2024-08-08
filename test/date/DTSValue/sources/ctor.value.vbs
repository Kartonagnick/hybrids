
'--- local/hybrids                              [test][DTSValue][ctor.value.vbs]
'[2024-08-08][19:00:00] 001 Kartonagnick    
'  --- CastleOfDreams/hybrids                   [test][DTSValue][ctor.value.vbs]
'  [2022-03-16][19:00:00] 001 Kartonagnick

sub main()
  dim deep: deep = 0
  dim dtv: dim ext

'-------------1---
  set dtv = (new DTSValue)("2021-09m-15 14:35:59.333", "123")  
    eq_compare deep, 1, dtv.date, #2021-09-15 14:35:59#
    eq_compare deep, 2, dtv.ms, "123"

  set ext = (new DTSValue)(dtv, 456) 
    eq_compare deep, 3, ext.date, #2021-09-15 14:35:59#
    eq_compare deep, 4, ext.ms, "456"

'-------------2---
  set dtv = (new DTSValue)(0, "123")  
    eq_compare deep, 5, dtv.date, #1970-01-01 00:00:00#
    eq_compare deep, 6, dtv.ms, "123"

  set ext = (new DTSValue)(dtv, 456) 
    eq_compare deep, 7, ext.date, #1970-01-01 00:00:00#
    eq_compare deep, 8, ext.ms, "456"

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] DTSValue(DTSValue, ms): construct from other DTSValue"
  else
    echo deep, "[ERROR] DTSValue(DTSValue, ms): construct from other DTSValue"
    WScript.Quit 1
  end if
end sub

main()
