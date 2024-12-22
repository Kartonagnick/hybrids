@echo off & call :checkParent || exit /b

rem --- local/hybrids                                           [7zrun/make.bat]
rem [2024-12-22][08:50:00] 001 Kartonagnick    
rem ============================================================================
rem ============================================================================

:main
  setlocal
::chcp 65001 >nul
::set "eDEBUG=ON"
  set "title=7zrun"
  call :setDepth
  call :show [%title%] run... 0.0.1       
  call :normalizeD factory "%~dp0..\..\factory\factory.bat"

  set "eHYBRID.VERSION=001"
  set "eHYBRID.USER=Kartonagnick"
  set "eHYBRID.STAMP=[2024-12-22][08:50:00]"
  set "eHYBRID.PRE=PRE"
  set "eHYBRID.PROJECT=local/hybrids"
  set "eHYBRID.FILE=[script][7zrun.bat]"

  set "eHYBRID.SRC=%~dp0sources\struct.txt"
  set "eHYBRID.DST=%~dp0_ready"

  call "%factory%" || goto :failed
:success
  call :show [%title%] completed successfully
  exit /b 0
:failed
  call :show [%title%] finished with erros
exit /b 1

rem ............................................................................

:setDepth
  if defined eINDENT (set /a "eINDENT+=1") else (set "eINDENT=0")
  set "eDEEP0="
  for /l %%i in (1, 1, %eINDENT%) do (call set "eDEEP0=  %%eDEEP0%%")
  exit /b
:show
  echo %eDEEP0%%*
exit /b

:normalizeD
  set "%~1=%~dpfn2"
exit /b

:checkParent
  if errorlevel 1 (echo [ERROR] was broken at launch & exit /b 1)
  call :setOwnerD
  exit /b
:setOwnerD
  if defined eDIR_OWNER (exit /b)
  cls & echo. & echo.
  call :normalizeD eDIR_OWNER "%~dp0."
exit /b
