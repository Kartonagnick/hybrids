
'--- local/hybrids                                  [dev/duration][settings.vbs]
'[2026-02-19][14:30:00] 001 Kartonagnick    
Option Explicit
' includeVBS("glob.vbs")
' includeVBS("echo.vbs")
' includeVBS("mask.vbs")
' includeVBS("find_in.vbs")

class CSettings

  private m_name_root 'string: name of root
  private m_dir_work  'string: work directory
  private m_dir_root  'string: root directory

  property get dir_work()  dir_work  = m_dir_work  end property
  property get dir_root()  dir_root  = m_dir_root  end property
  property get name_root() name_root = m_name_root end property

  property get files(deep) 
    dim oFind: set oFind = (new Find_in)(m_dir_root)
    with oFind
      .includeS = fromEnv("INCLUDE_SCAN" , ""  )
      .excludeS = fromEnv("EXCLUDE_SCAN" , "_*")
      .includeF = fromEnv("INCLUDE_FILES", "????-??-*.md" )
      .excludeF = fromEnv("EXCLUDE_FILES", "_*")
      .includeD = fromEnv("INCLUDE_DIRS" , ""  )
      .excludeD = fromEnv("EXCLUDE_DIRS" , "_*")
    end with

    oFind.run deep
    set files = oFind.files()
  end property

  sub showDebug(deep)
    if not gDEBUG then exit sub
    echo deep, "settings: " & m_name_root
    echo deep + 1, "START ... " & m_dir_work
    echo deep + 1, "ROOT .... " & m_dir_root
  end sub

'---[PRIVATE]-------------------------

  private function fromEnv(name, def)
    dim v: v = g_env.Item(name)
    if v = empty then
      fromEnv = def
    else
      fromEnv = v
    end if
  end function

  private function checkD(oFolder)
    if g_fso.FileExists(oFolder.Path & "\project.root") then 
      set checkD = oFolder
      exit function
    end if
    if oFolder.IsRootFolder then
      set checkD = nothing
      exit function
    end if
    set checkD = checkD(oFolder.ParentFolder)
  end function
  
  private function initRootD()
    if not g_fso.FolderExists(m_dir_work) then 
      call err.Raise(errorNotFound, "CSettings.initRootD", "directory not exist. check: '" & m_dir_work & "'")
    end if
    dim oFolderFound: set oFolderFound = checkD(g_fso.GetFolder(m_dir_work))
    if oFolderFound is nothing then 
      call err.Raise(errorNotFound, "CSettings.initRootD", "project.root not found. check: '" & m_dir_work & "'")
    end if
    m_dir_root  = oFolderFound.Path
    m_dir_root  = g_fso.GetAbsolutePathName(m_dir_root)
    m_name_root = g_fso.GetBaseName(m_dir_root)
  end function 

  private sub initWorkD()
    m_dir_work = g_shell.CurrentDirectory
    m_dir_work = g_fso.GetAbsolutePathName(m_dir_work)
    m_dir_work = fromEnv("eDIR_WORK", m_dir_work)
  end sub 

  private sub Class_Initialize()
   initWorkD
   initRootD
  end sub
end class
