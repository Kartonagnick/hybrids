
'--- local/hybrids                               [test][DTSValue][date.time.vbs]
'[2024-08-14][19:00:00] 001 Kartonagnick    
'  --- CastleOfDreams/hybrids                    [test][DTSValue][date.time.vbs]
'  [2022-03-16][19:00:00] 001 Kartonagnick

sub main()
  dim deep: deep = 0: dim dtv

  set dtv = (new DTSValue)(#23:45:23#, "1")  
  dtv.date = #12:35:59#
   neq_compare deep, 1, dtv.date, #01/01/1970 12:35:59#
    eq_compare deep, 2, dtv.date, #12:35:59#
    eq_compare deep, 3, dtv.ms, "000"

  set dtv = new DTSValue
  dtv.date = #00:00:00#
    eq_compare deep, 4, dtv.date, #00:00:00#
    eq_compare deep, 5, dtv.ms, "000"
   neq_compare deep, 6, dtv.date, #00:00:01#
   neq_compare deep, 7, dtv.ms, "5"

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] DTSValue.Date = #time#"
  else
    echo deep, "[ERROR] DTSValue.Date = #time#"
    WScript.Quit 1
  end if
end sub

main()
