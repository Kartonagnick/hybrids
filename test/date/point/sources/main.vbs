
'--- local/hybrids                                   [test][date\point][main.vbs]
'[2024-09-22][19:00:00] 001 Kartonagnick PRE

dim elapsed, deep: deep = 0

sub payload
  begTimePoint
  WScript.sleep 200 'ms
  elapsed = durationTimePointMS()
  echo deep, "elapsed: " & elapsed & " (expected: 200 ms)"
end sub

sub example
  begTimePoint
  WScript.sleep 300 'ms
  payload
  elapsed = durationTimePointMS()
  echo deep, "elapsed: " & elapsed & " (expected: 500 ms)"
end sub

sub main()
 'example
  if not gMY_TEST then
    echo deep, "[ERROR] date\point"
    WScript.Quit 1
  end if
end sub

main()
