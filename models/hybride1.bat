
': 2>nul & cls & CScript.exe /nologo /e:vbs "%~f0" %* & exit /b
' --- local/hybrids                                               [hybride1.bat]
' [2024-02-15][09:00:00] 001 Kartonagnick PRE
'   --- Kartonagnick/hybrids                                      [hybride1.bat]
'   [2020-12-27][19:00:00] 001 Kartonagnick

' | Фишка:
' | Данная модель позволяет использовать конструкцию Option Explicit

'===============================================================================

Option Explicit
dim g_shell : set g_shell = CreateObject("WScript.Shell")
dim g_fso   : set g_fso   = CreateObject("Scripting.FileSystemObject")
dim g_env   : set g_env   = g_shell.Environment("PROCESS")

function fromEnvironment(name, def)
  fromEnvironment = g_env.Item(name)
  if fromEnvironment = empty then 
    fromEnvironment = def
  end if
end function

function main()
  dim d_work 
  WScript.Echo "main: begin..."
  d_work = g_shell.CurrentDirectory
  d_work = fromEnvironment("eDIR_WORK", d_work)
  d_work = g_fso.GetAbsolutePathName(d_work)
  WScript.Echo "  work directory: " & d_work
  WScript.Echo "main: done"
end function 

main()

'===============================================================================


