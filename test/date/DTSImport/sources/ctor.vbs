
'--- local/hybrids                                   [test][DTSImport][ctor.vbs]
'[2024-08-29][19:00:00] 005 Kartonagnick PRE
'  --- CastleOfDreams/vbs                               [test][date][import.vbs]
'  [2021-09-06][19:00:00] 004 Kartonagnick
'  [2021-08-28][18:00:00] 003 Kartonagnick
'  [2021-08-23][18:00:00] 002 Kartonagnick
'  [2021-08-19][18:00:00] 001 Kartonagnick

sub main()
  dim obj, ext, deep: deep = 0

'--- default
  set obj = new DTSImport                           : eq_compare deep,  1, obj.format, "YY-MM-DD hh:mm:ss.ms"
'--- construct
  set obj = (new DTSImport)("")                     : eq_compare deep,  2, obj.format, "YY-MM-DD hh:mm:ss.ms"
  set obj = (new DTSImport)("YY")                   : eq_compare deep,  3, obj.format, "YY"
  set obj = (new DTSImport)("YY/MM")                : eq_compare deep,  4, obj.format, "YY/MM"
  set obj = (new DTSImport)("YY/MM-DD")             : eq_compare deep,  5, obj.format, "YY/MM-DD"
  set obj = (new DTSImport)("hh YY/MM-DD mm[ss]")   : eq_compare deep,  6, obj.format, "hh YY/MM-DD mm[ss]"
  set obj = (new DTSImport)("hh YY/MM-DD mm[ss].ms"): eq_compare deep,  7, obj.format, "hh YY/MM-DD mm[ss].ms"
  set obj = (new DTSImport)("hh:mm:ss.ms YY|MM|DD") : eq_compare deep,  8, obj.format, "hh:mm:ss.ms YY|MM|DD"
  set ext = (new DTSImport)(obj)                    : eq_compare deep,  9, ext.format, "hh:mm:ss.ms YY|MM|DD"
'--- construct
  set obj = (new DTSImport)(Nothing)                : eq_compare deep, 11, obj.format, "YY-MM-DD hh:mm:ss.ms"
  set obj = (new DTSImport)(Empty)                  : eq_compare deep, 12, obj.format, "YY-MM-DD hh:mm:ss.ms"
  set obj = (new DTSImport)(Null)                   : eq_compare deep, 10, obj.format, "YY-MM-DD hh:mm:ss.ms"

  if not gMY_TEST = true then
    echo deep, "[ERROR] DTSImport.ctor"
    WScript.Quit 1
  end if
end sub

main()
