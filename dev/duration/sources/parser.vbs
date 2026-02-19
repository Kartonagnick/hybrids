
'--- local/hybrids                                    [dev/duration][parser.vbs]
'[2026-02-19][14:30:00] 001 Kartonagnick PRE
Option Explicit
' includeVBS("glob.vbs")
' includeVBS("echo.vbs")
' includeVBS("fcontent.vbs")
' includeVBS("date\value.vbs")
' includeVBS("date\durationRU.vbs")

dim gCURFILE, gDEEP
dim gREGEXP1: set gREGEXP1 = new RegExp ' [2026-02-17][08:32 - 10:12][1 час 40 мин] ололо
with gREGEXP1
  .Pattern = "(.*)\[(\d{4}\s*-\s*\d{2}\s*-\s*\d{2})\]\s*\[(\d{2}\s*:\s*\d{2})\s*-\s*(\d{2}\s*:\s*\d{2})\]\s*\[(.*)\](.*)"
  .Global     = false
  .IgnoreCase = true
end with

dim gREGEXP2: set gREGEXP2 = new RegExp
with gREGEXP2
  .Pattern = "(.*\[\d{4}\s*-\s*\d{2}\s*-\s*\d{2}\]\s*\[\d{2}\s*:\s*\d{2}\s*-\s*\d{2}\s*:\s*\d{2}\]\s*)\[(.*)\](.*)"
  .Global     = false
  .IgnoreCase = true
end with

dim gREGEXP3: set gREGEXP3 = new RegExp
with gREGEXP3
  .Pattern = "\[\d{4}\s*-\s*\d{2}\s*-\s*\d{2}\]\s*\[.*\?*-.*\?*\]"
  .Global     = false
  .IgnoreCase = true
end with

class CParser

  public default function init(deep, files)
    run deep, files
    set init = me
  end function

  sub run(deep, files)

    gDEEP = deep
    dim f, line, content, loader
    set loader = new FileContent
    for each f in files
      gCURFILE = f
      dbg deep, "f: " & f
      set content = loader.load(f, "parseLinefromJournalFileMD")
      if gDEBUG then
        for each line in content
          echo deep, "[x] " & line 
        next
      end if
      loader.saveEndl f, content
    next
  end sub

'---[PRIVATE]-------------------------

  private sub Class_Initialize()
  end sub
end class


function parseLinefromJournalFileMD(txt, stop_load)

  if not gREGEXP1.Test(txt) then
    if gREGEXP3.Test(txt) then
      echo gDEEP, "[WARNING] in file: " & gCURFILE
      echo gDEEP, "[WARNING] check syntaxis " & txt
    end if
    exit function
  end if

  dim smth1: set smth1 = gREGEXP1.Execute(txt).Item(0).Submatches
  dim begVal, endVal, begTxt, endTxt, begSec, endSec
  begTxt = smth1.Item(1) & " " & smth1.Item(2) & ":00"
  endTxt = smth1.Item(1) & " " & smth1.Item(3) & ":00"

  dim diff, result
  set begVal = (new DTSValue)(begTxt, nothing)
  set endVal = (new DTSValue)(endTxt, nothing)
  begSec = begVal.posix
  endSec = endVal.posix
  if begSec <= endSec then
    diff = endSec - begSec
    result = ""
  else 
    diff = begSec - endSec
    result = "- "
    echo gDEEP, "[WARNING] in file: " & gCURFILE
    echo gDEEP, "[WARNING] (beg > end) " & txt
  end if
  result = result & durationFromSeconds_RU(diff)

  dim smth2: set smth2 = gREGEXP2.Execute(txt).Item(0).Submatches
  txt = smth2.Item(0) & "[" & result & "]" & smth2.Item(2) 
end function 
