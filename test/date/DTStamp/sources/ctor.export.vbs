
'--- local/hybrids                              [test][DTStamp][ctor.export.vbs]
'[2024-09-09][19:00:00] 001 Kartonagnick    

sub main()
  dim obj, export, deep: deep = 0

  set export = (new DTSExport)("YY hh")
  set obj = (new DTStamp)(export)

  eq_compare deep, 1, export.format, "YY hh"
 neq_compare deep, 2, export.format, "YY-MM-DD hh:mm:ss.ms"
  eq_compare deep, 3, obj.export   ,  export.format

  obj.export = "MM mm"

  eq_compare deep, 4, obj.export   , "MM mm"
 neq_compare deep, 5, obj.export   , "YY-MM-DD hh:mm:ss.ms"

  eq_compare deep, 6, export.format, "YY hh"
 neq_compare deep, 7, export.format, "YY-MM-DD hh:mm:ss.ms"

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] DTStamp: export"
  else
    echo deep, "[ERROR] DTStamp: export"
    WScript.Quit 1
  end if
end sub

main()
