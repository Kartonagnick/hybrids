@echo off & call :checkParent || exit /b

rem --- local/hybrids                                           [value/make.bat]
rem [2025-01-13][12:50:00] 001 Kartonagnick PRE
rem ============================================================================
rem ============================================================================

:main
  setlocal
::chcp 65001 >nul
::set "eDEBUG=ON"
  set "title=fcontent"
  call :setDepth
  call :show [%title%] run... 0.0.2 PRE
  call :prepare || goto :failed
  set "eHYBRID.SRC=%~dp0sources\struct.txt"
  set "eHYBRID.DST=%~dp0_ready"
  call :link.all || goto :failed
  call "%factory%" || goto :failed
:success
  call :show [%title%] completed successfully
  exit /b 0
:failed
  call :show [%title%] finished with erros
exit /b 1

:prepare
  call :normalizeD factory "%~dp0..\..\factory\factory.bat"
  set "out=>nul 2>nul"
  if defined eDEBUG (set out=)
  set "eWAS_ERROR="
exit /b

rem ............................................................................

:link.all
  call :normalizeD d_resource "%eHYBRID.SRC%\..\resources"
  if not exist "%d_resource%" exit /b
  set "from=%d_resource%"
  set "to=%eHYBRID.DST%\resources"
  call :link.from_to "%from%"  "%to%"
exit /b

rem ............................................................................

rem /D - does not allow users of other machines to access the directory
rem /J - allows you to enter the directory from other machines.

:link.from_to
  set "src=%~1"
  set "dst=%~2"
  set "key=%~3"
  if not exist "%src%" (goto :link.errNotExist)
  if not exist "%dst%" (goto :link.from_to.next_1)
  call :isSymlink "%dst%" || (exit /b 1)
  if defined result exit /b
  goto :link.errAlreadyExist
:link.from_to.next_1
  if defined key goto :link.from_to.next_2
  call :isDirectory "%src%"
  if defined result (set "key=/D") else (set "key=/H")
:link.from_to.next_2
  call :normalizeD d_parent "%dst%\.."
  if exist "%d_parent%" goto :link.do_target
  mkdir "%d_parent%" || goto :link.errCreate
:link.do_target
  rem    /J  : old legacy link for directory
  rem    /D  : symbolic link for directory
  rem    /H  : hard link for file only
  rem   none : symbolic link for file
  mklink %key% "%dst%" "%src%" %out% && exit /b
  call :echo1 [ERROR] can not make link:
  call :echo1 [ERROR]   src: "%src%"
  call :echo1 [ERROR]   dst: "%dst%"
  call :echo1 [ERROR]   key: "%key%"
  set "eWAS_ERROR=ON"
  exit /b 1
:link.errCreate
  call :echo1 [ERROR] can not create directory:
  call :echo1 [ERROR]   check: %d_parent%
  set "eWAS_ERROR=ON"
  exit /b 1
:link.errNotExist
  call :echo1 [ERROR] can not make link:
  call :echo1 [ERROR]   src: not exist
  call :echo1 [ERROR]   src: %src%
  set "eWAS_ERROR=ON"
  exit /b 1
:link.errAlreadyExist
  call :echo1 [ERROR] can not make link:
  call :echo1 [ERROR]   src: "%src%"
  call :echo1 [ERROR]   dst: "%dst%"
  call :echo1 [ERROR] dst: already exist and is not a symbolic link
  set "eWAS_ERROR=ON"
exit /b 1

:unlink_directory
  set "dir=%~1"
  if not exist "%dir%" exit /b
  call :isSymlink "%dir%" 
  if not defined result goto :unlink.notSymlinkD
  rmdir /S /Q "%dir%" >nul 2>nul && exit /b
  call :echo1 [ERROR] can not remove path
  call :echo1 [ERROR] check: "%dir%"
  set "eWAS_ERROR=ON"
  exit /b 1
:unlink.notSymlinkD
  call :echo1 [ERROR] can not remove symlink
  call :echo1 [ERROR] because path is not a link
  call :echo1 [ERROR] check: "%dir%"
  set "eWAS_ERROR=ON"
exit /b 1

rem ............................................................................

:isSymlink
  setlocal
  set "result="
  set "name=%~n1%~x1"
  call :normalizeD "dir" "%~1"
  if not exist "%dir%" goto :isSymlink.errNotExist
  pushd "%dir%\.." ||  goto :isSymlink.errNotAccess
  for /f "usebackq tokens=*" %%a in (`dir /adl /b 2^>nul ^|find "%name%"`) do (
    set "result=%%~a"
  )
  endlocal & (set "result=%result%")
  exit /b 0
:isSymlink.errNotExist
  echo [ERROR] path not exist
  echo [ERROR] check: %dir%
  set "eWAS_ERROR=ON"
  exit /b 1
:isSymlink.errNotAccess
  echo [ERROR] can not access: %dir%
  set "eWAS_ERROR=ON"
exit /b 1

rem ............................................................................

:setDepth
  set "eDEEP0="
  if defined eINDENT (set /a "eINDENT+=1") else (set "eINDENT=0")
  for /l %%i in (1, 1, %eINDENT%) do (call set "eDEEP0=  %%eDEEP0%%")
  set "eDEEP1=  %eDEEP0%"
  set "eDEEP2=  %eDEEP1%"
  exit /b
:echo0
  echo %eDEEP0%%* & exit /b
:echo1
  echo %eDEEP1%%* & exit /b
:echo2
  echo %eDEEP2%%* & exit /b
:debug1
  if not defined eDEBUG (exit /b)
  echo %eDEEP1%%*
:debug2
  if not defined eDEBUG (exit /b)
  echo %eDEEP2%%*
  exit /b
:trace2
  if not defined eTRACE (exit /b)
  echo %eDEEP2%%*
  exit /b
:show
  echo %eDEEP0%%*
exit /b

rem ............................................................................

:trim
  for /F "tokens=1,*" %%a in ("%*") do (call set "%%a=%%b")
  exit /b
:normalizeD
  set "%~1=%~dpfn2"
  exit /b
:setName
  set "%~1=%~n2"
  exit /b
:isDirectory
  set "result="
  if exist "%~1\" (set result=ON)
exit /b

rem ............................................................................

:checkParent
  if errorlevel 1 (echo [ERROR] was broken at launch & exit /b 1)
  call :setOwnerD
  exit /b
:setOwnerD
  if defined eDIR_OWNER (exit /b)
  cls & echo. & echo.
  call :normalizeD eDIR_OWNER "%~dp0."
exit /b
