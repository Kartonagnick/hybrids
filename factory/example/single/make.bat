@echo off & call :checkParent || exit /b

rem ============================================================================
rem ============================================================================

rem --- local/hybrids                                  [example/single/make.bat]
rem [2024-02-15][09:00:00] 001 Kartonagnick    

rem ============================================================================
rem ============================================================================

:main
  setlocal
  echo [MAKE-EXAMPLE] run... v0.0.1    

  set "eDEBUG=ON" 

  rem set "eDATASTAMP=[2024-02-15][09:00:00]"
  call :dateTime "eDATASTAMP"

::set "eHYBRID.VERSION=001"  
::set "eHYBRID.USER=Kartonagnick" 
::set "eHYBRID.STAMP=[2024-02-15][09:00:00]"
::set "eHYBRID.PRE=   "      
::set "eHYBRID.PROJECT=local/hybrids"

  set "eHYBRID.FILE=[single.vbs]"
  set "eHYBRID.SRC=%~dp0single.wsf"  
  set "eHYBRID.DST=%~dp0single.vbs" 

  call "%~dp0..\..\factory.bat" || goto :failed
:success
  echo [MAKE-EXAMPLE] completed successfully
  exit /b 0
:failed
  echo [MAKE-EXAMPLE] finished with erros
exit /b 1

rem ============================================================================
rem ============================================================================

:dateTime
  setlocal
  set cmd=WMIC OS GET LocalDateTime
  for /f %%a in ('%cmd% ^| find "."') do (set "DTS=%%~a")
  if errorlevel 1 (echo [ERROR] 'WMIC' finished with error & exit /b 1)

  set "YY=%DTS:~0,4%"
  set "MO=%DTS:~4,2%"
  set "DD=%DTS:~6,2%"

  set "HH=%DTS:~8,2%"
  set "MM=%DTS:~10,2%"
  set "SS=%DTS:~12,2%"
  set "MS=%DTS:~15,3%"

  set "curDate=%YY%-%MO%-%DD%"
  set "curTime=%HH%:%MM%:%SS%"
  set "curStamp=[%curDate%][%curTime%]"
  endlocal & (set "%~1=%curStamp%")
exit /b 

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
