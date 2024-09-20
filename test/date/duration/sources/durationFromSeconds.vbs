
'--- local/hybrids                                [date/durationFromSeconds.vbs]
'[2024-09-20][19:00:00] 001 Kartonagnick    
'  --- CastleOfDreams/vbs                         [date/durationFromSeconds.vbs]
'  [2021-07-30][23:30:00] 001 Kartonagnick

dim deep: deep = 0

sub test(id, sec, etalon)
  dim result: result = durationFromSeconds(sec)
  if result <> etalon then
    echo deep, "[" & id & "][ERROR] seconds: " & sec
    echo deep, "[" & id & "][ERROR] etalon : " & etalon
    echo deep, "[" & id & "][ERROR] result : " & result
    gMY_TEST = false
  end if
end sub

sub main()

  test  1,       0, "0 sec"
  test  2,       1, "1 sec"
  test  3,       9, "9 sec"
  test  4,      10, "10 sec"
  test  5,      59, "59 sec"
  test  6,      60, "1 min"
  test  7,      61, "1 min, 1 sec"
  test  8,      62, "1 min, 2 sec"
  test  9,     119, "1 min, 59 sec"
  test 10,     120, "2 min"
  test 11,     121, "2 min, 1 sec"
  test 12,     131, "2 min, 11 sec"
  test 13,     179, "2 min, 59 sec"
  test 14,     180, "3 min"
  test 15,    1800, "30 min"
  test 16,    1801, "30 min, 1 sec"
  test 17,    1861, "31 min, 1 sec"
  test 18,    3599, "59 min, 59 sec"
  test 19,    3600, "1 hour"
  test 20,    3601, "1 hour, 1 sec"
  test 21,    3661, "1 hour, 1 min, 1 sec"
  test 22,    3961, "1 hour, 6 min, 1 sec"
  test 23,    7199, "1 hour, 59 min, 59 sec"
  test 24,    7200, "2 hours"
  test 25,    7201, "2 hours, 1 sec"
  test 26,    7261, "2 hours, 1 min, 1 sec"
  test 27,   86399, "23 hours, 59 min, 59 sec"
  test 28,   86400, "1 day"
  test 29,   86401, "1 day, 1 sec"
  test 30,   86461, "1 day, 1 min, 1 sec"
  test 31,   90061, "1 day, 1 hour, 1 min, 1 sec"
  test 32, 2678399, "30 days, 23 hours, 59 min, 59 sec"
  test 33, 5270399, "60 days, 23 hours, 59 min, 59 sec"

  if not gMY_TEST then
    echo deep, "[ERROR] durationFromSeconds"
    WScript.Quit 1
  end if
end sub

'============================================================================
'============================================================================

