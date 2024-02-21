@echo off & call :checkParent || exit /b

rem --- local/hybrids                                    [minmax/test-[wsf].bat]
rem [2024-02-21][18:50:00] 001 Kartonagnick PRE
rem ============================================================================
rem ============================================================================

:main
  setlocal
::chcp 65001 >nul
::set "eDEBUG=ON"
  set "eDIR=%~dp0_ready"
  set "title=minmax"
  call :setDepth
  call :show [%title%] run... 0.0.1    
::call :run "%eDIR%\main.vbs" || goto :failed
  call :runAll || goto :failed
  if defined eWAS_ERROR goto :failed
:success
  call :show [%title%] completed successfully
  exit /b 0
:failed
  call :show [%title%] finished with errors
exit /b 1

:runAll
  set "eWAS_ERROR="
  for %%a in ("%eDIR%\*.wsf") do (call :run "%%~a")
  exit /b
:run
  set "script=%~1"
  call :show1 -------------------------------[%~n1%~x1]---
  call :isAssert "%~n1"
  if defined eASSERT (goto :runAssert)
:runScript
  cscript "/Nologo" "%script%" && (call :show1 [SUCCESS] & exit /b 0)
  call :show [ERROR] script failure
  set "eWAS_ERROR=ON"
  exit /b 1
:runAssert
  cscript "/Nologo" "%script%" || (call :show1 [SUCCESS] & exit /b 0)
  call :show [ERROR] assert failure
  set "eWAS_ERROR=ON"
exit /b 1

:isAssert
  set "name=%~1"
  if "%name%" == "ass"    (goto :assertF)
  if "%name%" == "assert" (goto :assertF)
  for /F "tokens=*" %%a in ('echo %name% ^| findstr /rc:".*[-.]ass"')          do (goto :assertF)
  for /F "tokens=*" %%a in ('echo %name% ^| findstr /rc:"ass[-.].*"')          do (goto :assertF)
  for /F "tokens=*" %%a in ('echo %name% ^| findstr /rc:".*[-.]ass[-.].*"')    do (goto :assertF)
  for /F "tokens=*" %%a in ('echo %name% ^| findstr /rc:".*[-.]assert"')       do (goto :assertF)
  for /F "tokens=*" %%a in ('echo %name% ^| findstr /rc:"assert[-.].*"')       do (goto :assertF)
  for /F "tokens=*" %%a in ('echo %name% ^| findstr /rc:".*[-.]assert[-.].*"') do (goto :assertF)
  set "eASSERT="
  exit /b
:assertF
  set "eASSERT=ON"
exit /b

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
:show1
  echo %eDEEP1%%*
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
