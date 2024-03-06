
'--- local/hybrids                                                 [symptom.vbs]
'[2024-03-06][06:20:00] 002 Kartonagnick    
'  --- CastleOfDreams\hybrids                                      [symptom.vbs]
'  [2021-12-22][19:00:00] 002 Kartonagnick
'  [2021-12-20][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams\vbs                                        [symptom.vbs]
'    [2021-08-02][23:30:00] 001 Kartonagnick

' includeVBS("errCode.vbs")
' includeVBS("glob.vbs")
' includeVBS("echo.vbs")
' includeVBS("mask.vbs")

class FindBySymptoms
  private m_symptoms
  private m_show_directory
  private m_show_symptoms
  private m_show_skipped
  private m_show_matched

  private m_deep_directory
  private m_deep_symptoms
  private m_deep_skipped
  private m_deep_matched

  public default function init(list)
    me.addSymptoms list
    set init = me
  end function

  property Let debug(v)          m_show_directory = true  end property
  property Let showDirectory(v)  m_show_directory = v     end property
  property Let showSymptoms(v)   m_show_symptoms  = v     end property
  property Let showSkipped(v)    m_show_skipped   = v     end property
  property Let showMatched(v)    m_show_matched   = v     end property

  sub addSymptoms(list)
    dim arr: dim collect: dim elem: dim rx
    if vartype(list) = vbString then
      if list <> Empty then
        arr = Split(list, ";", -1, 0)
        addSymptoms arr
      end if
    else
      set collect = CreateObject("System.Collections.ArrayList")
      for each elem in list
        elem = trim(elem)
        if elem <> Empty then
          rx = maskToregexp(elem) 
          collect.add(rx)
        end if
      next
      if collect.count > 0 then
        m_symptoms.add collect
      end if
    end if
  end sub

  function find(deep, path)
    checkStart deep, path
    prepare deep

    if typename(path) = "Folder" then
      find = checkD(deep, path)
    else 
      find = checkD(deep, g_fso.GetFolder(path))
    end if
  end function

'------ private ---------------------

  private sub checkStart(deep, path)
    dim self
    if m_show_directory or m_show_symptoms or m_show_skipped or m_show_matched then
      echo deep, "FindBySymptoms: " & path
    end if
    if m_symptoms.count = 0 then 
      self = typename(me) & ".find"
      call err.Raise(errorEmptyData, self, "symptoms not specified")
    end if
    if not g_fso.FolderExists(path) then
      self = typename(me) & ".find"
      call err.Raise(errorNotExist, self, "directory not found: '" & path & "'")
    end if
  end sub 

  private sub prepare(deep)
    if m_show_directory then
      m_deep_directory = 1
    end if
    if m_show_symptoms then
      m_deep_symptoms = m_deep_directory + 1
    else 
      m_deep_symptoms = m_deep_directory
    end if
    m_deep_skipped  = m_deep_symptoms + 1
    m_deep_matched  = m_deep_symptoms + 1
    dim s: dim list: dim i: i = 1
    if m_show_symptoms then
      for each list in m_symptoms
        for each s in list
          echo deep + m_deep_symptoms, "symptom(" & i & "): " & s
        next
        i = i + 1
      next
    end if
    if m_show_skipped then
      'nothing
    else
      m_show_symptoms = false
    end if
  end sub 

  private sub Class_Initialize()
    set m_symptoms = CreateObject("System.Collections.ArrayList")
    m_show_directory = false : m_deep_directory = 0
    m_show_symptoms  = false : m_deep_symptoms  = 0
    m_show_skipped   = false : m_deep_skipped   = 0
    m_show_matched   = false : m_deep_matched   = 0
  end sub

  private sub dbgMatched(deep, name, it, symptom)
    if m_show_matched then
      echo deep + m_deep_matched, name & ": " & it.Name & " -> MATCHED by '" & symptom & "'"
    end if
  end sub 

  private sub dbgSkipped(deep, name, it, symptom)
    if m_show_skipped then
      echo deep + m_deep_skipped, name & ": " & it.Name & " -> SKIPPED by '" & symptom & "'"
    end if
  end sub 

  private function fcheck(deep, flist, symptoms, name)
    dim i: dim it: dim symptom
    for each it in flist
      i = 0
      for each symptom in symptoms
        if matchByRegexp(it.Name, symptom) then
          dbgMatched deep, name, it, symptom
          if symptoms.count = 1 then
            fcheck = true
            exit function
          else
            symptoms.removeAt(i)
            exit for
          end if
        else
          dbgSkipped deep, name, it, symptom
        end if
        i = i +1
      next
    next
    fcheck = false
  end function

  private function checkS(deep, idx, oFolder, symptoms)
    if m_show_directory and idx = 1 then 
      echo deep + m_deep_directory, "check: " & oFolder.path
    end if
    dim s
    if m_show_symptoms then
      for each s in symptoms
        echo deep + m_deep_symptoms, "symptom: " & s
      next
    end if
    checkS = fcheck(deep, oFolder.SubFolders, symptoms, "d")
    if checkS then exit function
    checkS = fcheck(deep, oFolder.Files, symptoms, "f")
  end function

  private function checkD(deep, oFolder)
    dim symptoms: dim list: dim i: i = 0
    for each symptoms in m_symptoms
      i = i + 1
      set list = symptoms.Clone 
      if checkS(deep, i, oFolder, list) then
        checkD = oFolder
        exit function
      end if
    next
    if oFolder.IsRootFolder then
      exit function
    end if
    checkD = checkD(deep, oFolder.ParentFolder)
  end function
end class
