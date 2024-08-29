
'--- local/hybrids                                 [test][DTSImport][format.vbs]
'[2024-08-29][19:00:00] 005 Kartonagnick    
'  --- CastleOfDreams/vbs                               [test][date][import.vbs]
'  [2021-09-06][19:00:00] 004 Kartonagnick
'  [2021-08-28][18:00:00] 003 Kartonagnick
'  [2021-08-23][18:00:00] 002 Kartonagnick
'  [2021-08-19][18:00:00] 001 Kartonagnick

sub main()
  dim obj, ext, deep: deep = 0

'--- typical
  set obj = new DTSImport
  obj.format = "YY"                   :  eq_compare deep, 1, obj.format, "YY"
  obj.format = "YY/MM"                :  eq_compare deep, 2, obj.format, "YY/MM"
  obj.format = "YY/MM-DD"             :  eq_compare deep, 3, obj.format, "YY/MM-DD"
  obj.format = "hh YY/MM-DD mm[ss]"   :  eq_compare deep, 4, obj.format, "hh YY/MM-DD mm[ss]"
  obj.format = "hh YY/MM-DD mm[ss].ms":  eq_compare deep, 5, obj.format, "hh YY/MM-DD mm[ss].ms"
  obj.format = "hh:mm:ss.ms YY|MM|DD" :  eq_compare deep, 6, obj.format, "hh:mm:ss.ms YY|MM|DD"

'--- other DTSImport
  set ext = new DTSImport             : eq_compare deep, 7, ext.format, "YY-MM-DD hh:mm:ss.ms"
  set ext.format = obj                : eq_compare deep, 8, ext.format, "hh:mm:ss.ms YY|MM|DD"

'--- Null/Nothing/empty
  set obj = new DTSImport: obj.format = Null   : eq_compare deep,  9, obj.format, "YY-MM-DD hh:mm:ss.ms"
  set obj = new DTSImport: obj.format = Nothing: eq_compare deep, 10, obj.format, "YY-MM-DD hh:mm:ss.ms"
  set obj = new DTSImport: obj.format = Empty  : eq_compare deep, 11, obj.format, "YY-MM-DD hh:mm:ss.ms"

  if not gMY_TEST = true then
    echo deep, "[ERROR] DTSImport.format"
    WScript.Quit 1
  end if
end sub

main()
