
'--- local/hybrids                                                [fcontent.vbs]
'[2025-01-13][13:00:00] 001 Kartonagnick PRE
' includeVBS("glob.vbs")

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

  private m_content  'ArrayList: content of file
  private m_eol      'eol mode: CRLF | LF | CR

  function load(path, func)
    set content = CreateObject("System.Collections.ArrayList")
    if not g_fso.FileExists(path) then
      set load = content
      exit function
    end if

    dim f_stream, line, content, callback
    set f_stream = CreateObject("ADODB.Stream")

    m_eol = detectEOL(path)
    with f_stream
      .LineSeparator = m_eol
      .CharSet = "utf-8"
      .Open
      .LoadFromFile(path)
    end with

    set callback = GetRef(func)

    do while not f_stream.EOS
      line = f_stream.ReadText(READ_LINE)
      if callback(line) then
        content.add line
      end if
    loop
    f_stream.close
    set load = content
  end function 

  sub saveEndl(path, content)
    dim eol, line, utf8
    set utf8 = getStream()
    eol = getStreamEOL()
    for each line in content
      utf8.WriteText(line & eol)
    next
    saveNoBom utf8, path
  end sub

  sub save(path, content)
    dim i, eol, line, utf8
    set utf8 = getStream()
    eol = getStreamEOL()

    if content.count > 0 then
      for i = 0 to content.count - 2
        line = content(i)
'        echo 1, "WriteText: '" & line & "' (endl)"
        utf8.WriteText(line & eol)
      next
      line = content(content.count - 1)
'      echo 1, "WriteText: '" & line & "'"
      utf8.WriteText(line)
    end if
    saveNoBom utf8, path
  end sub

'---[PRIVATE]-------------------------

  private function getStream()
    dim utf8: set utf8 = CreateObject("ADODB.Stream")
    with utf8
      .LineSeparator = m_eol
      .CharSet = "utf-8"
      .Type = TYPE_TXT
      .Open
    end with
    set getStream = utf8
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
    no_bom.Type = TYPE_BIN
    no_bom.Open
    utf8.CopyTo no_bom
    no_bom.SaveToFile path, CREATE_OVERWRITE
    no_bom.close
    utf8.close
  end sub

  private function detectEOL(path)
    dim f_stream, content, symbol, pos
    if g_fso.GetFile(path).size = 0 then    
      detectEOL = adCRLF
      exit function
    end if
    set f_stream = g_fso.OpenTextFile(path, FOR_READING)
    content = f_stream.ReadAll()
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

  private sub Class_Initialize()
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
    m_eol = adCRLF
  end sub
end class
