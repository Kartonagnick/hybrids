
'--- local/hybrids                                 [test][DTSImport][format.vbs]
'[2024-08-29][19:00:00] 005 Kartonagnick    
'  --- CastleOfDreams/vbs                               [test][date][import.vbs]
'  [2021-09-06][19:00:00] 004 Kartonagnick
'  [2021-08-28][18:00:00] 003 Kartonagnick
'  [2021-08-23][18:00:00] 002 Kartonagnick
'  [2021-08-19][18:00:00] 001 Kartonagnick

dim deep: deep = 0
dim obj, ext

sub main()

'--- typical
  set obj = new DTSImport
  obj.format = "YY"                   :  eqCompare deep, 1, obj.format, "YY"
  obj.format = "YY/MM"                :  eqCompare deep, 2, obj.format, "YY/MM"
  obj.format = "YY/MM-DD"             :  eqCompare deep, 3, obj.format, "YY/MM-DD"
  obj.format = "hh YY/MM-DD mm[ss]"   :  eqCompare deep, 4, obj.format, "hh YY/MM-DD mm[ss]"
  obj.format = "hh YY/MM-DD mm[ss].ms":  eqCompare deep, 5, obj.format, "hh YY/MM-DD mm[ss].ms"
  obj.format = "hh:mm:ss.ms YY|MM|DD" :  eqCompare deep, 6, obj.format, "hh:mm:ss.ms YY|MM|DD"

'--- other DTSImport
  set ext = new DTSImport             : eqCompare deep, 7, ext.format, "YY-MM-DD hh:mm:ss.ms"
  set ext.format = obj                : eqCompare deep, 8, ext.format, "hh:mm:ss.ms YY|MM|DD"

'--- Null/Nothing/empty
  set obj = new DTSImport: obj.format = Null   : eqCompare deep,  9, obj.format, "YY-MM-DD hh:mm:ss.ms"
  set obj = new DTSImport: obj.format = Nothing: eqCompare deep, 10, obj.format, "YY-MM-DD hh:mm:ss.ms"
  set obj = new DTSImport: obj.format = Empty  : eqCompare deep, 11, obj.format, "YY-MM-DD hh:mm:ss.ms"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSImport.format"
    WScript.Quit 1
  end if
end sub

main()
