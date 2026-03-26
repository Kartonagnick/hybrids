
'--- local/hybrids                                   [dev/eolcode][settings.vbs]
'[2026-03-26][19:20:00] 001 Kartonagnick    
Option Explicit
' includeVBS("glob.vbs")
' includeVBS("echo.vbs")

class CSettings

  private m_name       'string: name of repo
  private m_dir_work   'string: work  directory
  private m_dir_repo   'string: repo  directory
  private m_dir_stash  'string: stash directory

  property get dir_repo()  dir_repo  = m_dir_repo  end property
  property get dir_stash() dir_stash = m_dir_stash end property
  property get name_repo() name_repo = m_name      end property

  sub showDebug(deep)
    if not gDEBUG then exit sub
    echo deep, "settings: " & m_name
    echo deep + 1, "NAME ........ " & m_name
    echo deep + 1, "DIR WORK .... " & m_dir_work
    echo deep + 1, "DIR STASH ... " & m_dir_stash
    echo deep + 1, "DIR REPO .... " & m_dir_repo
  end sub

'---[PRIVATE]-------------------------

  private function initStashD()

    if not g_fso.FolderExists(m_dir_work) then 
      call err.Raise(errorNotFound, "CSettings.initStashD", "directory not exist. check: '" & m_dir_work & "'")
    end if

    dim oFolderFound: set oFolderFound = checkD(g_fso.GetFolder(m_dir_work))
    if oFolderFound is nothing then 
      m_name = g_fso.GetFileName(m_dir_work)
      m_dir_stash = ""
      exit function
    else
      m_dir_stash = oFolderFound.Path
    end if

    m_dir_stash = g_fso.GetAbsolutePathName(m_dir_stash)
    if not g_fso.FolderExists(m_dir_stash) then 
      call err.Raise(errorNotFound, "CSettings.initStashD", "stash not exist. check: '" & m_dir_stash & "'")
    end if
    m_name = g_fso.GetFileName(m_dir_stash)
  end function 

  private function checkD(oFolder)
    if oFolder.IsRootFolder then
      set checkD = nothing
      exit function
    end if
    dim parent:  set parent = oFolder.ParentFolder
    if parent.Name = "_stash" then
      set checkD = oFolder
      exit function
    end if
    set checkD = checkD(parent)
  end function

  private sub initRepoD()

    if m_dir_stash = empty then 
      m_dir_repo = m_dir_work
    else
      m_dir_repo = m_dir_stash & "\..\..\" & m_name
    end if

    m_dir_repo = g_fso.GetAbsolutePathName(m_dir_repo)
    if not g_fso.FolderExists(m_dir_repo) then 
      call err.Raise(errorNotFound, "CSettings.initRepoD", "repo not found. check: '" & m_dir_repo & "'")
    end if
  end sub 

  private sub initWorkD()
    m_dir_work = g_shell.CurrentDirectory
    m_dir_work = g_fso.GetAbsolutePathName(m_dir_work)
    m_dir_work = fromEnvironment("eDIR_WORK", m_dir_work)
  end sub 

  private sub Class_Initialize()
   initWorkD
   initStashD
   initRepoD
  end sub
end class
