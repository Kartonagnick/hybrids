
'--- local/hybrids                                    [dev/badgen][settings.vbs]
'[2025-01-15][19:00:00] 001 Kartonagnick PRE
' includeVBS("glob.vbs")
' includeVBS("echo.vbs")
' includeVBS("env\string.vbs")
' includeVBS("environment.vbs")
' includeVBS("trim.vbs")
' includeVBS("find_in.vbs")

class CSettings

  private m_dir_work     'string:  work directory (current by default)
  private m_hide_skip    'boolean: do not show skipped files or directories
  private m_hide_scan    'boolean: do not show scan-process
  private m_dirs_start   'string:  directories to scan
  private m_exclude_scan 'string:  ignore directories when scanning
  private m_exclude_file 'string:  ignored files
  private m_exclude_dir  'string:  ignored directories
  private m_include_scan 'string:  scan this directories
  private m_include_file 'string:  add this files to result
  private m_include_dir  'string:  add this directory to result
  private m_find_once    'boolean: stop scanning on first successful detection

  private m_style        'string: shields | badgen (badgen by default)

  property get style() style = LCase(m_style) end property     

  property get files(deep)   
    if g_fso.FileExists(m_dir_work) then
      set files = CreateObject("System.Collections.ArrayList")
      files.add m_dir_work
      exit property
    end if

    dim find: set find = (new Find_in)(m_dirs_start)
    with find
      .includeS = m_include_scan
      .excludeS = m_exclude_scan
      .includeD = m_include_dir
      .excludeD = m_exclude_dir
      .includeF = m_include_file
      .excludeF = m_exclude_file
      .hideSkip = m_hide_skip
      .hideScan = m_hide_scan
      .once     = m_find_once
      .debug    = false
    end with
    find.run deep 
    set files = find.files()
  end property

  sub showDebug(deep)
    if not gDEBUG then exit sub
    showOnce deep, "STYLE"       , m_style    
    showOnce deep, "DIR WORK"    , m_dir_work
    showList deep, "DIRS SCAN"   , m_dirs_start
    showList deep, "INCLUDE_SCAN", m_include_scan
    showList deep, "EXCLUDE_SCAN", m_exclude_scan
   'showList deep, "INCLUDE_DIR" , m_include_dir
   'showList deep, "EXCLUDE_DIR" , m_exclude_dir
    showList deep, "INCLUDE_FILE", m_include_file
    showList deep, "EXCLUDE_FILE", m_exclude_file
   'showOnce deep, "FIND ONCE"   , m_find_once
    showOnce deep, "HIDE SKIP"   , m_hide_skip
    showOnce deep, "HIDE SCAN"   , m_hide_scan
    showOnce deep, "DEBUG"       , gDEBUG    
  end sub

'---[PRIVATE]-------------------------

  private sub showOnce(deep, dsc, value)
    dim len_descript, len_maximum, len_left, prefix
    len_descript = len(dsc)
    len_maximum = len("EXCLUDE_SCAN")
    len_left = len_maximum - len_descript
    prefix = String(len_left, ".")
    echo deep, dsc & " " & prefix & "... " & value
  end sub

  private sub showList(deep, dsc, text)
    dim el, cnt, arr: arr = split(text, ";")
    cnt = UBound(arr) + 1
    if cnt = 0 then
      showOnce deep, dsc, "empty"
    elseif cnt = 1 then
      showOnce deep, dsc, arr(0)
    else
      echo deep, dsc & ":"
      for each el in arr
        echo deep + 1, "- " & el
      next
    end if
  end sub

  private function getDirectoryWrk()
    dim cur
    cur = g_shell.CurrentDirectory
    cur = fromEnvironment("eDIR_WORK", cur)
    cur = g_fso.GetAbsolutePathName(cur)
    getDirectoryWrk = cur
  end function 

  private sub reset
    m_style = fromEnvironment("eMAKE_STYLE", "badgen")

    m_dir_work   = getDirectoryWrk()
    m_dirs_start = fromEnvironment("eDIRS_START", m_dir_work)
   'm_find_once  = fromEnvironment("eFIND_ONCE" , "0")
    m_find_once  = false

    m_hide_skip = fromEnvironment("eHIDE_SKIP", "1")
    m_hide_scan = fromEnvironment("eHIDE_SCAN", "1")

    m_include_scan = trim(g_env.Item("eINCLUDE_SCAN"))
    m_exclude_scan = trim(g_env.Item("eEXCLUDE_SCAN"))

   'm_include_dir  = trim(g_env.Item("eINCLUDE_DIR"))
   'm_exclude_dir  = trim(g_env.Item("eEXCLUDE_DIR"))

    m_include_file = trim(g_env.Item("eINCLUDE_FILE"))
    m_exclude_file = trim(g_env.Item("eEXCLUDE_FILE"))
    if m_include_file = empty then
      m_include_file = "*.md"
    end if

    m_include_scan = trimList(m_include_scan)
    m_exclude_scan = trimList(m_exclude_scan)

   'm_include_dir  = trimList(m_include_dir)
   'm_exclude_dir  = trimList(m_exclude_dir)
    m_exclude_dir  = "*"

    m_include_file = trimList(m_include_file)
    m_exclude_file = trimList(m_exclude_file)
  end sub 

  private sub Class_Initialize()
    reset
  end sub
end class
