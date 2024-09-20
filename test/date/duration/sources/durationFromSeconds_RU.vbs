
'--- local/hybrids                             [date/durationFromSeconds_RU.vbs]
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

  test  1,       0, "0 сек"
  test  2,       1, "1 сек"
  test  3,       9, "9 сек"
  test  4,      10, "10 сек"
  test  5,      59, "59 сек"
  test  6,      60, "1 мин"
  test  7,      61, "1 мин, 1 сек"
  test  8,      62, "1 мин, 2 сек"
  test  9,     119, "1 мин, 59 сек"
  test 10,     120, "2 мин"
  test 11,     121, "2 мин, 1 сек"
  test 12,     131, "2 мин, 11 сек"
  test 13,     179, "2 мин, 59 сек"
  test 14,     180, "3 мин"
  test 15,    1800, "30 мин"
  test 16,    1801, "30 мин, 1 сек"
  test 17,    1861, "31 мин, 1 сек"
  test 18,    3599, "59 мин, 59 сек"
  test 19,    3600, "1 час"
  test 20,    3601, "1 час, 1 сек"
  test 21,    3661, "1 час, 1 мин, 1 сек"
  test 22,    3961, "1 час, 6 мин, 1 сек"
  test 23,    7199, "1 час, 59 мин, 59 сек"
  test 24,    7200, "2 часа"
  test 25,    7201, "2 часа, 1 сек"
  test 26,    7261, "2 часа, 1 мин, 1 сек"
  test 27,   86399, "23 часа, 59 мин, 59 сек"
  test 28,   86400, "1 день"
  test 29,   86401, "1 день, 1 сек"
  test 30,   86461, "1 день, 1 мин, 1 сек"
  test 31,   90061, "1 день, 1 час, 1 мин, 1 сек"
  test 32, 2678399, "30 дней, 23 часа, 59 мин, 59 сек"
  test 33, 5270399, "60 дней, 23 часа, 59 мин, 59 сек"

  if not gMY_TEST then
    echo deep, "[ERROR] durationFromSeconds"
    WScript.Quit 1
  end if
end sub

'============================================================================
'============================================================================

