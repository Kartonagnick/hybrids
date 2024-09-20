
'--- local/hybrids                                     [date/durationFromMS.vbs]
'[2024-09-20][19:00:00] 001 Kartonagnick PRE
'  --- CastleOfDreams/vbs                              [date/durationFromMS.vbs]
'  [2021-07-30][23:30:00] 001 Kartonagnick

dim deep: deep = 0

sub check(id, source, result, etalon)
  if result <> etalon then
    echo deep, "[" & id & "][ERROR] ms     : " & source
    echo deep, "[" & id & "][ERROR] etalon : " & etalon
    echo deep, "[" & id & "][ERROR] result : " & result
    gMY_TEST = false
  end if
end sub

sub test1(id, sec, etalon)
  dim result: result = durationFromMS(sec * 1000)
  check sec * 1000, result, etalon
end sub

sub test2(id, sec, etalon)
  dim result: result = durationFromMS(sec * 1000 + 123)
  check sec * 1000 + 123, result, etalon
end sub

sub main()

  test1  1,       0, "0 sec"
  test1  2,       1, "1 sec"
  test1  3,       9, "9 sec"
  test1  4,      10, "10 sec"
  test1  5,      59, "59 sec"
  test1  6,      60, "1 min"
  test1  7,      61, "1 min, 1 sec"
  test1  8,      62, "1 min, 2 sec"
  test1  9,     119, "1 min, 59 sec"
  test1 10,     120, "2 min"
  test1 11,     121, "2 min, 1 sec"
  test1 12,     131, "2 min, 11 sec"
  test1 13,     179, "2 min, 59 sec"
  test1 14,     180, "3 min"
  test1 15,    1800, "30 min"
  test1 16,    1801, "30 min, 1 sec"
  test1 17,    1861, "31 min, 1 sec"
  test1 18,    3599, "59 min, 59 sec"
  test1 19,    3600, "1 hour"
  test1 20,    3601, "1 hour, 1 sec"
  test1 21,    3661, "1 hour, 1 min, 1 sec"
  test1 22,    3961, "1 hour, 6 min, 1 sec"
  test1 23,    7199, "1 hour, 59 min, 59 sec"
  test1 24,    7200, "2 hours"
  test1 25,    7201, "2 hours, 1 sec"
  test1 26,    7261, "2 hours, 1 min, 1 sec"
  test1 27,   86399, "23 hours, 59 min, 59 sec"
  test1 28,   86400, "1 day"
  test1 29,   86401, "1 day, 1 sec"
  test1 30,   86461, "1 day, 1 min, 1 sec"
  test1 31,   90061, "1 day, 1 hour, 1 min, 1 sec"
  test1 32, 2678399, "30 days, 23 hours, 59 min, 59 sec"
  test1 33, 5270399, "60 days, 23 hours, 59 min, 59 sec"
  
  test2 34,       0, "0 sec, 123 ms"
  test2 35,       1, "1 sec, 123 ms"
  test2 36,       9, "9 sec, 123 ms"
  test2 37,      10, "10 sec, 123 ms"
  test2 38,      59, "59 sec, 123 ms"
  test2 39,      60, "1 min, 123 ms"
  test2 40,      61, "1 min, 1 sec, 123 ms"
  test2 41,      62, "1 min, 2 sec, 123 ms"
  test2 42,     119, "1 min, 59 sec, 123 ms"
  test2 43,     120, "2 min, 123 ms"
  test2 44,     121, "2 min, 1 sec, 123 ms"
  test2 45,     131, "2 min, 11 sec, 123 ms"
  test2 46,     179, "2 min, 59 sec, 123 ms"
  test2 47,     180, "3 min, 123 ms"
  test2 48,    1800, "30 min, 123 ms"
  test2 49,    1801, "30 min, 1 sec, 123 ms"
  test2 50,    1861, "31 min, 1 sec, 123 ms"
  test2 51,    3599, "59 min, 59 sec, 123 ms"
  test2 52,    3600, "1 hour, 123 ms"
  test2 53,    3601, "1 hour, 1 sec, 123 ms"
  test2 54,    3661, "1 hour, 1 min, 1 sec, 123 ms"
  test2 55,    3961, "1 hour, 6 min, 1 sec, 123 ms"
  test2 56,    7199, "1 hour, 59 min, 59 sec, 123 ms"
  test2 57,    7200, "2 hours, 123 ms"
  test2 58,    7201, "2 hours, 1 sec, 123 ms"
  test2 59,    7261, "2 hours, 1 min, 1 sec, 123 ms"
  test2 60,   86399, "23 hours, 59 min, 59 sec, 123 ms"
  test2 61,   86400, "1 day, 123 ms"
  test2 62,   86401, "1 day, 1 sec, 123 ms"
  test2 63,   86461, "1 day, 1 min, 1 sec, 123 ms"
  test2 64,   90061, "1 day, 1 hour, 1 min, 1 sec, 123 ms"
  test2 65, 2678399, "30 days, 23 hours, 59 min, 59 sec, 123 ms"
  test2 66, 5270399, "60 days, 23 hours, 59 min, 59 sec, 123 ms"

  if not gMY_TEST then
    echo deep, "[ERROR] durationFromMS"
    WScript.Quit 1
  end if
end sub

'============================================================================
'============================================================================

