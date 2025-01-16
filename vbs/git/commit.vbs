
'--- local/hybrids                                              [git/commit.vbs]
'[2025-01-16][04:50:00] 001 Kartonagnick    
' includeVBS("glob.vbs")
' includeVBS("runCmd.vbs")
' includeVBS("trim.vbs")
' includeVBS("command.vbs")

class GitCommit
  private m_short  'string
  private m_full   'string
  private m_text   'string

  public default function init(v)
    hash = v: set init = me
  end function

  property let hash(v)
    if len(v) < 40 then
      m_short = v
    else
      m_full = v
    end if
  end property

  property let text(v)
    m_text = v
  end property

  property get hash()
    if m_full <> Empty then
      hash = m_full
    else
      hash = m_short
    end if
  end property

  property get text()
    if m_text = empty then
      m_text = runGitCommand("git log --format^=""%s"" -n 1 " & hash)
    end if
    text = m_text
  end property

  property get full()
    if m_full = empty then
      m_full = runGitCommand("git log --format^=""%H"" -n 1 " & m_short)
    end if
    full = m_full
  end property

  property get short()
    if m_short = empty then
      m_short = runGitCommand("git log --format^=""%h"" -n 1 " & m_full)
    end if
    short = m_short
  end property

'---[PRIVATE]-------------------------

  private sub Class_Initialize()
    m_text  = empty
    m_short = empty
    m_full  = empty
  end sub
end class
