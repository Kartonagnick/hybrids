
'--- local/hybrids                                                 [find_in.vbs]
'[2024-03-09][04:10:00] 003 Kartonagnick    
'[2024-03-07][23:50:00] 002 Kartonagnick
'  --- CastleOfDreams\hybrids                                       [finder.vbs]
'  [2022-03-02][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams\vbs                                        [Find_in.vbs]
'    [2021-08-08][19:00:00] 002 Kartonagnick
'    [2021-08-04][23:30:00] 001 Kartonagnick

' includeVBS("glob.vbs")
' includeVBS("echo.vbs")
' includeVBS("mask.vbs")

class Find_in
  private mDEBUG
  private mHIDE_SKIP
  private mHIDE_SCAN
  private mDIRS_START
  private mFOUND_S
  private mFOUND_D
  private mFOUND_F
  private mRegexpF
  private mRegexpD
  private mRegexpS
  private mONCE
  private mDONE
  private mDEEP
  private mSELF

  public default function init(paths)
    scanDirs = paths
    set init = me
  end function

  property Get dirs()  set dirs  = mFOUND_D     end property
  property Get files() set files = mFOUND_F     end property
  property Let hideSkip(v) mHIDE_SKIP = v       end property
  property Let hideScan(v) mHIDE_SCAN = v       end property
  property Let debug(v)    mDEBUG     = v       end property
  property Let once(v)     mONCE      = v       end property

  property Let scanDirs(v) setList mDIRS_START, v end property

  property Let includeS(v) mRegexpS.include = v end property
  property Let excludeS(v) mRegexpS.exclude = v end property
  property Let includeF(v) mRegexpF.include = v end property
  property Let excludeF(v) mRegexpF.exclude = v end property
  property Let includeD(v) mRegexpD.include = v end property
  property Let excludeD(v) mRegexpD.exclude = v end property

  sub showParams(deep)
    dim dp: dp = deep + 1
    echo deep, ">----------[" & mSELF & "]----------<"
    showArray dp, "DIRS_START", mDIRS_START
    if mHIDE_SKIP then echo dp, "HIDE_SKIP: ON"
    if mHIDE_SCAN then echo dp, "HIDE_SCAN: ON"
    if mDEBUG     then echo dp, "DEBUG: ON"
    if mONCE      then echo dp, "ONCE: ON"
    if noEmpty(mRegexpF.include) then showArray dp, "INCLUDE_F", mRegexpF.include
    if noEmpty(mRegexpF.exclude) then showArray dp, "EXCLUDE_F", mRegexpF.exclude    
    if noEmpty(mRegexpD.include) then showArray dp, "INCLUDE_D", mRegexpD.include
    if noEmpty(mRegexpD.exclude) then showArray dp, "EXCLUDE_D", mRegexpD.exclude    
    if noEmpty(mRegexpS.include) then showArray dp, "INCLUDE_S", mRegexpS.include
    if noEmpty(mRegexpS.exclude) then showArray dp, "EXCLUDE_S", mRegexpS.exclude    
    echo deep, ">----------------------------<"
  end sub

  function run(deep)
    if mDEBUG then showParams deep
    dbgPrint deep, mSELF & ": running..."
    dim d: dim mydeep: mydeep = clear(deep)
    for each d in mDIRS_START
      scan mydeep, d
      if mDONE then 
        dbgScan mydeep, "done"
        exit for
      end if
    next
    dbgPrint deep, mSELF & ": finished"
  end function

'------------------------------------

  private function scan(deep, d_path)
    dim dir: dir = d_path
    dim dp: dp = deep - mDEEP 
    dbgScan deep, "scan(" & dp & "): '" & dir & "'"
    if dir = Empty then
      dbgScan deep, "empty value -> skip"
      exit function
    end if
    
    if not g_fso.FolderExists(dir) then
      dbgScan deep, "not exists"
      exit function
    end if
    
    dim d: set d = g_fso.GetFolder(dir)
    addFiles deep, d
    addDirs  deep, d
    addScan  deep, d
    runMore  deep + 1
    dbgScan  deep, "done(" & dp & ")"
  end function

  private sub addFiles(deep, odir)
    if mDONE then exit sub
    dim f
    for each f in odir.Files
       if mRegexpF.match(f) then
        dbgPrint deep + 1, "f: add: " & f
        mFOUND_F.Add f
        if mONCE then
          mDONE = true
          exit sub
        end if
      else
        dbgSkip deep + 1, "f: skip: " & f
      end if
    next
  end sub

  private sub addDirs(deep, odir)
    if mDONE then exit sub
    dim d
    for each d in odir.SubFolders
       if mRegexpD.match(d) then
        dbgPrint deep + 1, "d: add: " & d
        mFOUND_D.Add d
        if mONCE then
          mDONE = true
          exit sub
        end if
      else
        dbgSkip deep + 1, "d: skip: " & d
      end if
    next
  end sub

  private sub addScan(deep, odir)
    if mDONE then exit sub
    dim d
    for each d in odir.SubFolders
       if mRegexpS.match(d) then
        dbgScan deep + 1, "s: add: " & d
        mFOUND_S.Add(d)
      else
        dbgSkip deep + 1, "s: skip: " & d
      end if
    next
  end sub

  private sub runMore(deep)
    if mFOUND_S.Count = 0 then exit sub
    dbgScan deep, "more: " & mFOUND_S.Count
    dim cur: dim dir: set cur = mFOUND_S.Clone()
    mFOUND_S.Clear
    for each dir in cur
      scan deep, dir
      if mDONE then 
        dbgScan deep + 1, "done."
        exit sub
      end if
    next
  end sub
'---
  sub exitByAssert(from, desc)
    WScript.Echo "[ERROR][ASSERT] Find_IN: " & from & ": " & desc
    WScript.Quit 1
  end sub
'---
  private sub setList(dst, v)
    dst.clear
    if IsNull(v) then
      exit sub
    elseif isArray(v) then
       trimList dst, v
    elseif IsObject(v) then
      if v is nothing then
        exit sub
      elseif typename(v) = "ArrayList" then
         trimList dst, v
      else
        exitByAssert "Find_IN.setlist", "unexpected: " & typename(v)
      end if
    elseif vartype(v) = vbEmpty then
      exit sub
    elseif vartype(v) = vbString then
      if v = Empty then
        exit sub
      else
        setList dst, split(v, ";")
        exit sub
      end if
    else                                      
      exitByAssert "Find_IN.setlist", "unexpected: " & typename(v)
    end if
  end sub

  private sub trimList(dst, lst)
    dim el: dim map: set map = CreateObject("Scripting.Dictionary")
    for each el in lst
      el = trim(el)
      if el <> Empty then
        map(el) = 1
      end if
    next
    dst.clear
    for each el in map
      dst.add el 
    next 
  end sub

  private function noEmpty(collect)
    if collect.count <> 0 then
      noEmpty = true
    else
      noEmpty = false
    end if
  end function
  
  private sub showArray(deep, name, collect)
    echo deep, name
    if collect.count = 0 then
      echo deep + 1, "(empty)"
    else
      dim el: dim idx: idx = 1
      for each el in collect
        echo deep + 1, idx & ") " & el
        idx = idx + 1
      next
    end if
  end sub

  private function dbgPrint(deep, text)
    if mDEBUG then 
      echo deep, text  
    end if
  end function

  private function dbgScan(deep, text)
    if mDEBUG and not mHIDE_SCAN then 
      echo deep, text  
    end if
  end function

  private function dbgSkip(deep, text)
    if mDEBUG and not mHIDE_SKIP then 
      echo deep, text  
    end if
  end function

  private function clear(deep)
    mFOUND_S.Clear
    mFOUND_D.Clear
    mFOUND_F.Clear
    mDONE = false
    mDEEP = deep
    if mHIDE_SCAN then
      clear = deep
    else
      clear = deep + 1
    end if
  end function

  private sub Class_Initialize()
    mSELF = typename(me)
    mHIDE_SKIP = false
    mHIDE_SCAN = false
    mDEBUG     = false

    set mDIRS_START = CreateObject("System.Collections.ArrayList")
    set mFOUND_S    = CreateObject("System.Collections.ArrayList")
    set mFOUND_D    = CreateObject("System.Collections.ArrayList")
    set mFOUND_F    = CreateObject("System.Collections.ArrayList")

    set mRegexpF = new MaskExp
    set mRegexpD = new MaskExp
    set mRegexpS = new MaskExp
  end sub
end class
