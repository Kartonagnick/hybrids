
'--- local/hybrids                                    [dev/vsscan][solution.vbs]
'[2026-01-30][11:50:00] 001 Kartonagnick    
Option Explicit
' includeVBS("glob.vbs")
' includeVBS("echo.vbs")
' includeVBS("unquote.vbs")
' includeVBS("fcontent.vbs")

class CSolution

  private m_dir_repo       'string: repo  directory
  private m_path_solution  'string: path to solution
  private m_paths_projects 'ArrayList: paths to project.vcxproj

  property get dir_repo() dir_repo     = m_dir_repo       end property
  property get solution() solution     = m_path_solution  end property
  property get projects() set projects = m_paths_projects end property

  public default function init(dir_repo, path_solution)
    initialize dir_repo, path_solution
    set init = me
  end function

  sub showDebug(deep)
    if not gDEBUG then exit sub
    'echo deep, "settings: " & m_name
    'echo deep + 1, "NAME ........ " & m_name
  end sub

'---[PRIVATE]-------------------------

  private sub initialize(dir_repo, path_solution)
    m_dir_repo      = g_fso.GetAbsolutePathName(dir_repo)
    m_path_solution = g_fso.GetAbsolutePathName(path_solution)

    if not g_fso.FolderExists(m_dir_repo) then 
      call err.Raise(errorNotFound, "CSolution.initialize", "dir.repo not exist. check: '" & m_dir_repo & "'")
    end if

    if not g_fso.FileExists(m_path_solution) then 
      call err.Raise(errorNotFound, "CSolution.initialize", "path.solution not exist. check: '" & m_path_solution & "'")
    end if

    findProjects 
  end sub

  private sub findProjects
    m_paths_projects.clear
    dim dir_solution, loader, line, content 
    dir_solution = g_fso.GetParentFolderName(m_path_solution)
    set loader = new FileContent

   'echo 1, "load: " & m_path_solution
    set content = loader.load(m_path_solution, "parseLinefromSolution")
    for each line in content
      line = dir_solution & "\" & line
      line = g_fso.GetAbsolutePathName(line)
      m_paths_projects.add line 
     'echo 2, "found: " & line 
    next
  end sub 

  private sub Class_Initialize()
    m_dir_repo      = "" 
    m_path_solution = ""
    set m_paths_projects = CreateObject("System.Collections.ArrayList")
  end sub
end class

function parseLinefromSolution(txt, stop_load)

  dim pos: pos = instr(1, txt, "Global", 0)
  if pos > 0 then 
    parseLinefromSolution = false
    stop_load = true
    exit function
  end if

  pos = instr(1, txt, "Project(", 0)
  if pos < 1 then 
    parseLinefromSolution = false
    exit function
  end if

  parseLinefromSolution = true
  dim arr: arr = split(txt, ",")
  txt = unquote(trim(arr(1)))
end function 
