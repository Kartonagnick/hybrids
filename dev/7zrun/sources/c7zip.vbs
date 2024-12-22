
'--- local/hybrids                                        [dev/7zrun][c7zip.vbs]
'[2024-12-22][08:50:00] 001 Kartonagnick PRE
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
