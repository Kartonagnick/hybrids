
'--- local/hybrids                                  [test][DTSValue][output.vbs]
'[2024-08-20][19:00:00] 001 Kartonagnick PRE
'  --- CastleOfDreams/hybrids                       [test][DTSValue][output.vbs]
'  [2022-03-16][19:00:00] 001 Kartonagnick

dim deep: deep = 0
dim dtv

sub main()
  set dtv = (new DTSValue)("2021-08-15 02:05:04", "567")  
    eqCompare deep, 1, dtv.timeOnly , "02:05:04"
    eqCompare deep, 2, dtv.timeStamp, "02:05:04.567"
    eqCompare deep, 3, dtv.dateStamp, "2021-08-15"
    eqCompare deep, 2, dtv.logsStamp, "[2021-08-15][02:05:04.567]"
    eqCompare deep, 3, dtv.fileStamp, "[2021-08m-15][02h-05m]"

  set dtv = (new DTSValue)("2021-08-15 02:05:04", nothing)  
    dtv.ms = 1  : eqCompare deep, 1, dtv.timeStamp, "02:05:04.001"
    dtv.ms = 10 : eqCompare deep, 2, dtv.timeStamp, "02:05:04.010"
    dtv.ms = 100: eqCompare deep, 3, dtv.timeStamp, "02:05:04.100"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.outStamps: output"
    WScript.Quit 1
  end if
end sub

main()
