
'--- local/hybrids                              [test][DTSValue][date.posix.vbs]
'[2024-08-14][19:00:00] 001 Kartonagnick    
'  --- CastleOfDreams/hybrids                   [test][DTSValue][data.posix.vbs]
'  [2022-03-16][19:00:00] 001 Kartonagnick

dim deep: deep = 0
dim dtv

sub main()
  set dtv = new DTSValue
  dtv.date = 0
    eqCompare deep, 1, dtv.date, #01/01/1970 00:00:00#
    eqCompare deep, 2, dtv.date, #01/01/1970#
    eqCompare deep, 3, dtv.ms, "000"

  set dtv = new DTSValue
  dtv.date = 3
    eqCompare deep, 4, dtv.date, #01/01/1970 00:00:03#
    eqCompare deep, 5, dtv.ms, "000"

  set dtv = new DTSValue
  dtv.date = 33
    eqCompare deep, 6, dtv.date, #01/01/1970 00:00:33#
    eqCompare deep, 7, dtv.ms, "000"

  set dtv = new DTSValue
  dtv.date = 65
    eqCompare deep, 8, dtv.date, #01/01/1970 00:01:05#
    eqCompare deep, 9, dtv.ms, "000"
  
  set dtv = (new DTSValue)(3665, 1)  
  dtv.date = 3665
    eqCompare deep, 10, dtv.date, #1970-01-01 01:01:05#
    eqCompare deep, 11, dtv.ms, "000"
  
  set dtv = (new DTSValue)(90065, 1)  
  dtv.date = 90065
    eqCompare deep, 12, dtv.date, #1970-01-02 01:01:05#
    eqCompare deep, 13, dtv.ms, "000"
  
  set dtv = (new DTSValue)(-1, 0)  
  dtv.date = -1
    eqCompare deep, 14, dtv.date, #1969-12-31 23:59:59#
    eqCompare deep, 15, dtv.ms, "000"
  
  set dtv = (new DTSValue)(-2, 0)  
  dtv.date = -2
    eqCompare deep, 16, dtv.date, #1969-12-31 23:59:58#
    eqCompare deep, 17, dtv.ms, "000"
  
  set dtv = new DTSValue
  dtv.date = "1"
    eqCompare deep, 20, dtv.date, #1970-01-01 00:00:01#
    eqCompare deep, 21, dtv.ms, "000"

  set dtv = (new DTSValue)(90065, 1)  
  dtv.date = "90065"
    eqCompare deep, 12, dtv.date, #1970-01-02 01:01:05#
    eqCompare deep, 13, dtv.ms, "000"

 'reset milliseconds
  set dtv = (new DTSValue)(12, 123)
  dtv.date = "1"
    eqCompare deep, 22, dtv.date, #1970-01-01 00:00:01#
    eqCompare deep, 23, dtv.ms, "000"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.Date = posix"
    WScript.Quit 1
  end if
end sub

main()
