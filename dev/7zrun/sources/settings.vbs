
'--- local/hybrids                                     [dev/7zrun][settings.vbs]
'[2024-12-22][08:50:00] 001 Kartonagnick PRE
Option Explicit
' includeVBS("glob.vbs")
' includeVBS("echo.vbs")
' includeVBS("trim.vbs")
' includeVBS("env\string.vbs")
' includeVBS("environment.vbs")
' includeVBS("cversion.vbs")

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
