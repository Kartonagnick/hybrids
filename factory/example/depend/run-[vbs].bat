@echo off & call :checkParent || exit /b

rem ============================================================================
rem ============================================================================

rem --- local/hybrids                             [example/depend/run-[vbs].bat]
rem [2024-02-15][09:00:00] 001 Kartonagnick PRE

rem ============================================================================
rem ============================================================================

:main
  setlocal
  echo [RUN-EXAMPLE.VBS] run... v0.0.1    
  cscript "/Nologo" "%~dp0\depend.vbs" || goto :failed
:success
  echo [RUN-EXAMPLE.VBS] completed successfully
  exit /b 0
:failed
  echo [RUN-EXAMPLE.VBS] finished with erros
exit /b 1

rem ============================================================================
rem ============================================================================

:normalizeD
  set "%~1=%~dpfn2"
exit /b

:setOwnerD
  if defined eDIR_OWNER (exit /b)
  cls & echo. & echo.
  call :normalizeD eDIR_OWNER "%~dp0."
exit /b

:checkParent
  if errorlevel 1 (echo [ERROR] was broken at launch & exit /b 1)
  call :setOwnerD
exit /b

rem ============================================================================
rem ============================================================================
