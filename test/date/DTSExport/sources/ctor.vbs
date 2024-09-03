
'--- local/hybrids                                   [test][DTSExport][ctor.vbs]
'[2024-08-29][19:00:00] 005 Kartonagnick    
'  --- CastleOfDreams/vbs                               [test][date][export.vbs]
'  [2021-09-06][19:00:00] 004 Kartonagnick
'  [2021-08-27][18:00:00] 003 Kartonagnick
'  [2021-08-24][18:00:00] 002 Kartonagnick
'  [2021-08-20][18:00:00] 001 Kartonagnick

sub main()
  dim obj, ext, deep: deep = 0

'--- default
  set obj = new DTSExport                           : eq_compare deep,  1, obj.format, "YY-MM-DD hh:mm:ss.ms"
'--- construct
  set obj = (new DTSExport)("")                     : eq_compare deep,  2, obj.format, "YY-MM-DD hh:mm:ss.ms"
  set obj = (new DTSExport)(" ")                    : eq_compare deep,  3, obj.format, "YY-MM-DD hh:mm:ss.ms"
  set obj = (new DTSExport)("YY")                   : eq_compare deep,  4, obj.format, "YY"
  set obj = (new DTSExport)("YY YY")                : eq_compare deep,  5, obj.format, "YY YY"
  set obj = (new DTSExport)("YY YY hh:hh")          : eq_compare deep,  6, obj.format, "YY YY hh:hh"

  set obj = (new DTSExport)("YY/MM")                : eq_compare deep,  7, obj.format, "YY/MM"
  set obj = (new DTSExport)("YY/MM-DD")             : eq_compare deep,  8, obj.format, "YY/MM-DD"
  set obj = (new DTSExport)("hh YY/MM-DD mm[ss]")   : eq_compare deep,  9, obj.format, "hh YY/MM-DD mm[ss]"
  set obj = (new DTSExport)("hh YY/MM-DD mm[ss].ms"): eq_compare deep, 10, obj.format, "hh YY/MM-DD mm[ss].ms"
  set obj = (new DTSExport)("hh:mm:ss.ms YY|MM|DD") : eq_compare deep, 11, obj.format, "hh:mm:ss.ms YY|MM|DD"
  set ext = (new DTSExport)(obj)                    : eq_compare deep, 12, ext.format, "hh:mm:ss.ms YY|MM|DD"

  set obj = (new DTSExport)("TIME")                 : eq_compare deep, 13, obj.format, "hh:mm:ss"
  set obj = (new DTSExport)("hms")                  : eq_compare deep, 14, obj.format, "hh:mm:ss"
  set obj = (new DTSExport)("TT")                   : eq_compare deep, 15, obj.format, "hh:mm:ss.ms"
'--- construct
  set obj = (new DTSExport)(nothing)                : eq_compare deep, 16, obj.format, "YY-MM-DD hh:mm:ss.ms"
  set obj = (new DTSExport)(Null)                   : eq_compare deep, 17, obj.format, "YY-MM-DD hh:mm:ss.ms"
  set obj = (new DTSExport)(Empty)                  : eq_compare deep, 18, obj.format, "YY-MM-DD hh:mm:ss.ms"

  if not gMY_TEST = true then
    echo deep, "[ERROR] DTSExport.ctor"
    WScript.Quit 1
  end if
end sub

main()
