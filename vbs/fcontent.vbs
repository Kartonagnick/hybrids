
'--- local/hybrids                                                [fcontent.vbs]
'[2025-01-13][13:00:00] 001 Kartonagnick PRE
' includeVBS("glob.vbs")
' includeVBS("mask.vbs")

class FileContent
  private adCRLF            ' -1 Default. Carriage return line feed 
  private adLF              ' 10 Line feed only
  private adCR              ' 13 Carriage return only
  private FOR_READING       '  1
  private FOR_WRITING       '  2
  private CREATE_NOT_EXIST  '  1
  private CREATE_OVERWRITE  '  2
  private READ_LINE         ' -2
  private READ_ALL          ' -1
  private TYPE_BIN          '  1
  private TYPE_TXT          '  2

  private m_content        'ArrayList: content of file
  private m_eol            'eol mode: CRLF | LF | CR
  private m_checker_txt    'MaskExp: postfix of text files
  private m_checker_bin    'MaskExp: postfix of binary files

  property get CRLF() CRLF = adCRLF end property
  property get LF()   LF   = adLF   end property

  function detectEOL(path)
    dim limit: limit = 10000
    dim f_stream, content, symbol, pos
    if g_fso.GetFile(path).size = 0 then    
      detectEOL = adCRLF
      exit function
    end if
    set f_stream = g_fso.OpenTextFile(path, FOR_READING)
    content = f_stream.Read(limit)
    if isNull(content) then
      content = ""
    end if
    pos = instr(content, vbLF)
    if pos = 1 then
      detectEOL = adLF
    elseif pos > 0 then
      symbol = Mid(content, pos - 1, 1)
      if symbol = vbCR then
        detectEOL = adCRLF
      else
        detectEOL = adLF
      end if
    else
      detectEOL = adCRLF
    end if
  end function

  function EOL_to_string(value)
    if value = adLF then
      EOL_to_string = "LF"
    elseif value = adCR then
      EOL_to_string = "CR"
    else
      EOL_to_string = "CRLF"
    end if
  end function

  function string_to_EOL(text)
    dim txt: txt = UCase(text)
    if txt = "LF" then
      string_to_EOL = adLF
    elseif txt = "CR" then
      string_to_EOL = adCR
    else
      string_to_EOL = adCRLF
    end if
  end function

  function checkEOL(path, text_etalon, text_result)
    dim r: r = detectEOL(path)
    dim v: v = string_to_EOL(text_etalon)
    text_result = EOL_to_string(r)
    if v = r then
      checkEOL = true
    else 
      checkEOL = false
    end if
  end function

  function checkValidUtf8(path)
    dim a, r0, r1, r2, r3, r4, s, i, l, ret, n: n = 0
    dim limit: limit = 10000
    dim stream: set stream = CreateObject("ADODB.Stream")
    stream.Type = 1 ' Binary
    stream.Open

    on error resume next 
    stream.LoadFromFile path
    if err.Number <> 0 Then
      WScript.Echo "Error occurred: " & Err.Description & " (Error Number: " & Err.Number & ")"
      err.Clear
      checkValidUtf8 = false
      on error goto 0
      exit function
    end if    

    s = stream.Read(limit)
    stream.Close
    l = LenB(s)
    if isNull(l) then l = 0

    ret = True
    for i = 1 To l
      a = AscB(MidB(s, i, 1))
      r0 = a and &H80
      r1 = a and &HC0
      r2 = a and &HE0
      r3 = a and &HF0
      r4 = a and &HF8
      if n > 0 then
        if r1 = &H80 then
          n = n - 1
        else
          ret = false
        end If
      elseif r4 = &HF8 then
        n = 3
      elseif r3 = &HE0 then
        n = 2
      elseif r2 = &HC0 then
        n = 1
      elseif r0 = 0 then
        n = 0
      end if
    next
    checkValidUtf8 = ret
  end function

  function isTextHeuristic(f_path)
    isTextHeuristic = true
    if isBinaryHeuristic(f_path) then
      isTextHeuristic = false
    end if
  end function   

  function isBinaryHeuristic(f_path)
    dim known 
    isBinaryHeuristic = isBinaryHeuristic2(f_path, known)
  end function   

  function isTextHeuristic2(f_path, known)
    isTextHeuristic2 = true
    if isBinaryHeuristic2(f_path, known) then
      isTextHeuristic2 = false
    end if
  end function   

  function isBinaryHeuristic2(f_path, known)
    dim fname, arr_txt, arr_bin
    fname = g_fso.Getfilename(f_path)
    known = true
    if m_checker_txt.match(fname) then
      isBinaryHeuristic2 = false
    elseif m_checker_bin.match(fname) then
      isBinaryHeuristic2 = true
    else
      known = false
      if isBinaryDetect(f_path) then
        isBinaryHeuristic2 = true
      else
        isBinaryHeuristic2 = false
      end if
    end if
  end function

  function load(path, func)
    dim content: set content = CreateObject("System.Collections.ArrayList")
    if not g_fso.FileExists(path) then
      set load = content
      exit function
    end if

    dim f_stream, line, callback, result, stop_load
    set f_stream = CreateObject("ADODB.Stream")
    m_eol = detectEOL(path)
    with f_stream
      .LineSeparator = m_eol
      .CharSet = "utf-8"
      .Open
      .LoadFromFile(path)
    end with

    stop_load = false: set callback = GetRef(func)
    do while not f_stream.EOS
      line = f_stream.ReadText(READ_LINE)
      result = callback(line, stop_load)
      if vartype(result) = vbEmpty then
        content.add line
      elseif result then
        content.add line
      end if
      if stop_load then exit do
    loop
    f_stream.close
    set load = content
  end function 

  sub saveEndl(path, content)
    dim eol, line, utf8
    if m_eol = 0 then
      m_eol = detectEOL(path)
    end if
    eol = getStreamEOL()
    set utf8 = getStreamUTF8()

    for each line in content
      utf8.WriteText(line & eol)
    next
    saveNoBom utf8, path
  end sub

  sub save(path, content)
    dim i, eol, line, utf8

    if m_eol = 0 then
      m_eol = detectEOL(path)
    end if
    eol = getStreamEOL()
    set utf8 = getStreamUTF8()

    if content.count > 0 then
      for i = 0 to content.count - 2
        line = content(i)
        utf8.WriteText(line & eol)
      next
      line = content(content.count - 1)
      utf8.WriteText(line)
    end if
    saveNoBom utf8, path
  end sub

'---[PRIVATE]-------------------------

  private function getStreamUTF8()
    dim utf8: set utf8 = CreateObject("ADODB.Stream")
    with utf8
      .LineSeparator = m_eol
      .CharSet = "utf-8"
      .Type = TYPE_TXT
      .Open
    end with
    set getStreamUTF8 = utf8
  end function

  private function getStreamEOL()
    if m_eol = adCRLF then
      getStreamEOL = vbCrLf
    else
      getStreamEOL = vbLf
    end if
  end function

  private sub saveNoBom(utf8, path)
    dim no_bom
    utf8.Position = 3
    set no_bom = CreateObject("ADODB.Stream")
    no_bom.LineSeparator = m_eol
    no_bom.Type = TYPE_BIN
    no_bom.Open
    utf8.CopyTo no_bom
    no_bom.SaveToFile path, CREATE_OVERWRITE
    no_bom.close
    utf8.close
  end sub

  private function isBinaryDetect(f_path)
    dim reader, line, count, i, s 
    set reader = g_fso.OpenTextFile(f_path, 1)
    do while not reader.AtEndOfStream
      line  = reader.Readline
      count = len(line)
      for i = 1 to count
        s = Mid(line, i, 1)
        if Asc(s) = 0 then 
          isBinaryDetect = true
          exit function
        end if
      next
    loop
    reader.Close
    isBinaryDetect = false 
  end function

  private sub apply_mask(txt)
    dim res, el, arr: arr = Split(txt, ";", -1, 0)
    txt = ""
    for each el in arr
      el = trim(el) 
      if el <> empty then
        txt = txt & "; *." & el
      end if
    next
    dim length: length = len(txt)
    if length > 0 then
      txt = right(txt, length - 1)
    end if
  end sub

  private sub Class_Initialize()

    dim txt, bin

    txt = "cpp; hpp; h; c; cxx; hxx; " & _
      "bat; cmd; vbs; wsf; sh; bash; txt; md; rs; " & _
      "cmake; sln; vcproj; vcxproj; csproj; props; vcxproj.user; vcxproj.filters; rc; natvis; def; " & _
      "html; httml; graphml; cs; css; json; xml; yml; yaml; svg; " & _
      "asm; swift; js; kt; go; lua; java; php; py; dart; razor; jnfo; sql"
    apply_mask txt
    txt = txt & "; makefile; CHANGELOG; CREDITS; LICENSE; .gitmodules; .gitignore; project.root"

    bin = "lib; dll; exe; pdb; mod; a; so; o; jpg; png; bmp; gif; mp4; avi; ttf; tar.gz; 7z; zip; tlb; dat"

    apply_mask bin

    set m_checker_txt = (new MaskExp)(txt, "")
    set m_checker_bin = (new MaskExp)(bin, "")

    CREATE_NOT_EXIST = 1
    CREATE_OVERWRITE = 2
    FOR_READING      = 1
    FOR_WRITING      = 2
    READ_LINE        = -2
    READ_ALL         = -1
    TYPE_BIN         = 1
    TYPE_TXT         = 2
    adCRLF           = -1
    adLF             = 10
    adCR             = 13
    m_eol            = 0
  end sub
end class
