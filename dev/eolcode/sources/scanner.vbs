
'--- local/hybrids                                    [dev/eolcode][scanner.vbs]
'[2026-03-26][19:20:00] 001 Kartonagnick PRE
Option Explicit
' includeVBS("glob.vbs")
' includeVBS("echo.vbs")
' includeVBS("mask.vbs")
' includeVBS("find_in.vbs")
' includeVBS("fcontent.vbs")

class CScanner
  private m_win       'Array: list of extension of typical Windows files
  private m_lin       'Array: list of extension of typical Linux files
  private m_checker   'FileContent: checker
  private m_exclude   'string: mask of excludes directories
  private m_totalD    'UINT: total directories checked
  private m_totalF    'UINT: total files checked

  sub run(deep, d_repo)
    echo deep, "scan: running..."
    m_totalD = 0
    m_totalF = 0
    dim curD: set curD = makeScanD(deep + 1, d_repo)
    nextD deep + 1, curD
    echo deep, "scan: done! (dirs: " & m_totalD & ", files: " & m_totalF & ")"
  end sub

'---[PRIVATE]-------------------------

  private function nextD(deep, scanD)

    m_totalD = m_totalD + scanD.dirs.count
    m_totalF = m_totalF + scanD.files.count

    dim curD, d, f 
    for each f in scanD.files
      checkFile deep, f
    next 

    for each d in scanD.dirs
      dbg deep, "[d] " & d
      set curD = makeScanD(deep, d)
      nextD deep + 1, curD 
    next 

  end function

  private function makeScanD(deep, dir)
    set makeScanD = (new Find_in)(dir)
    makeScanD.excludeS   = "*"
    makeScanD.excludeD   = m_exclude
    makeScanD.excludeF   = "_*"
    makeScanD.hideParams = true
    makeScanD.hideSkip   = true
    makeScanD.run deep
  end function

  private sub checkFile(deep, f)
    dim re, known, fname, i: i = 0
    if gDEBUG then i = 1 

    re = m_checker.isTextHeuristic2(f, known)
    if known then
      dbg deep, "[f] " & f
    else
      echo deep, "[u] " & f
    end if

    if re then
      mustBeUTF8 deep + i, f
      fname = g_fso.GetFilename(f)
      if contain(fname, m_win) then
        checkEOL deep + i, f, "CRLF"
      elseif contain(fname, m_lin) then
        checkEOL deep + i, f, "LF"
      else 
        checkEOL deep + i, f, "LF"
      end if
    end if
  end sub

  private sub mustBeUTF8(deep, path)
    if m_checker.checkValidUtf8(path) then 
      exit sub
    end if
    echo deep, "[WARNING] invalid utf8: " & path
  end sub

  private sub checkEOL(deep, path, etalon)
    dim result
    if m_checker.checkEOL(path, etalon, result) then 
      exit sub
    end if
    echo deep, "[WARNING] invalid eol: " & path & " (must be " & etalon & ", but real is " & result & ")"
  end sub

  function contain(filename, list)
    dim e, e_len, f_len: f_len = len(filename)
    for each e in list
      e_len = len(e)
      if f_len >= e_len Then
        if lcase(right(filename, e_len)) = lcase(e) then
          contain = true
          exit function
        end if
      end if
    next
    contain = false
  end function

  private sub initialize(deep, d_repo) 
  end sub

  private sub Class_Initialize()
    m_exclude = "_*;.git;.vs;temp;output;debug;release;boost"
    m_win = array("bat", "cmd", "vbs", "wsf", "sln", "sln.all", "sln.bld", "user", "vcxproj.filters")
    m_lin = array("sh", "bash")
    set m_checker = new FileContent
  end sub
end class
