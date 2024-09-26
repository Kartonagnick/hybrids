
'--- local/hybrids                                 [test][date\elapsed][main.vbs]
'[2024-09-26][19:00:00] 001 Kartonagnick    

const SECONDS_IN_WEEK   = 604800
const SECONDS_IN_DAY    = 86400
const SECONDS_IN_HOUR   = 3600
const SECONDS_IN_MINUTE = 60
dim mark, etalon, result, sec
dim deep: deep = 0

sub example
  set mark = new Elapsed
  WScript.sleep 1333 'ms
  echo deep, "delay = " & mark.value() & " (expected: 1 sec 333 ms)"
end sub

sub test(id, ww, dd, hh, mm, ss, ms, etalon)
  ww = ww*SECONDS_IN_WEEK
  dd = dd*SECONDS_IN_DAY
  hh = hh*SECONDS_IN_HOUR
  mm = mm*SECONDS_IN_MINUTE
  ms = CDbl(ms)/1000.0
  sec = ww + dd + hh + mm + ss + ms
  set mark = new Elapsed
  result = mark.description(sec)
  eqCompare deep, id, etalon, result
end sub

sub main()

 'example

  test 1, 1,1,1,1,1,1  , "1 week 1 day 1 hour 1 min 1 sec 1 ms"
  test 2, 2,2,2,2,2,2  , "2 weeks 2 days 2 hours 2 min 2 sec 2 ms"
  test 3, 0,0,2,0,2,0  , "2 hours 2 sec"
  test 4, 2,0,2,0,2,0  , "2 weeks 2 hours 2 sec"
  test 4, 2,0,2,0,2,123, "2 weeks 2 hours 2 sec 123 ms"

  if not gMY_TEST then
    echo deep, "[ERROR] date\elapsed"
    WScript.Quit 1
  end if
end sub

main()
