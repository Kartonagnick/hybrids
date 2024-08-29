
'--- local/hybrids                                  [test][DTSImport][clone.vbs]
'[2024-08-29][19:00:00] 005 Kartonagnick    
'  --- CastleOfDreams/vbs                               [test][date][import.vbs]
'  [2021-09-06][19:00:00] 004 Kartonagnick
'  [2021-08-28][18:00:00] 003 Kartonagnick
'  [2021-08-23][18:00:00] 002 Kartonagnick
'  [2021-08-19][18:00:00] 001 Kartonagnick

dim deep: deep = 0

sub main()
  dim obj1: set obj1 = new DTSImport
  dim obj2: set obj2 = obj1.clone()

  eqCompare deep, 1, obj1.format, "YY-MM-DD hh:mm:ss.ms"
  eqCompare deep, 2, obj2.format, "YY-MM-DD hh:mm:ss.ms"

  obj2.format = "YY/MM/DD hh"
  eqCompare deep, 3, obj1.format, "YY-MM-DD hh:mm:ss.ms"
  eqCompare deep, 4, obj2.format, "YY/MM/DD hh"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSImport.clone"
    WScript.Quit 1
  end if
end sub

main()
