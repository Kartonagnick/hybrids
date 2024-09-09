
'--- local/hybrids                              [test][DTStamp][ctor.import.vbs]
'[2024-09-09][19:00:00] 001 Kartonagnick    

sub main()
  dim obj, import, deep: deep = 0

  set import = (new DTSImport)("YY hh")
  set obj = (new DTStamp)(import)
  obj.date = 0

  eqCompare deep,  1, import.format, "YY hh"
 neqCompare deep,  2, import.format, "YY-MM-DD hh:mm:ss.ms"
  eqCompare deep,  3, obj.import   , import.format
  eqCompare deep,  4, obj.stamp    , "1970-01-01 00:00:00.000"
 neqCompare deep,  5, obj.stamp    , "1970-01-01 00:00:00.001"

  obj.date = "2000 12"

  eqCompare deep,  6, obj.stamp    , "2000-01-01 12:00:00.000"
 neqCompare deep,  7, obj.stamp    , "1970-01-01 00:00:00.001"

  obj.import = "MM mm"
  eqCompare deep,  8, obj.import   , "MM mm"
 neqCompare deep,  9, import.format, "YY-MM-DD hh:mm:ss.ms"
  eqCompare deep, 10, import.format, "YY hh"

  if not gMY_TEST then
    echo deep, "[ERROR] DTStamp: import"
    WScript.Quit 1
  end if
end sub

main()
