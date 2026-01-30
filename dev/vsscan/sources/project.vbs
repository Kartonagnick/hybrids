
'--- local/hybrids                                     [dev/vsscan][project.vbs]
'[2026-01-30][11:50:00] 001 Kartonagnick PRE
Option Explicit
' includeVBS("glob.vbs")
' includeVBS("echo.vbs")
' includeVBS("mask.vbs")
' includeVBS("find_in.vbs")
' includeVBS("fcontent.vbs")

class CProject
  private m_dir_repo     'string: dir of repository
  private m_file_vcxproj 'string: dir of project.vcxproj
  private m_dir_vcxproj  'string: dir of project.vcxproj
  private m_dir_project  'string: dir of sources code 
  private m_dir_include  'string: dir of sources code 
  private m_dir_sources  'string: dir of sources code 

  private m_name         'string: name of project
  private m_valid        'boolean: is the project compatible with banana project

  private m_from_include 'ArrayList: list of include\*
  private m_from_sources 'ArrayList: list of <source>\*
  private m_from_project 'ArrayList: list of <project>\*

  property get valid() valid = m_valid  end property

  public default function init(deep, d_repo, f_vcxproj)
    initialize deep, d_repo, f_vcxproj
    set init = me
  end function
   
  sub run(deep)
    if not m_valid then
      dbg deep, "skip: " & m_file_vcxproj
      exit sub
    end if 
    dbg deep, "runned: " & m_file_vcxproj

    make_filters_props deep
    make_sources_props deep
  end sub

  sub make_sources_props(deep)
    if not m_valid then exit sub
    dim f_result: f_result = m_dir_vcxproj & "\sources.props"
    echo deep, "save: " & f_result
    dim content: set content = CreateObject("System.Collections.ArrayList")
    content.add "<?xml version=""1.0"" encoding=""utf-8""?>"
    content.add "<Project DefaultTargets=""Build"" xmlns=""http://schemas.microsoft.com/developer/msbuild/2003"">"
    add_content content, "$(gDIR_INCLUDE)", m_dir_include, m_from_include
    add_content content, "$(gDIR_SOURCES)", m_dir_sources, m_from_sources
    add_content content, "$(gDIR_PROJECT)", m_dir_project, m_from_project
    content.add "</Project>"
    dim storage: set storage = new FileContent
    storage.save f_result, content
  end sub

  private sub add_content(content, tag_root, root_files, list_files)
    if list_files.Count = 0 then exit sub
    dim path, action
    content.add("  <ItemGroup>")
    for each path in list_files
      path = relativePath(root_files, path)
      action = getAction(path)
      if action <> "ResourceCompile" then
        content.add("    <" & action & " Include = """ & tag_root & "\" & path & """ />")
      end if
    next
    content.add("  </ItemGroup>")
  end sub

  sub make_filters_props(deep)
    if not m_valid then exit sub
    dim f_result: f_result = m_dir_vcxproj & "\" & m_name & ".vcxproj.filters"
    echo deep, "save: " & f_result
    dim content: set content = CreateObject("System.Collections.ArrayList")
    content.add "<?xml version=""1.0"" encoding=""utf-8""?>"
    content.add "<Project DefaultTargets=""Build"" xmlns=""http://schemas.microsoft.com/developer/msbuild/2003"">"
    make_filters  content
    content.add "</Project>"
    dim storage: set storage = new FileContent
    storage.save f_result, content
  end sub

  private sub make_filters(content)
    if m_from_include.count = 0 then
      if m_from_sources.count = 0 then
        if m_from_project.count = 0 then
          exit sub
        end if
      end if
    end if

    content.add("  <ItemGroup>")
    make_filter content, m_dir_include, m_from_include
    make_filter content, m_dir_sources, m_from_sources
    make_filter content, m_dir_project, m_from_project
    content.add("  </ItemGroup>")

    add_filter_content content, "$(gDIR_INCLUDE)", m_dir_include, m_from_include
    add_filter_content content, "$(gDIR_SOURCES)", m_dir_sources, m_from_sources
    add_filter_content content, "$(gDIR_PROJECT)", m_dir_project, m_from_project
  end sub  

  private function get_filter_from(file)
    get_filter_from = relativePath(m_dir_project, file)
    get_filter_from = g_fso.GetParentFolderName(get_filter_from)
  end function

  private sub make_filter(content, d_root, files)
    if files.Count = 0 then exit sub
    dim first: first = relativePath(m_dir_project, d_root)
    dim file, dir, dict: set dict = CreateObject("Scripting.Dictionary")
    if first <> empty then
      dict.add first, 1
    end if
    for each file in files
      dir = get_filter_from(file)
      if dir <> empty and not dict.Exists(dir) then
        dict.add dir, 1
        do 
          dir = g_fso.GetParentFolderName(dir)
          if dir <> empty and not dict.Exists(dir) then
            dict.add dir, 1
          end if
        loop while (dir <> Empty)
      end if
    next

    dim sorted: set sorted = CreateObject("System.Collections.ArrayList")
    for each dir in dict.keys()
      sorted.add dir
    next
    sorted.sort

    for each dir in sorted
      content.add("    <Filter Include = """ & dir & """ />")
    next
  end sub

  private sub add_filter_content(content, tag_root, root_files, list_files)
    if list_files.Count = 0 then exit sub
    dim dir, file, action
    content.add("  <ItemGroup>")
    for each file in list_files
      dir = get_filter_from(file)
      file = relativePath(root_files, file)
      action = getAction(file)
      if action <> "ResourceCompile" then
        if dir <> empty then
          content.add("    <" & action & " Include = """ & tag_root & "\" & file & """ >")
          content.add("      <Filter>" & dir & "</Filter>")
          content.add("    </" & action & ">")
        end if
      end if
    next
    content.add("  </ItemGroup>")
  end sub

'---[PRIVATE]-------------------------

  private sub initialize(deep, d_repo, f_vcxproj) 
    dbg deep, "check: " & f_vcxproj
    m_dir_repo     = g_fso.GetAbsolutePathName(d_repo)
    m_file_vcxproj = g_fso.GetAbsolutePathName(f_vcxproj)
    m_dir_vcxproj  = g_fso.GetParentFolderName(f_vcxproj)
    m_name         = g_fso.GetBaseName(m_dir_vcxproj)
    m_dir_project  = m_dir_repo & "\" & m_name
   
    check_paths_exist
    if not check_valid(deep) then exit sub

    dim name_include, name_source, dirs_start
    if is_sepparated() then
      detect_structure name_include, name_source
      dirs_start = m_dir_project
    else
      detect_structure name_include, name_source
      set dirs_start = CreateObject("System.Collections.ArrayList")
      dirs_start.add m_dir_include
      dirs_start.add m_dir_sources
    end if

    find_sources deep, dirs_start, name_include, name_source

  end sub

  private sub check_paths_exist()
    if not g_fso.FolderExists(m_dir_repo) then 
      call err.Raise(errorNotFound, "CProject.initialize", "dir.repo not exist. check: '" & m_dir_repo & "'")
    end if
    if not g_fso.FileExists(m_file_vcxproj) then 
      call err.Raise(errorNotFound, "CProject.initialize", "file.vcxproj not exist. check: '" & m_file_vcxproj & "'")
    end if
    if not g_fso.FolderExists(m_dir_vcxproj) then 
      call err.Raise(errorNotFound, "CProject.initialize", "dir.vcxproj not exist. check: '" & m_dir_vcxproj & "'")
    end if
  end sub

  private function check_valid(deep)
    dim line, content, loader: set loader = new FileContent
    set content = loader.load(m_file_vcxproj, "parseLineFromVcxproj")
    if content.count > 0 then
      m_valid = true    
    else
      dbg deep, "[WARNING] detected incompatible project: " & m_name 
      m_valid = false
    end if
    check_valid = m_valid
  end function

  private function is_sepparated()
    if g_fso.FolderExists(m_dir_project) then 
      is_sepparated = true
    else
      is_sepparated = false
      m_dir_project = m_dir_repo
    end if
  end function

  private sub detect_structure(name_include, name_source)
    if g_fso.FolderExists(m_dir_project & "\include") then 
      m_dir_include = m_dir_project & "\include"
      name_include = "include"
    end if

    if g_fso.FolderExists(m_dir_project & "\sources") then 
      m_dir_sources = m_dir_project & "\sources"
      name_source = "sources"
    elseif g_fso.FolderExists(m_dir_project & "\src") then 
      m_dir_sources = m_dir_project & "\src"
      name_source = "src"
    elseif g_fso.FolderExists(m_dir_project & "\source") then 
      m_dir_sources = m_dir_project & "\source"
      name_source = "source"
    else
      m_dir_sources = m_dir_project
      name_source = ""
    end if
  end sub

  private sub find_sources(deep, dirs_start, name_include, name_source)
    dim oFind: set oFind = (new Find_in)(dirs_start)
   'ofind.debug = true
   'ofind.hideSkip = true
   'ofind.hideSkip = true

    oFind.excludeS = "_*; .git"
    oFind.excludeD = "*"
    oFind.includeF = "*"
    oFind.excludeF = "_*"
    oFind.run deep
    
    dim d_include: d_include = m_dir_project & "\" & name_include
    dim d_sources: d_sources = m_dir_project & "\" & name_source
    dim pos, f, files: set files = oFind.files()
    for each f in files
      if instr(1, f, d_include, 0) = 1 then 
        dbg deep, "from " & name_include & ": " & f
        m_from_include.add f
      elseif instr(1, f, d_sources, 0) = 1 then 
        dbg deep, "from " & name_source & ": " & f
        m_from_sources.add f
      else
        dbg deep, "from project: " & f
        m_from_project.add f
      end if
    next 
  end sub

  private function getAction(file)
    dim ext: ext = g_fso.GetExtensionName(file)
    if ext = "hpp" or ext = "h" or ext = "hxx" or ext = "ver" then 
      getAction = "ClInclude"
    elseif ext = "cpp" or ext = "c" or ext = "cxx" then 
      getAction = "ClCompile"
    elseif ext = "def" then 
      getAction = "CustomBuild"
    elseif ext = "rc" then 
      getAction = "ResourceCompile"
    else 
      getAction = "None"
    end if
  end function

  private sub makeRelative(root, list)
   dim p, tmp: set tmp = CreateObject("System.Collections.ArrayList")
   for each p in list
     tmp.add relativePath(root, p)
   next
    list.clear
    for each p in tmp
      list.Add p
    next
  end sub

  private sub moveElement(src, dst, oMask)
    dim file, others: set others = CreateObject("System.Collections.ArrayList")
    for each file in m_list_any
      if oMask.match(g_fso.GetFile(file).Name) then 
        dst.Add file
      else
        others.Add file
      end if
    next
    src.clear
    for each file in others
      src.Add file
    next
  end sub

  private sub Class_Initialize()
    set m_from_include = CreateObject("System.Collections.ArrayList")
    set m_from_sources = CreateObject("System.Collections.ArrayList")
    set m_from_project = CreateObject("System.Collections.ArrayList")
  end sub
end class

function parseLineFromVcxproj(txt, stop_load)
  parseLineFromVcxproj = false
  dim pos: pos = instr(1, txt, "<Import Project", 0)
  if pos < 1 then exit function
  pos = instr(1, txt, "sources.props", 0)
  if pos < 1 then exit function
  parseLineFromVcxproj = true
  stop_load = true
end function 
