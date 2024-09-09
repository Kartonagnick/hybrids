
'--- local/hybrids                              [test][DTStamp][ctor.import.vbs]
'[2024-09-09][19:00:00] 001 Kartonagnick    

sub main()
  dim obj, import, deep: deep = 0

  set import = (new DTSImport)("YY hh")
  set obj = (new DTStamp)(import)
  obj.date = 0

  eq_compare deep,  1, import.format, "YY hh"
 neq_compare deep,  2, import.format, "YY-MM-DD hh:mm:ss.ms"
  eq_compare deep,  3, obj.import   , import.format
  eq_compare deep,  4, obj.stamp    , "1970-01-01 00:00:00.000"
 neq_compare deep,  5, obj.stamp    , "1970-01-01 00:00:00.001"

  obj.date = "2000 12"

  eq_compare deep,  6, obj.stamp    , "2000-01-01 12:00:00.000"
 neq_compare deep,  7, obj.stamp    , "1970-01-01 00:00:00.001"

  obj.import = "MM mm"
  eq_compare deep,  8, obj.import   , "MM mm"
 neq_compare deep,  9, import.format, "YY-MM-DD hh:mm:ss.ms"
  eq_compare deep, 10, import.format, "YY hh"

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] DTStamp: import"
  else
    echo deep, "[ERROR] DTStamp: import"
    WScript.Quit 1
  end if
end sub

main()
