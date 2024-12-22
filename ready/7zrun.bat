::'@echo off & call :'checkParent || exit /b 1
::'set "xDEBUG=ON"
::'set "xDIR_7Z=C:\Program Files\7-Zip"   
::'set "xDIR_WORK=%~dp0."
::'set "xDIR_SRC=C:\example"  
::'set "xDIR_DST=C:\backup"  
::'set "xNAME7Z=example"   
::'set "eSTYLE=root-ver\date-pre    
::'set "xPASSWORD=**"
::'set "xTIMESPAMP=[2024-12m-22][07h-51m]"
::'set "eEXCLUDE=msvc-temporary;_backup"  
::'set "xEXCLUDE_SIZE=100mb"
::'set "xCLASSIC=ON"  
::'set "xNOSTASH=OFF"  
::'cscript //nologo //e:vbscript "%~f0" %*
::'exit /b

'--- local/hybrids                                           [script][7zrun.bat]
'[2024-12-22][08:50:00] 001 Kartonagnick PRE
'===============================================================================

'--------------------------------------------------------------[vbs/glob.vbs]---

'--- local/hybrids                                                    [glob.vbs]
'[2024-02-17][20:30:00] 001 Kartonagnick    
'  --- CastleOfDreams\hybrids                                      [initial.vbs]
'  [2022-01-11][19:00:00] 001 Kartonagnick

dim g_list   : set g_list   = CreateObject("System.Collections.ArrayList")
dim g_fso    : set g_fso    = CreateObject("Scripting.FileSystemObject")
dim g_regexp : set g_regexp = CreateObject("VBScript.RegExp")
dim g_shell  : set g_shell  = CreateObject("WScript.Shell")
dim g_env    : set g_env    = g_shell.Environment("PROCESS")

'--------------------------------------------------------------[vbs/echo.vbs]---

'--- local/hybrids                                                    [echo.vbs]
'[2024-04-02][08:30:00] 003 Kartonagnick    
'[2024-02-18][02:00:00] 002 Kartonagnick
'  --- CastleOfDreams\hybrids                                         [echo.vbs]
'  [2022-01-26][19:00:00] 001 Kartonagnick

' procedures:
'   sub echo(deep, msg)
'   sub dbg(deep, msg)
'

dim gSILENCE
dim gINDENT
dim gSPACES
dim gDEBUG

sub initEchoLibrary()
  if g_env.Item("eDEBUG") = "ON" then
    gDEBUG = true
  end if
  if g_env.Item("eSILENCE") = "ON" then
    gSILENCE = true
  end if
  gINDENT = g_env.Item("eINDENT")
  if gINDENT = Empty then 
    gINDENT = 0
  else
    gINDENT = gINDENT + 1
  end if  
  gSPACES = Space(gINDENT * 2)
end sub

function make_indent(deep)
  if deep < 0 then deep = 0
  make_indent = Space(deep * 2)
end function

function indent(deep)
  indent = make_indent(deep) & gSPACES
end function

sub echo(deep, msg)
  if gSILENCE then exit sub
  WScript.Echo indent(deep) & msg
end sub
        
sub dbg(deep, msg)
  if not gDEBUG then exit sub
  echo deep, msg
end sub 

initEchoLibrary()

'--------------------------------------------------------------[vbs/trim.vbs]---

'--- local/hybrids                                                    [trim.vbs]
'[2024-02-21][01:30:00] 001 Kartonagnick    
'  --- CastleOfDreams\hybrids                                         [trim.vbs]
'  [2021-12-11][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams\vbs                                           [trim.vbs]
'    [2021-08-08][19:00:00] 002 Kartonagnick
'    [2021-07-22][19:00:00] 001 Kartonagnick

' functions:
'   function trimFront(text, chars)
'   function trimBack(text, chars)
'   function trimBoth(text, chars)
'   function trimList(lst)

'example: 
'  trimBack("path\ \ \\ ", "\ ")
'  result: path

function trimBack(text, chars)
  dim back, pos
  if text = empty then 
    trimBack = ""
    exit function
  end if
  back = Right(text, 1)
  pos = Instr(1, chars, back, 0)
  if pos > 0 then
    dim tmp: tmp = Left(text, Len(text) - 1)
    trimBack = trimBack(tmp, chars)
  else 
    trimBack = text
  end if
end function

'example:
'  trimFront(" \\ \  \ \  path", "\ ")
'  result: path

function trimFront(text, chars)
  dim front, pos
  if text = empty then 
    trimFront = ""
    exit function
  end if
  front = Left(text, 1)
  pos = Instr(1, chars, front, 0)
  if pos > 0 then
    dim tmp: tmp = Right(text, Len(text) - 1)
    trimFront = trimFront(tmp, chars)
  else
    trimFront = text
  end if
end function

'example:
'  trimFront(" \\ \  \ \  path\ \ \\ ", "\ ")
'  result: path

function trimBoth(text, chars)
  dim t: t = trimBack(text, chars)
  trimBoth = trimFront(t, chars)
end function

' trim each element of the collection
'   lst: array or array-compatible-object
'   return System.Collections.ArrayList
function trimmed(lst)
  dim el: dim cpy
  set cpy = CreateObject("System.Collections.ArrayList")
  for each el in lst
    el = trim(el)
    if el <> empty then
      cpy.add el
    end if
  next
  set trimmed = cpy
end function

' trim each element of the collection
'   lst: can be string, array, or array-compatible-object
function trimList(lst)
  if isArray(lst) then
    trimList = trimmed(lst).toArray()
  elseif vartype(lst) = vbString then
    dim arr: arr = trimmed(split(lst, ";")).toArray()
    trimList = join(arr, ";")
  else
    set trimList = trimmed(lst)
  end if
end function

'-----------------------------------------------------------[vbs/errCode.vbs]---

'--- local/hybrids                                                 [errCode.vbs]
'[2024-02-19][15:00:00] 002 Kartonagnick    
'  --- CastleOfDreams\hybrids                                      [errcode.vbs]
'  [2022-02-22][19:00:00] 002 Kartonagnick
'  [2021-12-26][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams\vbs                                        [errcode.vbs]
'    [2021-08-15][15:00:00] 001 Kartonagnick

' functions:
'   function errorString(code)

dim errorAssertFailed    : errorAssertFailed    = vbObjectError + 1
dim errorTestFailed      : errorTestFailed      = vbObjectError + 2
dim errorFuncFailed      : errorFuncFailed      = vbObjectError + 3
dim errorExecFailed      : errorExecFailed      = vbObjectError + 4
dim errorInvalidTag      : errorInvalidTag      = vbObjectError + 5
dim errorInvalidType     : errorInvalidType     = vbObjectError + 6
dim errorInvalidSize     : errorInvalidSize     = vbObjectError + 7
dim errorInvalidToken    : errorInvalidToken    = vbObjectError + 8
dim errorInvalidOrder    : errorInvalidOrder    = vbObjectError + 9
dim errorInvalidArgument : errorInvalidArgument = vbObjectError + 10
dim errorInvalidSequence : errorInvalidSequence = vbObjectError + 11
dim errorInvalidText     : errorInvalidText     = vbObjectError + 12
dim errorEmptyData       : errorEmptyData       = vbObjectError + 13
dim errorOutRange        : errorOutRange        = vbObjectError + 14
dim errorNotFound        : errorNotFound        = vbObjectError + 15
dim errorNotExists       : errorNotExists       = vbObjectError + 16
dim errorAlreadyExists   : errorAlreadyExists   = vbObjectError + 17
dim errorLogick          : errorLogick          = vbObjectError + 18

dim gERRCODE: set gERRCODE = CreateObject("Scripting.Dictionary")

sub initErrorCodeLibrary()
  gERRCODE.add 0                    , "success"
  gERRCODE.add errorAssertFailed    , "errorAssertFailed"
  gERRCODE.add errorTestFailed      , "errorTestFailed"
  gERRCODE.add errorFuncFailed      , "errorFuncFailed"
  gERRCODE.add errorExecFailed      , "errorExecFailed"
  gERRCODE.add errorInvalidTag      , "errorInvalidTag"
  gERRCODE.add errorInvalidType     , "errorInvalidType"
  gERRCODE.add errorInvalidSize     , "errorInvalidSize"
  gERRCODE.add errorInvalidToken    , "errorInvalidToken"
  gERRCODE.add errorInvalidOrder    , "errorInvalidOrder"
  gERRCODE.add errorInvalidArgument , "errorInvalidArgument"
  gERRCODE.add errorInvalidSequence , "errorInvalidSequence"
  gERRCODE.add errorInvalidText     , "errorInvalidText"
  gERRCODE.add errorEmptyData       , "errorEmptyData"
  gERRCODE.add errorOutRange        , "errorOutRange"
  gERRCODE.add errorNotFound        , "errorNotFound"
  gERRCODE.add errorNotExists       , "errorNotExists"
  gERRCODE.add errorAlreadyExists   , "errorAlreadyExists"
  gERRCODE.add errorLogick          , "errorLogick"
end sub

function errorString(v)
  if not gERRCODE.Exists(v) then
    errorString = "errorUnknown"
  else
    errorString = gERRCODE.item(v)
  end if
end function

initErrorCodeLibrary()

'------------------------------------------------------------[vbs/runCmd.vbs]---

'--- local/hybrids                                                  [runCmd.vbs]
'[2024-02-20][23:50:00] 001 Kartonagnick    
'  --- CastleOfDreams\hybrids                                       [runCmd.vbs]
'  [2021-12-27][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams\vbs                                         [runCmd.vbs]
'    [2021-07-31][15:00:00] 001 Kartonagnick


class Executed
  public stdout
  public stderr
  public code
end class

'return object 'Executed'
'example: command = "ping.exe 127.0.0.1 -n 1 -w 500"

function runCmd(cmd)
  const running = 0
  dim launch, ret, exec
  launch = "cmd.exe /c" & Chr(34) & cmd & Chr(34)
  set ret = new Executed
  set exec = g_shell.Exec(launch)
  while exec.Status = running
    ret.stdout = ret.stdout & exec.StdOut.ReadAll
    if exec.Status = running then
      WScript.Sleep 10
    end if
  wend
  ret.stdout = ret.stdout & exec.StdOut.ReadAll
  ret.stderr = exec.StdErr.ReadAll
  ret.code   = exec.ExitCode
  set runCmd = ret
end function

function runCommand(cmd)
  const running = 0
  dim launch, exec, ret
  launch = "cmd.exe /c" & Chr(34) & cmd & Chr(34)
  set ret = new Executed
  set exec = g_shell.Exec(launch)
  set ret.stdout = CreateObject("System.Collections.ArrayList")
  while exec.Status = running
    do
      ret.stdout.add exec.StdOut.ReadLine()
    loop while not exec.Stdout.atEndOfStream
    if exec.Status = running then
      WScript.Sleep 10
    end if
  wend
  ret.stderr = exec.StdErr.ReadAll
  ret.code   = exec.ExitCode
  set runCommand = ret
end function

'------------------------------------------------------------[env/string.vbs]---

'--- local/hybrids                                              [env/string.vbs]
'[2024-09-30][19:00:00] 001 Kartonagnick    

function fromStringEnv(text)
  dim v
  if not vartype(text) = vbString then
    v = typename(text)
    dim info: info = "[ERROR][ASSERT] fromStringEnv(invalid type): "
    WScript.Echo info & "'" & v & "' (must be string)"
    WScript.Quit 1
  end if
  if text = "" or text = "0" then 
    fromStringEnv = false
  elseif text = "1" then
    fromStringEnv = true
  else
    v = lcase(text)
    if v = "false" or v = "off" or v = "no" then 
      fromStringEnv = false
    elseif v = "true" or v = "on" or v = "yes" then 
      fromStringEnv = true
    else
      fromStringEnv = text
    end if
  end if
end function

'-------------------------------------------------------[vbs/environment.vbs]---

'--- local/hybrids                                             [environment.vbs]
'[2024-09-30][19:00:00] 001 Kartonagnick    

function fromEnvironment(name, def)
  dim v: v = g_env.Item(name)
  if v = empty then
    fromEnvironment = fromStringEnv(def)
  else
    fromEnvironment = fromStringEnv(v)
  end if
end function

'----------------------------------------------------------[date/elapsed.vbs]---

'--- local/hybrids                                            [date/elapsed.vbs]
'[2024-09-26][19:00:00] 001 Kartonagnick    

class Elapsed
  function start()
    begT = Timer()
  end function 
  
  function value()
    dim sec: sec = Round(Timer() - begT, 2)
    value = description(sec)
  end function 

  function description(sec)
    dim ms, ss, mm, hh, dd, ww, re1, re2
    const SECONDS_IN_WEEK   = 604800
    const SECONDS_IN_DAY    = 86400
    const SECONDS_IN_HOUR   = 3600
    const SECONDS_IN_MINUTE = 60
    ms = int((sec - int(sec)) * 1000 + 0.5)    
    if sec < SECONDS_IN_MINUTE then
      ss = int(sec)
    elseif sec < SECONDS_IN_HOUR Then 
      mm = int(sec / SECONDS_IN_MINUTE)
      ss = sec mod SECONDS_IN_MINUTE
    elseif sec < SECONDS_IN_DAY Then
      hh = int(sec / SECONDS_IN_HOUR)
      mm = int((sec mod SECONDS_IN_HOUR) / SECONDS_IN_MINUTE)
      ss = (sec mod SECONDS_IN_HOUR) mod SECONDS_IN_MINUTE
    elseif sec < SECONDS_IN_WEEK Then
      dd = int(sec / SECONDS_IN_DAY)
      hh = int((sec mod SECONDS_IN_DAY)  / SECONDS_IN_HOUR)
      mm = int((sec mod SECONDS_IN_HOUR) / SECONDS_IN_MINUTE)
      ss = int((sec mod SECONDS_IN_HOUR) mod SECONDS_IN_MINUTE)
    else
      ww = int(sec / SECONDS_IN_WEEK)
      dd = int((sec mod SECONDS_IN_WEEK) / SECONDS_IN_DAY) 
      hh = int((sec mod SECONDS_IN_DAY ) / SECONDS_IN_HOUR)
      mm = int((sec mod SECONDS_IN_HOUR) / SECONDS_IN_MINUTE)
      ss = int((sec mod SECONDS_IN_HOUR) mod SECONDS_IN_MINUTE)
    end if
    re1 = w_(ww, "week") & w_(dd, "day") & w_(hh, "hour")
    re2 = s_(mm, "min")  & s_(ss, "sec") & s_(ms, "ms")
    description = trim(re1 & re2)
    if description = Empty then
      description = "0 ms"
    end if
  end function

  private function w_(v, dsc)
    if v = 0 then 
      w_ = ""
    elseif v = 1 then 
      w_ = "1 " & dsc & " "
    else              
      w_ = v & " " & dsc & "s "
    end if
  end function

  private function s_(v, dsc)
    if v = 0 then 
      s_ = ""
    else          
      s_ = v & " " & dsc & " "
    end if
  end function

  private sub Class_Initialize()
    begT = Timer()
  end sub

  private begT
end class

'--------------------------------------------------------[date/datestamp.vbs]---

'--- local/hybrids                                          [date/datestamp.vbs]
'[2024-09-24][19:00:00] 001 Kartonagnick    

function datestamp()
  dim dt: dt = now()
  dim tt: tt = timer()
  dim yy: yy = year(dt)
  dim mo: mo = right("0" & month(dt) , 2)
  dim dd: dd = right("0" & day(dt)   , 2) 
  dim hh: hh = right("0" & hour(dt)  , 2)
  dim mm: mm = right("0" & minute(dt), 2) 
  dim ss: ss = right("0" & second(dt), 2) 
  dim ms: ms = int((tt - int(tt)) * 1000 + 0.5): ms = right("0" & ms, 3)
  datestamp = "[" & yy & "-" & mo & "m-" & dd & "][" & hh & ":" & mm & ":" & ss & "." & ms & "]"
end function

'---------------------------------------------------------[sources/stamp.vbs]---

'--- local/hybrids                                        [dev/7zrun][stamp.vbs]
'[2024-12-22][08:50:00] 001 Kartonagnick PRE

function myTimeStamp()
  dim dt: dt = now()
  dim tt: tt = timer()
  dim yy: yy = year(dt)
  dim mo: mo = right("0" & month(dt) , 2)
  dim dd: dd = right("0" & day(dt)   , 2) 
  dim hh: hh = right("0" & hour(dt)  , 2)
  dim mm: mm = right("0" & minute(dt), 2) 
 'dim ss: ss = right("0" & second(dt), 2) 
 'dim ms: ms = int((tt - int(tt)) * 1000 + 0.5): ms = right("0" & ms, 3)
  myTimeStamp = "[" & yy & "-" & mo & "m-" & dd & "][" & hh & "h-" & mm & "m" & "]"
end function


'---------------------------------------------------------[sources/c7zip.vbs]---

'--- local/hybrids                                        [dev/7zrun][c7zip.vbs]
'[2024-12-22][08:50:00] 001 Kartonagnick PRE

class C7Zip
  private m_src        'string: source directory
  private m_dst        'string: destination directory
  private m_name       'string: name of the archive
  private m_excl       'string: ready to use exclude-string
  private m_excl_size  'double: exclude files greater than this size in bytes
  private m_core       'string: count of processors of computer
  private m_classic    'boolean: if true -> enabled
  private m_pass       'string: password of archive
  private m_temp_dir   'string: directory for temporary 7zrun files

  property let password(v) 
    m_pass = v
  end property

  property let sourceD(v) 
    if not g_fso.FolderExists(v) then 
      call err.Raise(errorNotExist, "C7Zip.sourceD", "dir not exist: '" & v & "'")
    end if
    m_src  = v 
  end property

  property let destinationD(v) 
    if v = empty then 
      call err.Raise(errorEmptyData, "C7Zip.destinationD", "invalid empty value")
    end if
    m_dst  = v 
  end property

  property let name(v)    
    if v = empty then 
      call err.Raise(errorEmptyData, "C7Zip.name", "invalid empty value")
    end if
    m_name = v 
  end property

  property let classic(v)
    m_classic = v 
  end property

  property let exclude(v) 'string: comma-sepparated mask
    dim el, arr, result 
    arr = split(v, ";")
    for each el in arr
      result = result & " -xr!" & el
    next
    m_excl = trim(result)
  end property

  property let excludeSize(v)
    if isNumeric(v) then
      m_excl_size = cdbl(v)
    else
      m_excl_size = 0
    end if
  end property

  sub run(deep)
    checkOptions
    dim archive, prefix, command, result, src, dst, size_excl, list_path
    archive = m_name & ".7z"

    echo deep, "--src : " & m_src 
    echo deep + 1, "dst : " & m_dst 
    echo deep + 1, "name: " & archive 
    
    prefix = "7z.exe a -y -t7z -ssw -mx9 -mmt=" & m_core
    if m_pass <> Empty then
      prefix = prefix & " -p" & getQuotedPassword()
    end if

    src = getQuotedSourceD()
    dst = getQuotedDestD(archive)
    list_path = Empty
    size_excl = getSizeExcludeOption(deep, list_path)

    command = prefix & " " & m_excl & " " & size_excl & " " & dst & " " & src

    dbg deep, "C7Zip.run: " & command 
    set result = runCmd(command)
    if result.code <> 0 then
      echo deep, "[ERROR] " & result.stderr
      call err.Raise(errorExecFailed, "C7Zip.run", "7z.exe failed")
    end if

    cleanupTempDir
  end sub

'---[PRIVATE]-------------------------

  sub checkOptions()
    if not g_fso.FolderExists(m_src) then 
      call err.Raise(errorNotExist, "C7Zip.checkOptions(src)", "dir not exist: '" & v & "'")
    end if
    if m_dst = empty then 
      call err.Raise(errorEmptyData, "C7Zip.checkOptions(dst)", "invalid empty value")
    end if

    if m_name = empty then 
      call err.Raise(errorEmptyData, "C7Zip.checkOptions(name)", "invalid empty value")
    end if
  end sub

  private function getQuotedPassword()
    getQuotedPassword = Chr(34) & m_pass & Chr(34) 
  end function

  private function getQuotedSourceD()
    dim src
    if m_classic then
      src = Chr(34) & m_src & "\*" & Chr(34) 
    else
      src = Chr(34) & m_src & Chr(34) 
    end if
    getQuotedSourceD = src
  end function

  private function getQuotedDestD(name)
    dim dst
    dst = Chr(34) & m_dst & "\" & name & Chr(34) 
    getQuotedDestD = dst
  end function

  private function getSizeExcludeOption(deep, byref list_path)
    getSizeExcludeOption = Empty
    if m_excl_size <= 0 then exit function

    list_path = makeSizeExcludeList(deep)
    if list_path = Empty then exit function
    getSizeExcludeOption = "-x@" & Chr(34) & list_path & Chr(34)
  end function

  private function makeSizeExcludeList(deep)
    dim items: set items = CreateObject("System.Collections.ArrayList")
    collectLargeFiles g_fso.GetFolder(m_src), items

    if items.Count = 0 then
      makeSizeExcludeList = Empty
      exit function
    end if

    dim path, writer, item
    path = getTempListPath()
    set writer = g_fso.OpenTextFile(path, 2, true)
    for each item in items
      writer.WriteLine item
    next
    writer.Close

    dbg deep, "exclude by size .. " & items.Count & " file(s) > " & m_excl_size & " bytes"
    dbg deep, "exclude list ..... " & path
    makeSizeExcludeList = path
  end function

  private sub collectLargeFiles(folder, items)
    dim file, subfolder
    for each file in folder.Files
      if cdbl(file.Size) > m_excl_size then
        items.Add getArchiveExcludePath(file.Path)
      end if
    next

    for each subfolder in folder.SubFolders
      collectLargeFiles subfolder, items
    next
  end sub

  private function getArchiveExcludePath(path)
    dim rel: rel = getRelativeFilePath(path)
    if m_classic then
      getArchiveExcludePath = rel
    else
      getArchiveExcludePath = g_fso.GetFileName(m_src) & "\" & rel
    end if
  end function

  private function getRelativeFilePath(path)
    dim base: base = m_src
    if right(base, 1) <> "\" then base = base & "\"
    getRelativeFilePath = mid(path, len(base) + 1)
  end function

  private function getTempListPath()
    if not g_fso.FolderExists(m_temp_dir) then
      g_fso.CreateFolder m_temp_dir
    end if

    getTempListPath = m_temp_dir & "\7zrun-exclude-size.tmp"
  end function

  private function getTempDir()
    dim dir: dir = g_fso.GetParentFolderName(WScript.ScriptFullName)
    getTempDir = dir & "\7zrun.temp"
  end function

  private sub cleanupTempDir()
    if m_temp_dir = Empty then exit sub
    if g_fso.FolderExists(m_temp_dir) then g_fso.DeleteFolder m_temp_dir, true
  end sub

  private sub init7z
    dim result, dirs, path
    path = g_env.item("PATH")
    dirs = "C:\Program Files\7-Zip; C:\Program Files (x86)\7-Zip"
    g_env("PATH") = PATH & ";" & dirs
    set result = runCmd("where 7z.exe")
    if result.code <> 0 then
      call err.Raise(errorNotFound, "C7Zip.init7z", "7z.exe not found")
    end if
   'result = Replace(result.stdout, vbCrLf, "")
   'dbg deep, "find 7z.exe... " & result
  end sub

  private sub Class_Initialize()
    init7z
    m_core = fromEnvironment("NUMBER_OF_PROCESSORS", "2")
    m_classic = false
    m_excl_size = 0
    m_temp_dir = getTempDir()
    cleanupTempDir
  end sub
end class

'------------------------------------------------------[sources/cversion.vbs]---

'--- local/hybrids                                     [dev/7zrun][cversion.vbs]
'[2024-12-22][08:50:00] 001 Kartonagnick PRE

class CVersion
  private m_ver  'string: version of project (example: 001)
  private m_tag  'string: tag of version of project (example: PRE | REL | BUG)
  private m_rxp  'RegExp: used for different situations

  property get ver() ver = m_ver end property
  property get tag() tag = m_tag end property

  sub detect(dir)
    reset
    dim f: f = g_fso.BuildPath(dir, "docs\history.md")
    if not g_fso.FileExists(f) then exit sub

    scanFile f

    dim ver: ver = Replace(m_ver, ".", "") 
    if ver = empty then
      reset: exit sub
    end if

    m_ver = "v" & ver

    if m_tag = "p" then 
      m_tag = "PRE"
    elseif m_tag = "b" then 
      m_tag = "BUG"
    else   
      m_tag = "REL"
    end if
  end sub

'---[PRIVATE]-------------------------

  private sub scanFile(f)
    dim prefix, line, txtFile
    prefix = "(\[!\[.*\]\]\[.\])\s.*"
    set txtFile = g_fso.OpenTextFile(f, 1)
    do while not txtFile.AtEndOfStream
      line = txtFile.Readline
      m_ver = extractVersion(prefix, line)
      if m_ver <> empty then
        m_tag = extractVersionTag(line)
        exit do
      end if
    loop
    txtFile.Close
  end sub

  function extractVersionTag(line)
    m_rxp.Pattern = "\bPRE\b"
    if m_rxp.test(line) then
      extractVersionTag = "p"
    else
      m_rxp.Pattern = "!\[.\]"
      dim matches: set matches = m_rxp.Execute(line)
      if matches.Count > 0 then
        dim tmp: tmp = matches.Item(0)
        tmp = Replace(tmp, "![", "")
        tmp = Replace(tmp, "]", "")
        extractVersionTag = lcase(tmp)
      end if
    end if
  end function

  function extractVersion(prefix, text)
    dim matches, ver
    extractVersion = ""
    m_rxp.Pattern = prefix
    set matches = m_rxp.Execute(text)
    if matches.Count > 0 then
      m_rxp.Pattern = "(\bv?\d{1,3}\.\d{1,3}\.\d{1,3}\b)"
      set matches = m_rxp.Execute(text)
      if matches.Count > 0 then
        ver = matches.Item(0)
        ver = Replace(ver, "ver", "")
        ver = Replace(ver, "v"  , "")
        extractVersion = ver
      end if
    end if
  end function

  private sub reset
    m_ver = "" 
    m_tag = ""
  end sub 

  private sub Class_Initialize()
    set m_rxp = new RegExp
    m_rxp.IgnoreCase = true
    m_rxp.Global     = true
  end sub
end class

'--------------------------------------------------------[sources/config.vbs]---

'--- local/hybrids                                       [dev/7zrun][config.vbs]
'[2024-12-22][08:50:00] 001 Kartonagnick PRE

class CConfig
  private m_path      'string:               path to 7zrun.cfg
  private m_src       'string:               normalized source directory
  private m_values    'Scripting.Dictionary: last value by variable name
  private m_excludes  'ArrayList:            collected eEXCLUDE values
  private m_exists    'boolean:              true if config file was found
  private m_applied   'integer:              count of matched blocks

  property get path()    path    = m_path    end property
  property get exists()  exists  = m_exists  end property
  property get applied() applied = m_applied end property

  property get exclude()
    exclude = join(m_excludes.toArray(), ";")
  end property

  function has(name)
    has = m_values.Exists(lcase(name))
  end function

  function value(name)
    value = m_values.Item(lcase(name))
  end function

  public default function init(src)
    reset
    m_src  = normalizePath(src)
    m_path = getConfigPath()
    load
    set init = me
  end function

'---[PRIVATE]-------------------------

  private function getConfigPath()
    dim dir: dir = g_fso.GetParentFolderName(WScript.ScriptFullName)
    getConfigPath = dir & "\7zrun.cfg"
  end function

  private sub load()
    dim reader, line, name, value, active
    if not g_fso.FileExists(m_path) then exit sub
    m_exists = true
    active = false
    set reader = g_fso.OpenTextFile(m_path, 1)

    do while not reader.AtEndOfStream
      line = trim(reader.ReadLine)
      if isUsefulLine(line) then
        if parseLine(line, name, value) then
          if lcase(name) = "edir_src" then
            active = matchSource(value)
            if active then m_applied = m_applied + 1
          elseif active then
            applyValue name, value
          end if
        end if
      end if
    loop

    reader.Close
  end sub

  private function isUsefulLine(line)
    isUsefulLine = false
    if line = Empty then exit function
    if left(line, 1) = "#" then exit function
    isUsefulLine = true
  end function

  private function parseLine(line, name, value)
    dim pos: pos = instr(1, line, "=", 0)
    parseLine = false
    if pos = 0 then exit function

    name  = trim(left(line, pos - 1))
    value = trim(mid (line, pos + 1))

    if name = Empty then exit function
    parseLine = true
  end function

  private sub applyValue(name, value)
    dim key: key = lcase(name)
    if key = "eexclude" then
      m_excludes.Add value
      exit sub
    end if

    if m_values.Exists(key) then m_values.Remove key
    m_values.Add key, fromStringEnv(value)
  end sub

  private function matchSource(value)
    dim key: key = lcase(normalizePath(value))
    dim src: src = lcase(m_src)
    matchSource = false

    if key = Empty then exit function
    if src = key then
      matchSource = true
      exit function
    end if

    if len(src) <= len(key)                    then exit function
    if right(src, len(key)) <> key             then exit function
    if mid(src, len(src) - len(key), 1) <> "\" then exit function

    matchSource = true
  end function

  private function normalizePath(value)
    dim text: text = trim(value)
    text = replace(text, "/", "\")
    normalizePath = trimBack(text, "\ ")
  end function

  private sub reset
    m_path    = Empty
    m_src     = Empty
    m_exists  = false
    m_applied = 0
    set m_values   = CreateObject("Scripting.Dictionary")
    set m_excludes = CreateObject("System.Collections.ArrayList")
  end sub

  private sub Class_Initialize()
    reset
  end sub
end class

'------------------------------------------------------[sources/settings.vbs]---

'--- local/hybrids                                     [dev/7zrun][settings.vbs]
'[2024-12-22][08:50:00] 001 Kartonagnick PRE

class CMode
  private m_multi   'boolean: if true -> multi  , else -> single
  private m_classic 'boolean: if true -> classic, else -> typical
  private m_stash   'boolean: if true -> used   , else -> not used

 'true or false
  property let classic(v) m_classic = v end property
  property let stash(v)   m_stash   = v end property
  property let multi(v)   m_multi   = v end property

  property get classic() classic = m_classic end property
  property get stash()   stash   = m_stash   end property
  property get multi()   multi   = m_multi   end property

  function useStash() 
    useStash = m_stash
  end function

  sub showDebug(deep)
    if not gDEBUG then exit sub
    if m_classic then
      echo deep, "CLASSIC .......... yes"
    end if

    if m_stash then
      echo deep, "STASH ............ yes"
    end if

    if m_multi then
      echo deep, "MULTI ............ yes"
    else
      echo deep, "SINGLE ........... yes"
    end if
 end sub

'---[PRIVATE]-------------------------

  private sub reset
    m_multi   = false 
    m_classic = false
    m_stash   = true
  end sub 

  private sub Class_Initialize()
    reset
  end sub
end class

class CSettings

  private m_work         'string: work directory (current by default)
  private m_dst          'string: path to source directory (must be detected)
  private m_src          'string: path to source directory (must be detected)

  private m_name7z       'string: name of archive (without extension)
                         '        (default: name of d_src)

  private m_style        'string: style of destination path 
                         '        (empty by default)

  private m_mode         'CMode: classic/typical stash/nostash single/multi
  private m_exclude      'string: comma-sepparated masks of recursieve excludes 
                         '        if "msvc-temporary" -> "ipch; .vs; *VC.db; *.VC.opendb; *.sdf" 
                         '        (empty by default)
  private m_exclude_size 'double: exclude files greater than this size in bytes

  private m_password     'string: password of archive (empty by default)
  private m_classic      'boolean: if true -> classic mode enabled
  private m_nostash      'boolean: if true -> stash mode disabled
  
  private m_stamp        'string: used this date-time-stamp when generate archive-name
                         '        (default: use current date-time)
                         '        format  : [YY-MMm-DD][hhh-mmm]
                         '        example : [2024-12m-18][06h-27m]

  private m_token        'RegExp: used in function 'hasToken'

  property get exclude()  exclude = m_exclude      end property
  property get exclude_size() exclude_size = m_exclude_size end property
  property get name7z()   name7z  = m_name7z       end property
  property get classic()  classic = m_mode.classic end property
  property get multi()    multi   = m_mode.multi   end property

  property get password() password = m_password    end property
  property get dir_wrk()  dir_wrk = m_work         end property
  property get dir_src()  dir_src = m_src          end property
  property get dir_dst()  dir_dst = m_dst          end property

  property let dir_src(v) m_src = v                end property

  function needScanVersion()
    if hasToken(m_style, "ver") then
      needScanVersion = true
    elseif hasToken(m_style, "pre") then
      needScanVersion = true
    else    
      needScanVersion = false
    end if
  end function

  function expand(dir)
    dim ver, tag, dname, tmp, obj
    dname = g_fso.GetFileName(dir)
    tmp = m_style

    if needScanVersion then
      set obj = new CVersion
      obj.detect dir
      tmp = replaceToken(tmp, "ver" , obj.ver)
      tmp = replaceToken(tmp, "pre" , obj.tag)
    end if

    tmp = replaceToken(tmp, "date", m_stamp)
    tmp = replaceToken(tmp, "name", name7z)
    tmp = replaceToken(tmp, "root", name7z)
    tmp = replaceToken(tmp, "dir" , dname)
    tmp = replace(tmp, "\\", "\")
    tmp = replace(tmp, "//", "\")
    tmp = replace(tmp, "--", "-")
    tmp = replace(tmp, "-\", "\")
    tmp = replace(tmp, "-.", ".")
    tmp = replace(tmp, "\-", "\")
    tmp = replace(tmp, ".-", ".")
    tmp = trimBoth(tmp, "\/-.")
    expand = tmp
  end function 

  sub showDebug(deep)
    if not gDEBUG then exit sub
    echo deep, "TIMESTAMP ........ " & m_stamp
    echo deep, "NAME ............. " & m_name7z
    echo deep, "DIR WORK ......... " & m_work
    echo deep, "DIR SRC .......... " & m_src
    echo deep, "DIR DST .......... " & m_dst
    echo deep, "EXCLUDE .......... " & m_exclude    

    if m_exclude_size > 0 then
      echo deep, "EXCLUDE SIZE ..... " & m_exclude_size
    end if

    if m_style <> Empty then
      echo deep, "STYLE ............ " & m_style
    end if

    if m_password <> Empty then
      echo deep, "PASSWORD ......... enabled"
    end if

    m_mode.showDebug(deep)
  end sub

'---[PRIVATE]-------------------------

  private function getDirectoryWrk()
    dim cur

    cur = g_shell.CurrentDirectory
    cur = fromEnvironment("eDIR_WORK", cur)
    cur = g_fso.GetAbsolutePathName(cur)
    getDirectoryWrk = cur
  end function 

  private function getDirectoryDst()
    dim def: def = g_fso.GetAbsolutePathName(m_work & "\_backup")
    getDirectoryDst = fromEnvironment("eDIR_DST", def)
  end function 

  private function getSourceD()
    dim src: src = trim(g_env.Item("eDIR_SRC"))
    if src <> Empty then 
      getSourceD = src
      exit function
    end if
    
    src = m_work & "\.git"
    if g_fso.FolderExists(src) then 
      getSourceD = src
      exit function
    end if

    getSourceD = m_work
    if not m_mode.useStash() then
      exit function
    end if

    dim def, name
    def  = g_fso.GetFileName(m_work)
    name = fromEnvironment("eNAME7Z", def)
    src = m_work & "\..\..\" & name
    if g_fso.FolderExists(src) then 
      getSourceD = src
      exit function
    end if
  end function

  private function getDirectorySrc()
    dim src: src = getSourceD()
    getDirectorySrc = g_fso.GetAbsolutePathName(src)
  end function 

  private function getName7z()
    dim def: def = g_fso.GetFileName(m_src)
    getName7z = fromEnvironment("eNAME7Z", def)
  end function 

  private function getExludeString()
    getExludeString = expandExludeString(g_env.Item("eEXCLUDE"))
  end function

  private function expandExludeString(value)
    dim style, el, arr
    set arr = CreateObject("System.Collections.ArrayList")
    style = value
    set style = trimmed(split(style, ";"))
    for each el in style
      if lcase(el) = "msvc-temporary" then
        arr.add "*.VC.opendb"
        arr.add "*VC.db"
        arr.add "*.sdf"
        arr.add "ipch"
        arr.add ".vs"
      else
        arr.add el
      end if
    next
    expandExludeString = join(arr.toArray(), ";")
  end function 

  private function appendExludeString(base, extra)
    if base = Empty then
      appendExludeString = extra
    elseif extra = Empty then
      appendExludeString = base
    else
      appendExludeString = base & ";" & extra
    end if
  end function

  private function getExcludeSize()
    getExcludeSize = parseSize(fromEnvironment("eEXCLUDE_SIZE", ""))
  end function

  private function parseSize(value)
    dim text: text = lcase(trim(cstr(value)))
    parseSize = 0
    if text = Empty then exit function

    dim suffix, number, mul
    mul = 1
    suffix = right(text, 2)

    if suffix = "kb" then
      mul = 1024
      number = left(text, len(text) - 2)
    elseif suffix = "mb" then
      mul = 1024 * 1024
      number = left(text, len(text) - 2)
    elseif suffix = "gb" then
      mul = 1024 * 1024 * 1024
      number = left(text, len(text) - 2)
    else
      suffix = right(text, 1)
      if suffix = "k" then
        mul = 1024
        number = left(text, len(text) - 1)
      elseif suffix = "m" then
        mul = 1024 * 1024
        number = left(text, len(text) - 1)
      elseif suffix = "g" then
        mul = 1024 * 1024 * 1024
        number = left(text, len(text) - 1)
      elseif suffix = "b" then
        number = left(text, len(text) - 1)
      else
        number = text
      end if
    end if

    number = trim(number)
    if not isNumeric(number) then exit function
    parseSize = cdbl(number) * cdbl(mul)
  end function

  private function getExludeOptions()
    dim el, result 
    for each el in split(m_exclude, ";")
      result = result & " -xr!" & el
    next
    getExludeOptions = trim(result)
  end function 

  private function getTimeStamp()
    dim def: def = myTimeStamp()
    getTimeStamp = fromEnvironment("eTIMESPAMP", def)
  end function 

  private function getPassword()
    getPassword = trim(g_env.Item("ePASSWORD"))
  end function 

  private function detectStyle()
    detectStyle = trim(g_env.Item("eSTYLE"))
  end function 

  private function getMode()
    dim obj: set obj = new CMode

    obj.classic = m_classic

    if m_nostash then
      obj.stash = false
    else
      obj.stash = true
    end if

    if hasToken(m_style, "dir") then
      obj.multi = true
    end if

    set getMode = obj
  end function 

  private sub applyConfig()
    dim cfg: set cfg = (new CConfig)(m_src)
    if not cfg.exists then exit sub
    if cfg.applied = 0 then exit sub

    if cfg.has("eSTYLE")        then m_style        = cfg.value("eSTYLE")
    if cfg.has("eTIMESPAMP")    then m_stamp        = cfg.value("eTIMESPAMP")
    if cfg.has("ePASSWORD")     then m_password     = cfg.value("ePASSWORD")
    if cfg.has("eDIR_DST")      then m_dst          = cfg.value("eDIR_DST")
    if cfg.has("eNAME7Z")       then m_name7z       = cfg.value("eNAME7Z")
    if cfg.has("eCLASSIC")      then m_classic      = cfg.value("eCLASSIC")
    if cfg.has("eNOSTASH")      then m_nostash      = cfg.value("eNOSTASH")
    if cfg.has("eDEBUG")        then gDEBUG         = cfg.value("eDEBUG")
    if cfg.has("eEXCLUDE_SIZE") then m_exclude_size = parseSize(cfg.value("eEXCLUDE_SIZE"))

    m_exclude = appendExludeString(m_exclude, expandExludeString(cfg.exclude))
  end sub

  function hasToken(text, token)
    m_token.Pattern = "(\b)" & token
    hasToken = m_token.Test(text)
  end function

  private function replaceToken(src, token, value)
    m_token.Pattern = "(\b)" & "(" & token & ")"
    replaceToken = m_token.Replace(src, "$1" & value)
  end function

  private sub reset
    m_style    = detectStyle()
    m_exclude  = getExludeString()
    m_exclude_size = getExcludeSize()
    m_stamp    = getTimeStamp()
    m_password = getPassword()
    m_classic  = fromEnvironment("eCLASSIC", "")
    m_nostash  = fromEnvironment("eNOSTASH", "")

    set m_mode = getMode()

    m_work     = getDirectoryWrk()
    m_dst      = getDirectoryDst()
    m_src      = getDirectorySrc()
    m_name7z   = getName7z()

    applyConfig
    set m_mode = getMode()
  end sub 

  private sub Class_Initialize()
    set m_token = new RegExp
    m_token.IgnoreCase = true
    m_token.Global = true
    m_token.Pattern = "(\b)"
    reset
  end sub
end class

'---------------------------------------------------------[sources/cmask.vbs]---

'--- local/hybrids                                        [dev/7zrun][cmask.vbs]
'[2024-12-22][08:50:00] 001 Kartonagnick PRE
'  based on the story:
'  --- local/hybrids                                              [vbs/mask.vbs]
'  [2024-03-08][19:00:00] 002 Kartonagnick
'  [2024-02-23][06:50:00] 001 Kartonagnick
'    --- CastleOfDreams\hybrids                                       [mask.vbs]
'    [2022-02-06][19:00:00] 001 Kartonagnick
'      --- CastleOfDreams\vbs                                         [mask.vbs]
'      [2021-08-08][19:00:00] 002 Kartonagnick
'      [2021-07-29][23:30:00] 001 Kartonagnick

class CMask
  private m_regexp
  private m_list

  public default function init(list_of_masks)
    me.pattern = list_of_masks
    set init = me
  end function

  property let pattern(v) 
    set m_list = masksToRegexp(v)
  end property

  ' IgnoreCase
  ' Empty VS Value -> check
  ' Empty VS Once --> false
  ' Empty VS Empty -> true
  ' Empty VS Any ---> true
  ' Value VS Any ---> true
  ' Value VS Empty -> true
  ' Value VS Once --> check
  ' Value VS Value -> check
  function match(text)
    if typeName(text) = "File" then
      match = match(text.Name)
    elseif typeName(text) = "Folder" then
      match = match(text.Name)
    else
      dim rxp
      for each rxp in m_list
        m_regexp.Pattern = rxp
        if m_regexp.Test(text) then
          match = true
          exit function
        end if
      next
      match = false
    end if
  end function

'---[PRIVATE]-------------------------

  private function masksToRegexp(masks)
    dim el, result
    set result = CreateObject("System.Collections.ArrayList")
    m_regexp.Pattern = "([\(\)\{\}\[\]\|\\\/\.\^\$])"
    for each el in split(masks, ";")
      el = trim(el)
      if el <> Empty then
        result.add maskToRegexp(el)
      end if
    next
    set masksToRegexp = result
  end function

  ' escaping service characters: ( ) { } [ ] | \ / . ^ \ $
  ' * -> .*
  ' ? -> .
  ' add ^ to the beginning: ^mask
  ' add an $ to the end: mask$
  ' example: "*.*" -> "^.*\..*$"
  private function maskToRegexp(mask)
    dim tmp
    tmp = m_regexp.Replace(mask, "\$1")
    tmp = Replace(tmp, "*", ".*")
    tmp = Replace(tmp, "?", ".")
    maskToRegexp = "^" + tmp + "$"
  end function

  private sub Class_Initialize()
    set m_regexp = new RegExp
    m_regexp.IgnoreCase = true
    m_regexp.Global = true
    set m_list = CreateObject("System.Collections.ArrayList")
  end sub
end class

'---------------------------------------------------------[sources/7zrun.vbs]---

'--- local/hybrids                                        [dev/7zrun][7zrun.vbs]
'[2024-12-22][08:50:00] 001 Kartonagnick PRE

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
  zip.excludeSize  = setup.exclude_size
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

'===============================================================================
'===============================================================================

:'checkParent
::'  if errorlevel 1 (echo [ERROR] was broken at launch & exit /b 1)
::'  if defined eDIR_OWNER (exit /b)
::'  cls & chcp 65001 >nul & call :'normalizeD eDIR_OWNER "%~dp0."
::'exit /b
:'normalizeD
rem^  set "%~1=%~dpfn2"
::'exit /b
