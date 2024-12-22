
'--- local/hybrids                                        [dev/7zrun][7zrun.vbs]
'[2024-12-22][08:50:00] 001 Kartonagnick PRE
Option Explicit
' includeVBS("glob.vbs")
' includeVBS("echo.vbs")
' includeVBS("errCode.vbs")
' includeVBS("runCmd.vbs")
' includeVBS("trim.vbs")
' includeVBS("env\string.vbs")
' includeVBS("environment.vbs")
' includeVBS("stamp.vbs")
' includeVBS("c7zip.vbs")
' includeVBS("cversion.vbs")
' includeVBS("settings.vbs")

'...............................................................................

sub makeArchive(deep, setup, zip)
  dim exc, src, dst, post, name, pas
  pas  = setup.password
  exc  = setup.exclude
  src  = setup.dir_src
  post = setup.expand(src)
  
  if post = Empty then
    dst  = setup.dir_dst
    name = setup.name7z
  else
    dst  = setup.dir_dst & "\" & post
    dst  = g_fso.GetParentFolderName(dst)
    dst  = g_fso.GetAbsolutePathName(dst)
    name = g_fso.GetFileName(post)
  end if
  
  dbg deep, "src  : " & src
  dbg deep, "dst  : " & dst
  dbg deep, "name : " & name & ".7z"
  dbg deep, "style: " & post

  zip.password     = pas
  zip.sourceD      = src
  zip.destinationD = dst
  zip.name         = name
  zip.exclude      = exc
  zip.run deep
end sub

sub runMulti(deep, setup, zip)
  dim d, fold, subf, mask
  set mask = (new CMask)(setup.exclude)
  set fold = g_fso.GetFolder(setup.dir_src)
  set subf = fold.SubFolders
  for each d in subf 
    if not mask.match(d.name) then
      dbg deep, "process: " & d
      setup.dir_src = d.Path
      makeArchive deep, setup, zip
    end if
  next
end sub

sub main()
  dim mark, setup, zip 
  echo 0, "beg: " & datestamp()
  set mark = new Elapsed
  set setup = new CSettings

  setup.showDebug 1

  set zip = new C7Zip
  zip.classic = setup.classic

  if setup.needScanVersion then
    dbg 1, "scan version...... yes"
  end if

  if setup.multi then
    dbg 1, "run multi work ..."
    runMulti 1, setup, zip
  else
    dbg 1, "run single work ..."
    makeArchive 1, setup, zip
  end if

  echo 0, "end: " & datestamp() 
  echo 0, "elapsed: " & mark.value()
end sub

main()
