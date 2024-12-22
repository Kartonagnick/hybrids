
'--- local/hybrids                                       [dev/7zrun][config.vbs]
'[2024-12-22][08:50:00] 001 Kartonagnick    

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
