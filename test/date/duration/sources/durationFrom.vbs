
'--- local/hybrids                                       [date/durationFrom.vbs]
'[2024-09-20][19:00:00] 001 Kartonagnick    
'  --- CastleOfDreams/vbs                                  [date/periodFrom.vbs]
'  [2021-07-30][23:30:00] 001 Kartonagnick

dim deep: deep = 0

sub test(id, ms, sec, min, hours, days, etalon)
  dim result, dhm, sms, source
  result = durationFrom(ms, sec, min, hours, days)
  if result <> etalon then
    dhm = days & " days, " & hours & " hours, " & min & " min"
    sms = sec & " sec, " & ms & " ms" 
    source = dhm & ", " & sms
    echo deep, "[" & id & "][ERROR] source: " & source
    echo deep, "[" & id & "][ERROR] etalon: " & etalon
    echo deep, "[" & id & "][ERROR] result: " & result
    gMY_TEST = false
  end if
end sub

sub main()

  test 1,   1,  2,  3,  4,  5,  "5 days, 4 hours, 3 min, 2 sec, 1 ms"
  test 2,  10, 20, 30, 40, 50,  "50 days, 40 hours, 30 min, 20 sec, 10 ms"
  test 3,  10, 20, 30, 40,  0,  "40 hours, 30 min, 20 sec, 10 ms"
  test 4,  10, 20, 30,  0, 50,  "50 days, 30 min, 20 sec, 10 ms"
  test 5,  10, 20,  0, 40, 50,  "50 days, 40 hours, 20 sec, 10 ms"
  test 6,  10, 20, 30, 40,  0,  "40 hours, 30 min, 20 sec, 10 ms"
  test 7,   0, 20, 30, 40, 50,  "50 days, 40 hours, 30 min, 20 sec"
  test 8,  10,  0, 30,  0,  0,  "30 min, 10 ms"
  test 9,   0,  0,  0,  0,  0,  ""

  if not gMY_TEST then
    echo deep, "[ERROR] durationFrom"
    WScript.Quit 1
  end if
end sub

main()
