
::'@echo off & call :'checkParent || exit /b
::'cscript //nologo //e:vbscript "%~f0" %*
::'exit /b

' --- local/hybrids                                                [factory.bat]
' [2024-02-15][09:00:00] 003 Kartonagnick    
'   --- CastleOfDreams/hybrids                                     [factory.bat]
'   [2022-02-10][19:00:00] 002 Kartonagnick
'   [2021-12-11][19:00:00] 001 Kartonagnick

'===============================================================================
'===============================================================================

dim g_list   : set g_list   = CreateObject("System.Collections.ArrayList")
dim g_fso    : set g_fso    = CreateObject("Scripting.FileSystemObject")
dim g_regexp : set g_regexp = CreateObject("VBScript.RegExp")
dim g_shell  : set g_shell  = CreateObject("WScript.Shell")
dim g_env    : set g_env    = g_shell.Environment("PROCESS")

'===============================================================================
'===============================================================================

dim gDIR_VBS
gDIR_VBS = g_fso.GetParentFolderName(WScript.ScriptFullName)
gDIR_VBS = g_fso.GetAbsolutePathName(gDIR_VBS & "/../vbs")

dim gDIR_TST
gDIR_TST = g_fso.GetParentFolderName(WScript.ScriptFullName)
gDIR_TST = g_fso.GetAbsolutePathName(gDIR_VBS & "/../test")

sub main()
  dim setup, deep: deep = 0
  dbg deep, "main: begin... v0.0.2"
  dbg deep, "vbs: " & gDIR_VBS
  set setup = new Settings 
  dbg deep, "src: " & setup.src
  dbg deep, "dst: " & setup.dst
  if setup.alone then
    runParse deep
  else
    runStruct deep + 1, setup
  end if
  dbg deep, "main: done"
end sub

class Settings
  public alone  'alone or struct
  public mode   'absolute or relative
  public test   'if unittest -> true
  public src    'path to src data
  public dst    'path to dst data
  public vbs    'path to vbs directory
  public dir    'path to parent of src
  private sub Class_Initialize()
    dim alt, fil, is_test
    mode = "absolute"
    src = fromEnvironment("eHYBRID.SRC", src)
    dir = g_fso.GetParentFolderName(src) 
    fil = g_fso.GetBaseName(src)
    alt = g_fso.BuildPath(dir, fil & ".vbs")
    dst = fromEnvironment("eHYBRID.DST", alt)
    if g_fso.GetBaseName(src) = "struct" then
      alone = false
    else
      alone = true
    end if
    set is_test = CreateObject("VBScript.RegExp")
    is_test.Global = false
    is_test.Pattern = "[/\\]test[/\\]"
    if is_test.Test(src) then
      dbg deep, "mode: unit-test"
      test = true
    else 
      test = false
    end if
  end sub
end class

sub makeDst(deep, files, d_path)
  dbg deep, "dir: " & d_path
  if files.Count = 0 then exit sub
  if g_fso.FolderExists(d_path) then
    exit sub
  end if
  g_fso.CreateFolder d_path
end sub

function makeList(deep, setup)
  dim d, f, ext
  set makeList = CreateObject("System.Collections.ArrayList")
  d = g_fso.GetParentFolderName(setup.src) 
  dbg deep, "scan: " & d
  for each f in g_fso.GetFolder(d).Files
    ext = g_fso.getExtensionName(f.name)
    if ext = "vbs" then 
      dbg deep + 1, "f: " & f 
      makeList.add f
    end if
  next
end function

function parseStruct(deep, setup)
  dim input, modules, is_comment, is_mode, line, smth, val
  set input   = g_fso.OpenTextFile(setup.src, 1, false)
  set modules = CreateObject("System.Collections.ArrayList")
  set is_comment = CreateObject("VBScript.RegExp")
    is_comment.Global = false
    is_comment.Pattern = "^#"
  set is_mode = CreateObject("VBScript.RegExp")
    is_mode.Global = false
    is_mode.Pattern = "\s*#\s*mode\s*=\s*(.*)"

  if setup.test then
    dim tst: tst = gDIR_TST & "\test.ver"
    dim ini: ini = gDIR_TST & "\init.vbs"
    if g_fso.FileExists(tst) then
      dbg deep, "module: " & tst
      modules.add tst
    end if
    if g_fso.FileExists(ini) then
      dbg deep, "module: " & ini
      modules.add ini
    end if
  end if
  
  do while not input.AtEndOfStream
    line = trim(input.Readline)
    if line <> empty then
      if is_mode.Test(line) then
        set smth = is_mode.Execute(line).Item(0).Submatches
        val = smth.Item(0)
        dbg deep, "mode: " & val
        if val = "absolute" then 
          setup.mode = "absolute"
        else
          setup.mode = "relative"
        end if
      elseif is_comment.Test(line) then
       'dbg deep, "skip: " & line
      else
        if inStr(LCase(line), "vbs") = 1 then
          line = gDIR_VBS & Mid(line, 4)
        elseif inStr(LCase(line), "tst") = 1 then
          line = gDIR_TST & Mid(line, 4)
        elseif isAbsolutePath(line) then
          line = g_fso.GetAbsolutePathName(line)
        else
          line = g_fso.GetAbsolutePathName(setup.dir & "\" & line)
        end if
        dbg deep, "module: " & line
        modules.add line  
      end if
    end if
  loop

  set parseStruct = modules 
end function

sub makeWSF(deep, files, modules, setup)
  dim comment, open, beg_tag, end_tag, close 
  dim f, p, out, md

  comment = "<!-- automatic -->"
  open    = "<job>"
  beg_tag = "<script language='VBScript' src='"
  end_tag = "'/>"
  close   = "</job>"

  for each f in files
    p = setup.dst & "\" & g_fso.GetBaseName(f) & ".wsf"
    dbg deep, "make " & p
    set out = g_fso.OpenTextFile(p, 2, true)
    out.write(comment) & vbCrLf
    out.write(open)    & vbCrLf

    for each md in modules
      md = bodyXML(beg_tag, end_tag, setup, md)
      out.write(md) & vbCrLf
    next

    f = bodyXML(beg_tag, end_tag, setup, f)
    out.write(f)     & vbCrLf
    out.write(close) & vbCrLf
  next
end sub

function bodyXML(beg_tag, end_tag, setup, path)
  if setup.mode = "relative" then
    path = relativePath(setup.dst, path)
  end if
  bodyXML = "  " + beg_tag + path + end_tag
end function

sub makeVBS(deep, files, modules, setup)
  dim base, parent, src, dst, opt, alt, f 
  dim scanner, label, writer

  set label = new Label
  for each f in files
    base = g_fso.GetBaseName(f)
    parent = setup.dst & "\" & base
    src = parent & ".wsf"
    dst = parent & ".vbs"

    if label.name = Empty then
      label.name = "[" & base & ".vbs]"
    end if

    dbg deep, label.sepp
    dbg deep, label.title
    dbg deep, label.stamp
    dbg deep, " src: " & src
    dbg deep, " dst: " & dst

    set alt = modules.clone: alt.add(f)
    set scanner = (new Scanner)(deep + 1)

    dbg deep, "scan:"
    opt = scanner.scan(alt)
    if opt then dbg deep, "option explicit"

    dbg deep, "write:"
    set writer = (new Writer)(deep + 1, dst, opt)
    writer.write scanner.modules, label
  next
end sub

sub runStruct(deep, setup)
  dbg deep, "mode: struct"
  dbg deep, "--1-- make list of files..."
  dim files: set files = makeList(deep + 1, setup)
  dbg deep, "--2-- parse struct..."
  dim modules: set modules = parseStruct(deep + 1, setup)
  dbg deep, "--3-- prepare destination directory..."
  makeDst deep + 1, files, setup.dst 
  dbg deep, "--4-- make files.wsf..."
  makeWSF deep + 1, files, modules, setup 
  dbg deep, "--5-- make files.vbs..."
  makeVBS deep + 1, files, modules, setup 
end sub

sub runParse(deep)
  dim label, parser, scanner, modules, opt, writer
  dbg deep, "mode: alone"
  set parser = (new Parser)(deep)
  set label  = new Label
  dbg deep, label.sepp
  dbg deep, label.title
  dbg deep, label.stamp
  dbg deep, "src: " & parser.src_path
  dbg deep, "dst: " & parser.dst_path
  set scanner = (new Scanner)(deep + 1)  
  set modules = parser.parse()
  dbg deep, "scan:"
  opt = scanner.scan(modules)
  if opt then dbg deep, "option explicit"
  dbg deep, "write:"
  set writer = (new Writer)(deep + 1, parser.dst_path, opt)
  writer.write scanner.modules, label
end sub

class Label
  private m_user
  private m_pre
  private m_ver
  private m_stamp
  private m_lft
  private m_rhs

  private sub Class_Initialize()
    m_rhs   = ""
    m_pre   = "PRE"
    m_ver   = "001"
    m_user  = "Kartonagnick"
    m_stamp = "[2024-02-15][19:00:00]"
    m_lft   = "local/hybrids"
    m_ver   = fromEnvironment("eHYBRID.VERSION" , m_ver  )
    m_user  = fromEnvironment("eHYBRID.USER"    , m_user )
    m_stamp = fromEnvironment("eHYBRID.STAMP"   , m_stamp)
    m_pre   = fromEnvironment("eHYBRID.PRE"     , m_pre  )
    m_lft   = fromEnvironment("eHYBRID.PROJECT" , m_lft  )
    m_rhs   = fromEnvironment("eHYBRID.FILE"    , m_rhs  )
  end sub

  property Get title()
    dim beg_part, end_part, offset, fill
    beg_part = "'--- " & m_lft
    end_part = m_rhs
    offset = 80 - len(beg_part) - len(end_part)
    fill = string(offset, " ")
    title = beg_part & fill & end_part
    title = trim(title) 
    title = replace(title, "\", "/")
  end property

  property Get sepp()
    sepp = "'" & String(79, "=")
  end property

  property Get stamp()
    stamp =  "'" & m_stamp & " " & m_ver & " " & m_user & " " & m_pre
    stamp = trim(stamp) 
  end property

  property Get name()
    name = m_rhs
  end property

  property Let name(n)
    m_rhs = n
  end property
end class

class Parser
  private m_src
  private m_dst
  private m_deep

  public default function init(deep)
    me.construct(deep)
    set init = me
  end function

  sub construct(deep) 
    m_deep = deep
    if m_src = Empty then
      echo m_deep, "[ERROR] source file not specified"
      echo m_deep, "[ERROR] check: eHYBRID.SRC"
      WScript.Quit 1
    end if
    m_src = g_fso.GetAbsolutePathName(m_src)
    if not g_fso.FileExists(m_src) then
      echo m_deep, "[ERROR] source file not found"
      echo m_deep, "[ERROR] check: eHYBRID.SRC"
      echo m_deep, "[ERROR] " & m_src
      WScript.Quit 1
    end if
  end sub

  private sub Class_Initialize()
    m_src = fromEnvironment("eHYBRID.SRC", m_src)
    dim d : d = g_fso.GetParentFolderName(m_src) 
    dim f : f = g_fso.GetBaseName(m_src)
    dim alt: alt = g_fso.BuildPath(d, f & ".vbs")
    m_dst = fromEnvironment("eHYBRID.DST", alt)
  end sub

  function parse()
    dim input, modules, is_tag, is_src, line, src, tag
    pushf m_dst
    set input   = g_fso.OpenTextFile(m_src, 1, false)
    set modules = CreateObject("System.Collections.ArrayList")
    set is_tag  = CreateObject("VBScript.RegExp")
      is_tag.Global = false
      is_tag.Pattern = "\s*<(.*)/>\s*"
    set is_src = CreateObject("VBScript.RegExp")
      is_src.Global = false
      is_src.Pattern = "script \s*language\s*=\s*'VBScript' \s*src\s*=\s*'(.*)'"
    do while not input.AtEndOfStream
      line = input.Readline
      if is_tag.Test(line) then
        tag = is_tag.replace(line, "$1")
        if is_src.Test(tag) then
          src = is_src.replace(tag, "$1")
          modules.add src
        end if
      end if
    loop
    set parse = modules 
    popd
  end function

  property Get src_path() src_path = m_src end property
  property Get dst_path() dst_path = m_dst end property
end class

class ScanResult
  public modules
  public explict
end class

class Scanner
  private m_modules
  private m_deep
  private m_map
  private m_opt

  public default function init(deep)
    me.construct(deep)
    set init = me
  end function

  sub construct(deep) 
    m_deep = deep
  end sub

  private sub Class_Initialize()
    set m_map     = CreateObject("Scripting.Dictionary")
    set m_modules = CreateObject("System.Collections.ArrayList")
  end sub

  property Get modules()
    set modules = m_modules
  end property

  function scan(modules)
    dim p: m_opt = false: m_map.RemoveAll 
    for each p in modules
      p = g_fso.GetAbsolutePathName(p)
      recursively m_deep, p
    next
    scan = m_opt
  end function

  sub recursively(deep, path)
    dim p: dim result
    if m_map.Exists(path) then
     'dbg deep, "key already exists -> skip '" & path & "'"
      exit sub     
    end if
    dbg deep, "scan: " & path
    m_map.add path, true
    set result = process(deep + 1, path)
    if result.explict then 
      m_opt = true
    end if
    for each p in result.modules
      recursively deep + 1, p
    next
    m_modules.add path
  end sub

  function process(deep, path)
    dim d, input, result, has_explict, is_include, line, chk

    if not g_fso.FileExists(path) then
      echo deep, "[ERROR] when process VBS"
      echo deep, "[ERROR] file not exits"
      echo deep, "[ERROR] check: " & path
      WScript.Quit 1
    end if

    d = g_fso.GetParentFolderName(path) 
    set input = g_fso.OpenTextFile(path, 1, false)
    set result = new ScanResult
    set result.modules = CreateObject("System.Collections.ArrayList")

    set has_explict = CreateObject("VBScript.RegExp")
      has_explict.Global = false
      has_explict.IgnoreCase = true
      has_explict.Pattern = "\s*(Option\s+Explicit)\s*"

    set is_include = CreateObject("VBScript.RegExp")
      is_include.Global = false
      is_include.Pattern = "^\s*'?\s*includeVBS\((.*)\)"

    do while not input.AtEndOfStream
      line = input.Readline
      if has_explict.Test(line) then
        dbg deep, "detect: OPTION EXPLICT"
        result.explict = true  
      elseif is_include.Test(line) then 
        line = is_include.replace(line, "$1")
        line = Replace(line, chr(34), "")

        if not isAbsolutePath(line) then
          chk = g_fso.BuildPath(d, line)
          chk = g_fso.GetAbsolutePathName(chk)
          if g_fso.FileExists(chk) then
            line = chk
          else
            line = g_fso.BuildPath(gDIR_VBS, line)
            line = g_fso.GetAbsolutePathName(line)
            if not g_fso.FileExists(line) then
              echo deep, "[ERROR] check: " & path
              echo deep, "[ERROR] include(" & line & "): not exist" 
              WScript.Quit 1
            end if
          end if
        end if
        if m_map.Exists(line) then
         'dbg deep, "skip: '" & line & "'"
        else
         'dbg deep, "include: '" & line & "'"
          result.modules.add line 
        end if
      end if
    loop
    set process = result
  end function

  function run(modules)
    dim p
    for each p in modules
      p = g_fso.GetAbsolutePathName(p)
      map.add p, true
      dbg deep + 1, "src: " & p
      if scann.scan(p) then
        explict = true
      end if
    next 
  end function
end class

class Writer
  private m_deep
  private m_dst
  private m_opt

  public default function init(deep, path, opt)
    me.construct deep, path, opt
    set init = me
  end function

  sub construct(deep, path, opt) 
    m_deep = deep
    m_dst = path
    m_opt = opt
  end sub

  private function shortPath(p, num)
    dim arr, val, it_beg, it_end, i
    arr = Split(p, "\", -1, 0)
    it_end = UBound(arr)
    if it_end > num then
      it_beg = it_end - num + 1
      val = arr(it_beg)
      for i = it_beg + 1 to it_end
        val = val & "\" & arr(i)
      next 
      shortPath = val
    else
      shortPath = p
    end if
  end function 
  
  private function makeLabel(caption)
    dim beg_part, end_part, offset, fill    
    beg_part = "'"
    end_part = "[" & caption & "]---"
    offset = 80 - len(beg_part) - len(end_part)
    fill = String(offset, "-")
    makeLabel = beg_part & fill & end_part
    makeLabel = replace(makeLabel, "\", "/")
  end function 

  sub write(modules, label)
    dim dstFile, p, sp
    set dstFile = g_fso.OpenTextFile(m_dst, 2, true)
    dstFile.write vbCrLf
    dstFile.write label.title & vbCrLf
    dstFile.write label.stamp & vbCrLf
    dstFile.write label.sepp  & vbCrLf
    if m_opt then
      dstFile.write vbCrLf
      dstFile.write("Option Explicit") & vbCrLf
    end if
    for each p in modules
      dstFile.write vbCrLf
      sp = shortPath(p, 2)
      sp = makeLabel(sp)
      dstFile.write(sp) & vbCrLf
      writeFile p, dstFile
    next
  end sub

  sub writeFile(path, dstFile)
    dim input, has_explict, is_include, line  
    dbg m_deep, "src: " & path
    set input = g_fso.OpenTextFile(path, 1, false)
    set has_explict = CreateObject("VBScript.RegExp")
      has_explict.Global = false
      has_explict.IgnoreCase = true
      has_explict.Pattern = "\s*(Option\s+Explicit)\s*"
    set is_include = CreateObject("VBScript.RegExp")
      is_include.Global = false
      is_include.Pattern = "^\s*'?\s*includeVBS\((.*)\)"
    do while not input.AtEndOfStream
      line = input.Readline
      if has_explict.Test(line) then
       'dbg deep, "detect: OPTION EXPLICT"
      elseif is_include.Test(line) then 
       'dbg deep, "detect: include"
      else
        dstFile.write(line) & vbCrLf
      end if
    loop
  end sub
end class

'===============================================================================
'===============================================================================

dim g_stack_dirs_423gh4g2h3
set g_stack_dirs_423gh4g2h3 = CreateObject("System.Collections.ArrayList")

sub pushd(path)
  dim p: p = g_fso.GetAbsolutePathName(path)
  g_stack_dirs_423gh4g2h3.add p
  g_shell.CurrentDirectory = p
end sub

sub pushf(path)
  pushd(g_fso.GetParentFolderName(path))
end sub

sub popd()
  dim cnt, p
  cnt = g_stack_dirs_423gh4g2h3.count  
  if cnt = 0 then exit sub
  p = g_stack_dirs_423gh4g2h3(cnt - 1)
  g_stack_dirs_423gh4g2h3.RemoveAt(cnt - 1)
  g_shell.CurrentDirectory = p
end sub

'===============================================================================
'===============================================================================

function fromEnvironment(name, def)
  fromEnvironment = g_env.Item(name)
  if fromEnvironment = empty then 
    fromEnvironment = def
  elseif fromEnvironment = "ON" then
    fromEnvironment = true
  elseif fromEnvironment = "OFF" then
    fromEnvironment = false
  end if
end function

function fromEnvironmentArray(arr_name)
  dim result, arr, i, where, pos

  set result = runCmd("set " & arr_name & "[")
  if result.code <> 0 then
    set fromEnvironmentArray = CreateObject("System.Collections.ArrayList")
    exit function
  end if

  set arr = result.lines
  for i = 0 to arr.count - 1
    where = arr(i)
    pos = Instr(1, where, "=")
    if pos = 0 then
      echo deep, "[ERROR] symbol: '=' not found"
      continue
    end if
    if len(where) <= pos then
      echo deep, "[ERROR] assert(len(where) > pos)"
      continue
    end if
    arr(i) = Right(where, len(where) - pos)
  next
  set fromEnvironmentArray = arr
end function

'===============================================================================
'===============================================================================

dim gDEBUG : gDEBUG  = false
dim gINDENT: gINDENT = 0

function indent(deep)
  indent = Space(deep * 2) & gINDENT
end function

sub initLogging()
  if g_env.Item("eDEBUG") = "ON" then
    gDEBUG = true
  end if
  gINDENT = g_env.Item("eINDENT")
  if gINDENT <> Empty then 
    gINDENT = gINDENT + 1
    gINDENT = Space(gINDENT * 2)
  end if
end sub

initLogging()

sub echo(deep, msg)
 'if gSILENCE then exit sub
  WScript.Echo indent(deep) & msg
end sub

sub dbg(deep, v)
  if not gDEBUG then exit sub
  echo deep, v
end sub 

'===============================================================================
'===============================================================================

' sub includeVBS(path) 
'   dim p
'   if g_fso.FileExists(path) then
'     p = path
'   else 
'     p = g_fso.BuildPath(gDIR_VBS, path)
'     if not g_fso.FileExists(p) then
'       p = g_fso.GetParentFolderName(WScript.ScriptFullName) 
'       p = g_fso.BuildPath(p, path)
'     end if
'   end if
'  'WScript.Echo("include: '" & p & "'")
'   executeGlobal(g_fso.openTextFile(p).readAll())
' end Sub

'===============================================================================
'===============================================================================

function isAbsolutePath(path)
  dim a, b: isAbsolutePath = true
  UCase(Left(path, 1))
  if (a >= "A" and a <= "Z") or (a >= "a" and a <= "z") then 
    b = UCase(Mid(path, 2, 2))
    if b = ":\" or b = ":/" then 
      exit Function
    end if
  end if
  if a = "\" or a = "/" then exit function
  isAbsolutePath = false
end function

function relativePath(general, target)
  dim g_list, t_list, g_bound, t_bound, bound, i, l_part, r_part 
  set g_list = canonicalPathList(general)
  set t_list = canonicalPathList(target)
  if g_list.count = 0 then
    relativePath = relativeA_(t_list)
    exit function
  end if
  if t_list.count = 0 then
    relativePath = relativeA_(g_list)
    exit function
  end if
  g_bound = g_list.count - 1
  t_bound = t_list.count - 1
  bound = minElementPath_(g_bound, t_bound)
  for i = 0 to bound
    if g_list(i) <> t_list(i) then
      exit for
    end if
  next
  if i > bound and bound = t_bound then
    exit function
  end if
  l_part = relativeL_(g_bound - i)
  r_part = relativeR_(i, t_bound, t_list)
  relativePath = l_part & r_part
end function

function minElementPath_(a, b)
  if a > b then
    minElementPath_ = b
  else
    minElementPath_ = a
  end if
end function

function relativeL_(bound)
  dim i
  for i = 0 to bound
    relativeL_ = relativeL_ & "..\"
  next
end function

function relativeR_(beg, bound, collect)
  dim i, re: re = ""
  for i = beg to bound
    re = re & collect(i) & "\"
  next
  if len(re) > 0 then
    relativeR_ = left(re, len(re) - 1)
  else 
    relativeR_ = ""
  end if
end function

function relativeA_(collect)
  dim el, re: re = ""
  if collect.count = 0 then
    relativeA_ = ""
    exit function
  end if 
  for each el in collect
    re = re & el & "\"
  next
  relativeA_ = left(re, len(re) - 1)
end function

function canonicalPathList(path)
  dim winpath, collect, elem, arr, last
  set collect = CreateObject("System.Collections.ArrayList")
  winpath = Replace(path, "/", "\")
  arr = Split(winpath, "\", -1, 0)
  for each elem in arr
    if elem <> Empty and elem <> "." then
      if collect.Count = 0 or elem <> ".." then
        collect.Add(elem)
      else
        last = collect.Count - 1
        if collect.Item(last) = ".." then 
          collect.Add(elem)
        else
          collect.RemoveAt(last)
        end if
      end if
    end if
  next
  set canonicalPathList = collect
end function

'===============================================================================
'===============================================================================

'On Error Resume Next
'Err.Clear

main()

if Err.Number <> 0 Then
  code = Err.Number - vbObjectError
  WScript.Echo "main(err): " & Err.Source
  WScript.Echo "main(err): " & Err.Description
  WScript.Echo "main(err): code = " & code
  WScript.Quit code
end if

'===============================================================================
'===============================================================================

:'normalizeD
rem^   set "%~1=%~dpfn2"
::'exit /b

:'setOwnerD
::'   if defined eDIR_OWNER (exit /b)
::'   cls & echo. & echo.
::'   call :'normalizeD eDIR_OWNER "%~dp0."
::' exit /b

:'checkParent
::'   if errorlevel 1 (
::'     echo [ERROR] was broken at launch 
::'     exit /b 1
rem^   )
::'   call :'setOwnerD
::'   if errorlevel 1 (echo [ERROR] initialization)
::'exit /b
