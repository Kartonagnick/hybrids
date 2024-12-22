
'--- local/hybrids                                        [dev/7zrun][c7zip.vbs]
'[2024-12-22][08:50:00] 001 Kartonagnick    
Option Explicit
' includeVBS("glob.vbs")
' includeVBS("echo.vbs")
' includeVBS("errCode.vbs")
' includeVBS("runCmd.vbs")
' includeVBS("env\string.vbs")
' includeVBS("environment.vbs")

class C7Zip
  private m_src        'string: source directory
  private m_dst        'string: destination directory
  private m_name       'string: name of the archive
  private m_excl       'string: ready to use exclude-string
  private m_core       'string: count of processors of computer
  private m_classic    'boolean: if true -> enabled
  private m_pass       'string: password of archive

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

  sub run(deep)
    checkOptions
    dim archive, prefix, command, result, src, dst
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

    command = prefix & " " & m_excl & " " & dst & " " & src

    dbg deep, "C7Zip.run: " & command 
    set result = runCmd(command)
    if result.code <> 0 then
      echo deep, "[ERROR] " & result.stderr
      call err.Raise(errorExecFailed, "C7Zip.run", "7z.exe failed")
    end if
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
  end sub
end class
