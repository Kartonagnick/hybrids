
'--- local/hybrids                        [test][DTSExport][format.except.1.vbs]
'[2024-08-29][19:00:00] 005 Kartonagnick    
'  --- CastleOfDreams/vbs                               [test][date][export.vbs]
'  [2021-09-06][19:00:00] 004 Kartonagnick
'  [2021-08-27][18:00:00] 003 Kartonagnick
'  [2021-08-24][18:00:00] 002 Kartonagnick
'  [2021-08-20][18:00:00] 001 Kartonagnick

dim deep: deep = 0

sub test(id, format)
  on error resume Next
  err.clear
  dim obj: set obj = (new DTSExport)(format)
  check_exception deep, id, errorInvalidTag
  on error goto 0
end sub

sub main()

'--- incorrect format: dublicate token
  'test 1, "YY-MM-DD DD"     
  'test 2, "YY-MM-DD TT hh"  
  'test 3, "YY-MM-DD TIME ss"
  'test 4, "YY-MM-YY-DD"     

  if not gMY_TEST = true then
    echo deep, "[ERROR] DTSExport.format.except.1"
    WScript.Quit 1
  end if
end sub

main()
