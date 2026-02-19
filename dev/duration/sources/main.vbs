
'--- local/hybrids                                      [dev/duration][main.vbs]
'[2026-02-19][14:30:00] 001 Kartonagnick    
Option Explicit
' includeVBS("glob.vbs")
' includeVBS("echo.vbs")
' includeVBS("date\datestamp.vbs")
' includeVBS("date\elapsed.vbs")
' includeVBS("settings.vbs")

sub main()
  dim deep: deep = 0

  echo deep, "beg: " & datestamp()
  dim mark: set mark = new Elapsed  

  dim setup: set setup = new CSettings
  dim files: set files = setup.files(deep + 1)
  setup.showDebug deep + 1

  dim parser: set parser = new CParser
  parser.run deep + 1, files

  echo deep, "end: " & datestamp() 
  echo deep, "elapsed: " & mark.value()
end sub

main()
