
'--- local/hybrids                                  [test][DTSExport][clone.vbs]
'[2024-08-29][19:00:00] 005 Kartonagnick PRE
'  --- CastleOfDreams/vbs                               [test][date][export.vbs]
'  [2021-09-06][19:00:00] 004 Kartonagnick
'  [2021-08-27][18:00:00] 003 Kartonagnick
'  [2021-08-24][18:00:00] 002 Kartonagnick
'  [2021-08-20][18:00:00] 001 Kartonagnick

sub main()
  dim deep: deep = 0
  dim obj1: set obj1 = new DTSExport
  dim obj2: set obj2 = obj1.clone()

  eqCompare deep, 1, obj1.format, "YY-MM-DD hh:mm:ss.ms"
  eqCompare deep, 2, obj2.format, "YY-MM-DD hh:mm:ss.ms"

  obj2.format = "YY/MM/DD hh"
  eqCompare deep, 3, obj1.format, "YY-MM-DD hh:mm:ss.ms"
  eqCompare deep, 4, obj2.format, "YY/MM/DD hh"

  if not gMY_TEST then
    echo deep, "[ERROR] DTSExport.clone"
    WScript.Quit 1
  end if
end sub

main()
