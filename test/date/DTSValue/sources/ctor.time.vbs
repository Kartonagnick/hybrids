
'--- local/hybrids                               [test][DTSValue][ctor.time.vbs]
'[2024-08-01][19:00:00] 001 Kartonagnick    
'  --- CastleOfDreams/hybrids                    [test][DTSValue][ctor.time.vbs]
'  [2022-03-16][19:00:00] 001 Kartonagnick

dim deep: deep = 0

sub main()
  dim dtv

  set dtv = (new DTSValue)(#12:35:59#, "1")  
   neqCompare deep, 1, dtv.date, #01/01/1970 12:35:59#
    eqCompare deep, 2, dtv.date, #12:35:59#
    eqCompare deep, 3, dtv.ms, "001"

  set dtv = (new DTSValue)(#00:00:00#, "1.2")  
    eqCompare deep, 4, dtv.date, #00:00:00#
    eqCompare deep, 5, dtv.ms, "001"

  set dtv = (new DTSValue)(#00:00:01#, 5)  
    eqCompare deep, 4, dtv.date, #00:00:01#
   neqCompare deep, 6, dtv.date, #00:00:00#
    eqCompare deep, 5, dtv.ms, "005"
   neqCompare deep, 7, dtv.ms, "5"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue(Time, ms): construct from Time"
    WScript.Quit 1
  end if
end sub

main()
