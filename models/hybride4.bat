
::'@echo off & call :'checkParent || exit /b 1
::'set "eEXAMPLE=hello"
::'cscript //nologo //e:vbscript "%~f0" %*
::'exit /b

' --- local/hybrids                                               [hybride4.bat]
' [2024-02-15][09:00:00] 001 Kartonagnick PRE
'
'   <--- local/stash
'   [2023-03-07][13:10:00] 004 Kartonagnick                [basic/actualize.bat]
'
'   <-- Kartonagnick/hybrids                                      [hybride4.bat]
'   [2021-01-10][11:00:00] 001 Kartonagnick

' |  
' | Фишка:
' | bat-части можно располагать как в начале файла, так и в самом конце
' | в начале обычно задаются управляющие переменные
' | в конце располагаем bat-функции
' | а середине обычно располагается vbs-часть
' | модель именно этого гибрида чаще всего используется на практике
' |

'===============================================================================
'===============================================================================

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
  dim example
  WScript.Echo "main: begin..."
  d_work = g_shell.CurrentDirectory
  d_work = fromEnvironment("eDIR_WORK", d_work)
  d_work = g_fso.GetAbsolutePathName(d_work)
  example = fromEnvironment("eEXAMPLE", "none")
  WScript.Echo "  work directory: " & d_work
  WScript.Echo "  example value:  " & example
  WScript.Echo "main: done"
end function 

main()

'===============================================================================
'===============================================================================

:'normalizeD
rem^   set "%~1=%~dpfn2"
::'exit /b

:'setOwnerD
::'   if defined eDIR_OWNER (exit /b)
::'   cls & echo. & echo.
::'   call :'normalizeD eDIR_OWNER "%~dp0."
::' exit /b

:'checkParent
::'   if errorlevel 1 (
::'     echo [ERROR] was broken at launch 
::'     exit /b 1
rem^   )
::'   call :'setOwnerD
::'   if errorlevel 1 (echo [ERROR] initialization)
::'exit /b
