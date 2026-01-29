
'--- local/hybrids                                                 [logging.vbs]
'[2026-01-29][19:30:00] 001 Kartonagnick    
'  based on the story:
'  --- local/entrepot                                   [bat/work/03-rename.bat]
'  [2025-10-23][05:10:00] 013 Kartonagnick
'  [2024-12-06][13:40:00] 012 Kartonagnick
'  [2024-11-24][04:20:00] 011 Kartonagnick
'  [2024-01-03][21:10:00] 010 Kartonagnick
'  [2023-12-26][14:00:00] 009 Kartonagnick
'  [2023-12-18][05:30:00] 008 Kartonagnick
'  [2023-10-13][21:30:00] 007 Kartonagnick
'  [2023-10-05][07:00:00] 006 Kartonagnick
'    --- media/bat                                               [03-rename.bat]
'    [2023-09-04][00:41:42] 005 Kartonagnick
'    [2023-08-04][08:29:30] 004 Kartonagnick
'    [2023-07-13][01:01:59] 003 Kartonagnick
'    [2021-12-08][19:00:00] 002 Kartonagnick
'    [2021-12-07][11:00:00] 002 Kartonagnick
'
' includeVBS("glob.vbs")
' includeVBS("echo.vbs")

class CFileLogger

  private TRISTATE_USE_DEFAULT
  private FOR_APPENDING
  private RECREATE

  private m_stream
  private m_flush
  private m_utf8
  private m_path

  property Get path() path = m_path end property

  sub echo(deep, msg)
    dim text: text = indent(deep) & msg  
    WScript.Echo text

    if m_stream is nothing then exit sub
    if m_utf8 then 
      dim i, ch
      for i = 1 to len(text)
        ch = Mid(text, i, 1)
        ch = ascW(ch)
        ch = utf8(ch)
        m_stream.Write ch
      next
      m_stream.WriteLine ""
   else
     m_stream.WriteLine text
   end if 
  end sub

  function utf8(ByVal c)
    dim b1, b2, b3
    if c < 128 then
      utf8 = chr(c)
    elseif c < 2048 then
      b1 = c mod 64
      b2 = (c - b1) / 64
      utf8 = chr(&hc0 + b2) & chr(&h80 + b1)
    elseif c < 65536 then
      b1 = c mod 64
      b2 = ((c - b1) / 64) mod 64
      b3 = (c - b1 - (64 * b2)) / 4096
      utf8 = chr(&he0 + b3) & chr(&h80 + b2) & chr(&h80 + b1)
    else
      WScript.Echo "fuck: "  & typename(c)
    end if
  end function

  sub close
    m_stream.close
    set m_stream = nothing 
  end sub

'---[PRIVATE]-------------------------

  private sub Class_Initialize()

    TRISTATE_USE_DEFAULT = -2 ' Use system default encoding
    FOR_APPENDING = 8
    RECREATE = true

    m_utf8 = g_env.Item("eLOG.SYSTEM_LOCALE")
    if m_utf8 = "ON" or m_flush = "1" then
      m_utf8 = false
    else 
      m_utf8 = true
    end if

    m_flush = g_env.Item("eLOG.FLUSH")
    if m_flush = "ON" or m_flush = "1" then
      m_flush = true
    else 
      m_flush = false
    end if

    m_path = g_env.Item("eLOG.PATH")
    if m_path = empty then 
      dim fname: fname = g_fso.GetBaseName(WScript.ScriptFullName) 
      m_path = fname & ".log"
    end if

    dim app: app = g_env.Item("eLOG.APPEND")
    if app = "ON" or app = "1" then
      'nothing
    else
      if g_fso.FileExists(m_path) Then
        g_fso.DeleteFile m_path
      end if
    end if

    set m_stream = g_fso.OpenTextFile(m_path, FOR_APPENDING, RECREATE, TRISTATE_USE_DEFAULT)
  end sub

  private sub Class_Terminate()
    if m_stream is nothing then exit sub
    m_stream.Close
  end sub

end class

dim g_logg: set g_logg = new CFileLogger

sub echo(deep, msg)
  if gSILENCE then exit sub
  g_logg.echo deep, msg
end sub
        
sub dbg(deep, msg)
  if not gDEBUG then exit sub
  g_logg.echo deep, msg
end sub 
