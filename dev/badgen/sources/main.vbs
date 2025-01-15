
'--- local/hybrids                                        [dev/badgen][main.vbs]
'[2025-01-15][19:00:00] 001 Kartonagnick    
' includeVBS("date\datestamp.vbs")
' includeVBS("date\elapsed.vbs")
' includeVBS("settings.vbs")
' includeVBS("fcontent.vbs")

Option Explicit
dim gSetup, gREGEXP, gREGEXP2

sub initial()
  set gSetup   = new CSettings
  set gREGEXP = new RegExp
  with gREGEXP
    'example text: [2025-01m-01 12:26:41]
    .Pattern    = "\[(\d{4})-(\d{2})m?-(\d{2}) (\d{2}):(\d{2}):(\d{2})\]"
    .IgnoreCase = true
    .Global     = false
    .Multiline  = false
  end with

  set gREGEXP2 = new RegExp
  with gREGEXP2
    'example text: [![2025-01m-10 23:06:16]][H] ololo
    .Pattern    = "(.*)!\[(\d{4})-(\d{2})m?-(\d{2}) (\d{2}):(\d{2}):(\d{2})\](.*)"
    .IgnoreCase = true
    .Global     = false
    .Multiline  = false
  end with
end sub

sub main()
  dim mark, files, f, loader, content, method
  echo 0, "beg: " & datestamp()

  set mark = new Elapsed

  initial

  gSetup.showDebug 1
  if gSetup.style = "shields" then
    method = "makeShields"
  else
    method = "makeBadgen"
  end if

  set files = gSetup.files(1)
  set loader = new FileContent
  for each f in files
    echo 1, "process: " & f
    set content = loader.load(f, method)
    loader.saveEndl f, content
  next

  echo 0, "end: " & datestamp() 
  echo 0, "elapsed: " & mark.value()
end sub

main()
