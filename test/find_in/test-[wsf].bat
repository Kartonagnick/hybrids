@echo off & call :checkParent || exit /b

rem --- local/hybrids                             [test][find_in/test-[wsf].bat]
rem [2024-03-07][23:50:00] 001 Kartonagnick PRE

rem ============================================================================
rem ============================================================================

:main
  setlocal
  chcp 65001 >nul
::set "eDEBUG=ON"
  set "title=find_in"
  call :setDepth
  call :show [%title%] run... 0.0.1    
  cscript "/Nologo" "%~dp0sources\test.wsf" || goto :failed
:success
  call :show [%title%] completed successfully
  exit /b 0
:failed
  call :show [%title%] finished with erros
exit /b 1

rem ============================================================================
rem ============================================================================

:setDepth
  if defined eINDENT (set /a "eINDENT+=1") else (set "eINDENT=0")
  set "eDEEP0="
  for /l %%i in (1, 1, %eINDENT%) do (call set "eDEEP0=  %%eDEEP0%%")
exit /b

:show
  echo %eDEEP0%%*
exit /b

rem ............................................................................

:normalizeD
  set "%~1=%~dpfn2"
exit /b

:setOwnerD
  if defined eDIR_OWNER (exit /b)
  cls & echo. & echo.
  call :normalizeD eDIR_OWNER "%~dp0."
exit /b

rem ............................................................................

:checkParent
  if errorlevel 1 (echo [ERROR] was broken at launch & exit /b 1)
  call :setOwnerD
exit /b
