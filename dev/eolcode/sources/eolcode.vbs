
'--- local/hybrids                                    [dev/eolcode][eolcode.vbs]
'[2026-03-26][19:20:00] 001 Kartonagnick    
Option Explicit
' includeVBS("settings.vbs")
' includeVBS("scanner.vbs")

'...............................................................................

sub main()
  dim deep: deep = 0

  echo deep, "beg: " & datestamp()
  dim mark: set mark = new Elapsed  

  dim setup: set setup = new CSettings
  setup.showDebug deep + 1

  echo deep, "scan..."

  dim scanner: set scanner = new CScanner
  scanner.run deep + 1, setup.dir_repo

  echo deep, "end: " & datestamp() 
  echo deep, "elapsed: " & mark.value()
end sub

main()
