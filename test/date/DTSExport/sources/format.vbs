
'--- local/hybrids                                 [test][DTSExport][format.vbs]
'[2024-08-29][19:00:00] 005 Kartonagnick    
'  --- CastleOfDreams/vbs                               [test][date][export.vbs]
'  [2021-09-06][19:00:00] 004 Kartonagnick
'  [2021-08-27][18:00:00] 003 Kartonagnick
'  [2021-08-24][18:00:00] 002 Kartonagnick
'  [2021-08-20][18:00:00] 001 Kartonagnick

dim deep: deep = 0
dim obj, ext

sub main()

'--- typical
  set obj = new DTSExport
  obj.format = "YY"                   :  eqCompare deep, 1, obj.format, "YY"
  obj.format = "YY/MM"                :  eqCompare deep, 2, obj.format, "YY/MM"
  obj.format = "YY/MM-DD"             :  eqCompare deep, 3, obj.format, "YY/MM-DD"
  obj.format = "hh YY/MM-DD mm[ss]"   :  eqCompare deep, 4, obj.format, "hh YY/MM-DD mm[ss]"
  obj.format = "hh YY/MM-DD mm[ss].ms":  eqCompare deep, 5, obj.format, "hh YY/MM-DD mm[ss].ms"
  obj.format = "hh:mm:ss.ms YY|MM|DD" :  eqCompare deep, 6, obj.format, "hh:mm:ss.ms YY|MM|DD"

'--- other DTSImport
  set ext = new DTSExport             : eqCompare deep, 7, ext.format, "YY-MM-DD hh:mm:ss.ms"
  set ext.format = obj                : eqCompare deep, 8, ext.format, "hh:mm:ss.ms YY|MM|DD"

'--- Null/Nothing/empty
  set obj = new DTSExport: obj.format = Null   : eqCompare deep,  9, obj.format, "YY-MM-DD hh:mm:ss.ms"
  set obj = new DTSExport: obj.format = Nothing: eqCompare deep, 10, obj.format, "YY-MM-DD hh:mm:ss.ms"
  set obj = new DTSExport: obj.format = Empty  : eqCompare deep, 11, obj.format, "YY-MM-DD hh:mm:ss.ms"

'---  dublicate token
  obj.format = "YY-MM-DD DD"      : eqCompare deep, 12, obj.format, "YY-MM-DD DD"
  obj.format = "YY-MM-DD TT hh"   : eqCompare deep, 13, obj.format, "YY-MM-DD hh:mm:ss.ms hh"
  obj.format = "YY-MM-DD TIME ss" : eqCompare deep, 14, obj.format, "YY-MM-DD hh:mm:ss ss"
  obj.format = "YY-MM-YY-DD"      : eqCompare deep, 15, obj.format, "YY-MM-YY-DD"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSExport.format"
    WScript.Quit 1
  end if
end sub

main()
