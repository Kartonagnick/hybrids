
'--- local/hybrids                                   [test][DTSValue][clone.vbs]
'[2024-08-08][19:00:00] 001 Kartonagnick PRE
'  --- CastleOfDreams/hybrids                        [test][DTSValue][clone.vbs]
'  [2022-03-16][19:00:00] 001 Kartonagnick

dim deep: deep = 0
dim dtv, d1, d2, dtv1, dtv2

sub main()
  d1 = #1970-01-01 00:00:05#
  d2 = #1970-01-02 02:03:30#
  set dtv1 = (new DTSValue)(d1, 123)
  set dtv2 = dtv1.clone()

  eqCompare deep, 1, dtv1.date, d1
  eqCompare deep, 2, dtv2.date, d1

  dtv2.date = d2

  eqCompare deep, 3, dtv1.date, d1
  eqCompare deep, 4, dtv2.date, d2

  if not gMY_TEST then
    echo deep, "[ERROR] DTSValue.clone = #time#"
    WScript.Quit 1
  end if
end sub

main()
