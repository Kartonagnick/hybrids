
'--- local/hybrids                               [test][DTSValue][date.time.vbs]
'[2024-08-14][19:00:00] 001 Kartonagnick PRE
'  --- CastleOfDreams/hybrids                    [test][DTSValue][date.time.vbs]
'  [2022-03-16][19:00:00] 001 Kartonagnick

dim deep: deep = 0
dim dtv

sub main()
  set dtv = (new DTSValue)(#23:45:23#, "1")  
  dtv.date = #12:35:59#
   neqCompare deep, 1, dtv.date, #01/01/1970 12:35:59#
    eqCompare deep, 2, dtv.date, #12:35:59#
    eqCompare deep, 3, dtv.ms, "000"

  set dtv = new DTSValue
  dtv.date = #00:00:00#
    eqCompare deep, 4, dtv.date, #00:00:00#
    eqCompare deep, 5, dtv.ms, "000"
   neqCompare deep, 6, dtv.date, #00:00:01#
   neqCompare deep, 7, dtv.ms, "5"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.Date = #time#"
    WScript.Quit 1
  end if
end sub

main()
