
'--- local/hybrids                                     [dev/7zrun][cversion.vbs]
'[2024-12-22][08:50:00] 001 Kartonagnick    
Option Explicit
' includeVBS("glob.vbs")

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
