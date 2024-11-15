
'--- local/hybrids                                        [sources][tooltip.vbs]
'[2024-11-16][12:40:00] 001 Kartonagnick PRE

Option Explicit

'---[ g_fso.OpenTextFile(path, gFOR_READING) ]----------------------------------

Const gFOR_READING = 1
Const gFOR_WRITING = 2

'---[ADODB.Stream]--------------------------------------------------------------

Const gCRLF = -1   'Default. Carriage return line feed 
Const gLF   = 10   'Line feed only
Const gCR   = 13   'Carriage return only

const gCREATE_NOT_EXIST = 1
const gCREATE_OVERWRITE = 2

const gTYPE_BIN = 1
const gTYPE_TXT = 2

'...............................................................................

function getWorkDirectory()
  dim fp: dim d_cur: dim d_work
  fp = WScript.ScriptFullName
  d_cur  = g_fso.GetParentFolderName(fp)
  d_work = fromEnvironment("eDIR_WORK", d_cur)
  d_work = g_fso.GetAbsolutePathName(d_work)
  getWorkDirectory = d_work
end function 

function checkFileExistMD(deep, path)
  if (g_fso.FileExists(path)) then
    checkFileExistMD = true
  else
    checkFileExistMD = false
    echo deep, "not found: tooltip.md"
    echo deep, "check: " & path
  end if
end function 

function checkFileExist(deep, path)
  if (g_fso.FileExists(path)) then
    checkFileExist = true
  else
    checkFileExist = false
    echo deep, "not found: " & path
  end if
end function 

function detectEOL(path)
  dim f_stream, content, symbol, pos
  set f_stream = g_fso.OpenTextFile(path, gFOR_READING)
  content = f_stream.ReadAll()
  pos = instr(content, vbLF)
  if pos = 1 then
    detectEOL = gLF
  elseif pos > 0 then
    symbol = Mid(content, pos - 1, 1)
    if symbol = vbCR then
      detectEOL = gCRLF
    else
      detectEOL = gLF
    end if
  else
    detectEOL = gCRLF
  end if
end function

'...............................................................................

class Tooltip
  private m_deep
  private m_file
  private m_dict
  private m_rgxp
  private m_class
  private m_eol

  public default function init(d, path)
    deep = d
    file = path
    eol  = path
    set init = me
  end function

  property Get eol()   eol    = m_eol        end property
  property Get file()  file   = m_file       end property
  property Let file(v) m_file = v            end property
  property Let deep(v) m_deep = v            end property
  property Let eol(v)  m_eol  = detectEOL(v) end property

  sub add(line)
    dim matches, submatches, jpg, txt
    set matches = m_rgxp.Execute(line)
    if matches.Count > 0 then
      set submatches = matches.item(0).SubMatches
      jpg = submatches.Item(0)
      txt = submatches.Item(1)
      dbg m_deep, "Tooltip.add(" & txt & "): '" & jpg & "'"
      m_dict(txt) = jpg
    end if
  end sub

  function parse(line)
    dbg m_deep, "Tooltip.parse(LINE): '" & line & "'"
    dim matches, submatches, ids, txt, k, v, pos, result
    set result = CreateObject("System.Collections.ArrayList")  
    set parse = result
    set matches = m_class.Execute(line)
    if matches.Count > 0 then
      set submatches = matches.item(0).SubMatches
      ids = submatches.Item(0)
      txt = submatches.Item(1)
      dbg m_deep, "Tooltip.parse(" & ids & "): '" & txt & "'"
      for each k in m_dict
       'dbg m_deep + 1, "Tooltip.parse('" & txt & "'): key = '" & k & "'"
        if instr(1, txt, k, 0) > 0 then
          v = m_dict(k)
          dbg m_deep + 1, " -l- " & line
          dbg m_deep + 1, " -t- " & txt
          dbg m_deep + 1, " -k- " & k
          dbg m_deep + 1, " -v- " & v
          result.add ("")
          result.add ("<div class=""tooltip""" & ids & ">")
          result.add ("  <h3>" & txt & "</h3>")
          result.add ("  <p><img src=""" & v & """></p>")
          result.add ("</div>")
          result.add ("")
          exit function
        end if
      next
    end if
  end function

'---
  private sub Class_Initialize()
    m_deep = 0
    m_file = empty
    m_eol  = gCRLF

    set m_rgxp = new RegExp
    m_rgxp.Pattern     = "([^\s]+[\s]*[^\s]*\.jpg)\s*:\s*(.*)"
    m_rgxp.IgnoreCase  = true
    m_rgxp.Global      = false
    m_rgxp.Multiline   = false

    set m_class = new RegExp
    m_class.Pattern    = "<div class=""tooltip""([^>]*)>(.*)<\/div>"
    m_class.IgnoreCase = true
    m_class.Global     = true
    m_class.Multiline  = false

    set m_dict = CreateObject("Scripting.Dictionary")
  end sub
end class

function parseTooltipMD(deep, path)
  echo deep, "parse: " & path
  dim d_work: d_work = g_fso.GetParentFolderName(path)
  dim f_stream, line, is_html, is_jpg, list, obj, count
  set list = CreateObject("System.Collections.ArrayList")  

  set is_html = new RegExp
  is_html.Pattern    = "([^\s]+[\s]*[^\s]*\.html)"
  is_html.IgnoreCase = true
  is_html.Global     = false
  is_html.Multiline  = false

  set is_jpg = new RegExp
  is_jpg.Pattern    = "([^\s]+[\s]*[^\s]*\.jpg)"
  is_jpg.IgnoreCase = true
  is_jpg.Global     = false
  is_jpg.Multiline  = false

  set f_stream = CreateObject("ADODB.Stream")
  f_stream.LineSeparator = detectEOL(path)
  f_stream.CharSet = "utf-8"
  f_stream.Open
  f_stream.LoadFromFile(path)

  do while not f_stream.EOS
    line = trim(f_stream.ReadText(-2))
    if is_html.Test(line) then
      line = d_work & "\" & line
      dbg deep + 1, "html: '" & line & "'"
      set obj = (new Tooltip)(deep, line)
      list.add(obj)
    else
      if is_jpg.Test(line) then
        dbg deep + 1, "jpg : '" & line & "'"
        if list.count <> 0 then
          set obj = list.Item(list.count - 1) 
          obj.add line
        end if
      end if
    end if
  loop
  set parseTooltipMD = list
end function


function doTask(deep, obj)
  dim skipped: skipped = 0
  dim f_stream, line, content, sections, elem
  set content = CreateObject("System.Collections.ArrayList")
  set doTask = content
  if not checkFileExist(deep, obj.file) then
    exit function
  end if
  dbg deep, "[process] '" & obj.file & "'"

  set f_stream = CreateObject("ADODB.Stream")
  f_stream.LineSeparator = obj.eol
  f_stream.CharSet = "utf-8"
  f_stream.Open
  f_stream.LoadFromFile(obj.file)

  do while not f_stream.EOS
    line = trim(f_stream.ReadText(-2))
    if instr(1, line, "class=""tooltip""", 0) > 0 then
      set sections = obj.parse(line)
      if sections.count > 0 then
        for each elem in sections
          content.add elem
        next
      else
        skipped = skipped + 1
        dbg deep, "[skipped][" & line & "]"
        content.add line
      end if
    else
      content.add line
    end if
  loop

  f_stream.close

  echo deep, "skipped: " & skipped
  set doTask = content
end function

sub saveContent(deep, obj, content)
  dim path, line, eol, utf8, no_bom 

  path = obj.file & ".html"
  echo deep, "save: " & path

  set utf8 = CreateObject("ADODB.Stream")
  utf8.LineSeparator = obj.eol
  utf8.CharSet = "utf-8"
  utf8.Type = gTYPE_TXT
  utf8.Open

  if obj.eol = gCRLF then
    eol = vbCrLf
  else
    eol = vbLf
  end if
  for each line in content
    utf8.WriteText(line & eol)
  next
  utf8.Position = 3

  set no_bom = CreateObject("ADODB.Stream")
  no_bom.Type = gTYPE_BIN
  no_bom.Open
  utf8.CopyTo no_bom
  no_bom.SaveToFile path, gCREATE_OVERWRITE

  no_bom.close
  utf8.close
end sub

'...............................................................................

sub main()
  dim d_work, f_tooltip, mark, eol, list, f, content 

  echo 0, "beg: " & datestamp()
  set mark = new Elapsed

  d_work = getWorkDirectory()
  f_tooltip = d_work & "\tooltip.md"

  if not checkFileExistMD(1, f_tooltip) then
    exit sub
  end if

  set list = parseTooltipMD(1, f_tooltip)
  for each f in list
    set content = doTask(1, f)
    saveContent 1, f, content
  next

  echo 0, "end: " & datestamp() 
  echo 0, "elapsed: " & mark.value()
end sub

main()
