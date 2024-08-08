
'--- local/hybrids                                   [test][DTSValue][clone.vbs]
'[2024-08-08][19:00:00] 001 Kartonagnick    
'  --- CastleOfDreams/hybrids                        [test][DTSValue][clone.vbs]
'  [2022-03-16][19:00:00] 001 Kartonagnick

sub main()
  dim deep: deep = 0: dim dtv

  dim d1: d1 = #1970-01-01 00:00:05#
  dim d2: d2 = #1970-01-02 02:03:30#
  dim dtv1: set dtv1 = (new DTSValue)(d1, 123)
  dim dtv2: set dtv2 = dtv1.clone()

  eq_compare deep, 1, dtv1.date, d1
  eq_compare deep, 2, dtv2.date, d1

  dtv2.date = d2

  eq_compare deep, 3, dtv1.date, d1
  eq_compare deep, 4, dtv2.date, d2

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] DTSValue.clone = #time#"
  else
    echo deep, "[ERROR] DTSValue.clone = #time#"
    WScript.Quit 1
  end if
end sub

main()
