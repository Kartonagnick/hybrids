
'--- local/hybrids                                   [test][DTSExport][ctor.vbs]
'[2024-08-29][19:00:00] 005 Kartonagnick PRE
'  --- CastleOfDreams/vbs                               [test][date][export.vbs]
'  [2021-09-06][19:00:00] 004 Kartonagnick
'  [2021-08-27][18:00:00] 003 Kartonagnick
'  [2021-08-24][18:00:00] 002 Kartonagnick
'  [2021-08-20][18:00:00] 001 Kartonagnick

dim deep: deep = 0
dim obj, ext

sub main()

'--- default
  set obj = new DTSExport                           : eqCompare deep,  1, obj.format, "YY-MM-DD hh:mm:ss.ms"
  
'--- construct
  set obj = (new DTSExport)("")                     : eqCompare deep,  2, obj.format, "YY-MM-DD hh:mm:ss.ms"
  set obj = (new DTSExport)(" ")                    : eqCompare deep,  3, obj.format, "YY-MM-DD hh:mm:ss.ms"
  set obj = (new DTSExport)("YY")                   : eqCompare deep,  4, obj.format, "YY"
  set obj = (new DTSExport)("YY YY")                : eqCompare deep,  5, obj.format, "YY YY"
  set obj = (new DTSExport)("YY YY hh:hh")          : eqCompare deep,  6, obj.format, "YY YY hh:hh"

  set obj = (new DTSExport)("YY/MM")                : eqCompare deep,  7, obj.format, "YY/MM"
  set obj = (new DTSExport)("YY/MM-DD")             : eqCompare deep,  8, obj.format, "YY/MM-DD"
  set obj = (new DTSExport)("hh YY/MM-DD mm[ss]")   : eqCompare deep,  9, obj.format, "hh YY/MM-DD mm[ss]"
  set obj = (new DTSExport)("hh YY/MM-DD mm[ss].ms"): eqCompare deep, 10, obj.format, "hh YY/MM-DD mm[ss].ms"
  set obj = (new DTSExport)("hh:mm:ss.ms YY|MM|DD") : eqCompare deep, 11, obj.format, "hh:mm:ss.ms YY|MM|DD"
  set ext = (new DTSExport)(obj)                    : eqCompare deep, 12, ext.format, "hh:mm:ss.ms YY|MM|DD"

  set obj = (new DTSExport)("TIME")                 : eqCompare deep, 13, obj.format, "hh:mm:ss"
  set obj = (new DTSExport)("hms")                  : eqCompare deep, 14, obj.format, "hh:mm:ss"
  set obj = (new DTSExport)("TT")                   : eqCompare deep, 15, obj.format, "hh:mm:ss.ms"
  
'--- construct
  set obj = (new DTSExport)(nothing)                : eqCompare deep, 16, obj.format, "YY-MM-DD hh:mm:ss.ms"
  set obj = (new DTSExport)(Null)                   : eqCompare deep, 17, obj.format, "YY-MM-DD hh:mm:ss.ms"
  set obj = (new DTSExport)(Empty)                  : eqCompare deep, 18, obj.format, "YY-MM-DD hh:mm:ss.ms"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSExport.ctor"
    WScript.Quit 1
  end if
end sub

main()
