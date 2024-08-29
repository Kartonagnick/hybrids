
'--- local/hybrids                                   [test][DTSImport][ctor.vbs]
'[2024-08-29][19:00:00] 005 Kartonagnick    
'  --- CastleOfDreams/vbs                               [test][date][import.vbs]
'  [2021-09-06][19:00:00] 004 Kartonagnick
'  [2021-08-28][18:00:00] 003 Kartonagnick
'  [2021-08-23][18:00:00] 002 Kartonagnick
'  [2021-08-19][18:00:00] 001 Kartonagnick

dim deep: deep = 0
dim obj, ext

sub main()

'--- default
  set obj = new DTSImport                           : eqCompare deep,  1, obj.format, "YY-MM-DD hh:mm:ss.ms"
'--- construct
  set obj = (new DTSImport)("")                     : eqCompare deep,  2, obj.format, "YY-MM-DD hh:mm:ss.ms"
  set obj = (new DTSImport)("YY")                   : eqCompare deep,  3, obj.format, "YY"
  set obj = (new DTSImport)("YY/MM")                : eqCompare deep,  4, obj.format, "YY/MM"
  set obj = (new DTSImport)("YY/MM-DD")             : eqCompare deep,  5, obj.format, "YY/MM-DD"
  set obj = (new DTSImport)("hh YY/MM-DD mm[ss]")   : eqCompare deep,  6, obj.format, "hh YY/MM-DD mm[ss]"
  set obj = (new DTSImport)("hh YY/MM-DD mm[ss].ms"): eqCompare deep,  7, obj.format, "hh YY/MM-DD mm[ss].ms"
  set obj = (new DTSImport)("hh:mm:ss.ms YY|MM|DD") : eqCompare deep,  8, obj.format, "hh:mm:ss.ms YY|MM|DD"
  set ext = (new DTSImport)(obj)                    : eqCompare deep,  9, ext.format, "hh:mm:ss.ms YY|MM|DD"
'--- construct
  set obj = (new DTSImport)(Nothing)                : eqCompare deep, 11, obj.format, "YY-MM-DD hh:mm:ss.ms"
  set obj = (new DTSImport)(Empty)                  : eqCompare deep, 12, obj.format, "YY-MM-DD hh:mm:ss.ms"
  set obj = (new DTSImport)(Null)                   : eqCompare deep, 10, obj.format, "YY-MM-DD hh:mm:ss.ms"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSImport.ctor"
    WScript.Quit 1
  end if
end sub

main()
