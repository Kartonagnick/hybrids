
'--- local/hybrids                               [test][DTSValue][ctor.time.vbs]
'[2024-08-01][19:00:00] 001 Kartonagnick PRE
'  --- CastleOfDreams/hybrids                    [test][DTSValue][ctor.time.vbs]
'  [2022-03-16][19:00:00] 001 Kartonagnick

sub main()
  dim deep: deep = 0: dim dtv

  set dtv = (new DTSValue)(#12:35:59#, "1")  
   neq_compare deep, 1, dtv.date, #01/01/1970 12:35:59#
    eq_compare deep, 2, dtv.date, #12:35:59#
    eq_compare deep, 3, dtv.ms, "001"

  set dtv = (new DTSValue)(#00:00:00#, "1.2")  
    eq_compare deep, 4, dtv.date, #00:00:00#
    eq_compare deep, 5, dtv.ms, "001"

  set dtv = (new DTSValue)(#00:00:01#, 5)  
    eq_compare deep, 4, dtv.date, #00:00:01#
   neq_compare deep, 6, dtv.date, #00:00:00#
    eq_compare deep, 5, dtv.ms, "005"
   neq_compare deep, 7, dtv.ms, "5"

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] DTSValue(Time, ms): construct from Time"
  else
    echo deep, "[ERROR] DTSValue(Time, ms): construct from Time"
    WScript.Quit 1
  end if
end sub

main()
