
'--- local/hybrids                                    [dev/vsscan][settings.vbs]
'[2026-01-30][11:50:00] 001 Kartonagnick PRE
Option Explicit
' includeVBS("glob.vbs")
' includeVBS("echo.vbs")
' includeVBS("mask.vbs")
' includeVBS("find_in.vbs")

class CSettings

  private m_name       'string: name of repo
  private m_dir_work   'string: work  directory
  private m_dir_repo   'string: repo  directory
  private m_dir_stash  'string: stash directory
  private m_solutions  'ArrayList: list of solutions Visual Studio

  property get dir_repo()  dir_repo  = m_dir_repo  end property
  property get dir_stash() dir_stash = m_dir_stash end property
  property get name_repo() name_repo = m_name      end property
  property get solutions() set solutions = m_solutions end property

  sub showDebug(deep)
    if not gDEBUG then exit sub
    echo deep, "settings: " & m_name
    echo deep + 1, "NAME ........ " & m_name
    echo deep + 1, "DIR WORK .... " & m_dir_work
    echo deep + 1, "DIR STASH ... " & m_dir_stash
    echo deep + 1, "DIR REPO .... " & m_dir_repo
    if m_solutions.Count = 0 then 
      echo deep + 1, "SOLUTIONS.... not found"
    else
      echo deep + 1, "SOLUTIONS:"
      dim f
      for each f in m_solutions
        echo deep + 2, "- " & f
      next
    end if
  end sub

'---[PRIVATE]-------------------------

  private function initStashD()
      if not g_fso.FolderExists(m_dir_work) then 
        call err.Raise(errorNotFound, "CSettings.initStashD", "directory not exist. check: '" & m_dir_work & "'")
      end if
      dim oFolderFound: set oFolderFound = checkD(g_fso.GetFolder(m_dir_work))
      if oFolderFound is nothing then 
        call err.Raise(errorNotFound, "CSettings.initStashD", "stash not found. check: '" & m_dir_work & "'")
      end if
      m_dir_stash = oFolderFound.Path
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
    m_dir_repo = m_dir_stash & "\..\..\" & m_name
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

  private sub initSolutionList
    dim dirs_start: set dirs_start = CreateObject("System.Collections.ArrayList")
    dirs_start.add m_dir_repo & "\build"
    dirs_start.add m_dir_repo & "\deploy"
    dim oFind: set oFind = (new Find_in)(dirs_start)
    oFind.excludeS = "_*; .git"
    oFind.includeD = ""
    oFind.excludeD = "*"
    oFind.includeF = "*.sln"
    oFind.excludeF = "_*"
    oFind.run 1
    set m_solutions = oFind.files()
  end sub 

  private sub Class_Initialize()
   initWorkD
   initStashD
   initRepoD
   initSolutionList
  end sub
end class
