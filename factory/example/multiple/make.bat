@echo off & call :checkParent || exit /b

rem --- local/hybrids                                        [multiple/make.bat]
rem [2024-02-15][09:00:00] 001 Kartonagnick PRE
rem ============================================================================
rem ============================================================================

:main
  setlocal
  chcp 65001 >nul
  set "eDEBUG=ON"
  set "title=multiple"
  call :setDepth
  call :show [%title%] run... 0.0.1    
  call :normalizeD factory "%~dp0..\..\factory.bat"
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
  set "eDEEP1=  %eDEEP0%"
  exit /b
:show
  echo %eDEEP0%%*
  exit /b
:echo1
  echo %eDEEP1%%*
  exit /b
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

