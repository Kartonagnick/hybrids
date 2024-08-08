
'--- local/hybrids                              [test][DTSValue][ctor.posix.vbs]
'[2024-08-08][19:00:00] 001 Kartonagnick PRE
'  --- CastleOfDreams/hybrids                   [test][DTSValue][ctor.posix.vbs]
'  [2022-03-16][19:00:00] 001 Kartonagnick

sub main()
  dim deep: deep = 0: dim dtv

  set dtv = (new DTSValue)(0, 1)  
    eq_compare deep, 1, dtv.date, #01/01/1970 00:00:00#
    eq_compare deep, 2, dtv.date, #01/01/1970#
    eq_compare deep, 3, dtv.ms, "001"

  set dtv = (new DTSValue)(3, 1)  
    eq_compare deep, 4, dtv.date, #01/01/1970 00:00:03#
    eq_compare deep, 5, dtv.ms, "001"

  set dtv = (new DTSValue)(33, 1)  
    eq_compare deep, 6, dtv.date, #01/01/1970 00:00:33#
    eq_compare deep, 7, dtv.ms, "001"

  set dtv = (new DTSValue)(65, 1)  
    eq_compare deep, 8, dtv.date, #01/01/1970 00:01:05#
    eq_compare deep, 9, dtv.ms, "001"

  set dtv = (new DTSValue)(3665, 1)  
    eq_compare deep, 10, dtv.date, #1970-01-01 01:01:05#
    eq_compare deep, 11, dtv.ms, "001"

  set dtv = (new DTSValue)(90065, 1)  
    eq_compare deep, 12, dtv.date, #1970-01-02 01:01:05#
    eq_compare deep, 13, dtv.ms, "001"

  set dtv = (new DTSValue)(-1, 0)  
    eq_compare deep, 14, dtv.date, #1969-12-31 23:59:59#
    eq_compare deep, 15, dtv.ms, "000"

  set dtv = (new DTSValue)(-2, 0)  
    eq_compare deep, 16, dtv.date, #1969-12-31 23:59:58#
    eq_compare deep, 17, dtv.ms, "000"

  set dtv = (new DTSValue)(-2, 1)  
    eq_compare deep, 18, dtv.date, #1969-12-31 23:59:58#
    eq_compare deep, 19, dtv.ms, "001"

  set dtv = (new DTSValue)("1", "1")  
    eq_compare deep, 20, dtv.date, #1970-01-01 00:00:01#
    eq_compare deep, 21, dtv.ms, "001"

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] DTSValue(posix, ms): construct from posix-seconds"
  else
    echo deep, "[ERROR] DTSValue(posix, ms): construct from posix-seconds"
    WScript.Quit 1
  end if
end sub

main()
