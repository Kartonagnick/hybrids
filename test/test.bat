@echo off & call :checkParent || exit /b

rem --- local/hybrids                                                 [test.bat]
rem [2024-02-15][09:00:00] 001 Kartonagnick    
rem   --- local/template                                              [main.bat]
rem   [2024-01m-06][20:19:59] 001 Kartonagnick

rem ============================================================================
rem ============================================================================

:main
  setlocal
  chcp 65001 >nul
::set "eDEBUG=ON"
  call :setDepth
  set "title=test"
  call :show [%title%] run... 0.0.1    
  call :prepare
  call :make-all
  call :test-all
  if defined eERROR goto :failed
:success
  call :show [%title%] completed successfully
  exit /b 0
:failed
  call :show [%title%] finished with erros
exit /b 1

:prepare
  set "eERROR="
  if defined eDATASTAMP exit /b
  call :dateTime eDATASTAMP
  call :echo1 stamp: %eDATASTAMP%
exit /b

:make-all
  call :run-all "%~dp0." "make.bat"
  exit /b
:test-all
  call :run-all "%~dp0." "test-[vbs].bat"
  call :run-all "%~dp0." "test-[wsf].bat"
exit /b

:run-all
  call :normalizeD dir "%~1"
  pushd "%dir%" || goto :err_access
  for /f "usebackq delims=" %%a in (`dir /b /s "%~2" 2^>nul`) do (
    call :run "%%~a" 
  )
  exit /b 0
:err_access
  call :show [%title%] can not access to directory
  call :show [%title%] check: %dir%
  exit /b 1
:run
  type nul > nul
  call :getName gaffer "%~1\..\.."
  call :getName parent "%~1\.."
  call :getName name   "%~1"
  call :echo1 ----------------------
  if not "%gaffer%" == "test" (
    call :show_short
  ) else (
    call :show_long
  )

  call "%~1" && exit /b
  call :echo1 [ERROR] %parent%\%name%
  set "eERROR=ON"
  exit /b 0
:show_long
  call :echo1 run: %gaffer%\%parent%\%name%
  exit /b
:show_short
  call :echo1 run: %gaffer%\%parent%\%name%
exit /b

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

:setDepth
  if defined eINDENT (set /a "eINDENT+=1") else (set "eINDENT=0")
  set "eDEEP0="
  for /l %%i in (1, 1, %eINDENT%) do (
    call set "eDEEP0=  %%eDEEP0%%"
  )
  set "eDEEP1=  %eDEEP0%"
  set "eDEEP2=  %eDEEP1%"
exit /b

:show
  echo %eDEEP0%%*
  exit /b
:echo1
  echo %eDEEP1%%*
  exit /b
:echo2
  echo %eDEEP2%%*
  exit /b
:debug1
  if not defined eDEBUG (exit /b)
  echo %eDEEP1%%*
  exit /b
exit /b

rem ............................................................................

:getName
  set "%~1=%~n2%~x2"
exit /b

:trim
  for /F "tokens=1,*" %%a in ("%*") do (call set "%%a=%%b")
exit /b

:normalizeD
  set "%~1=%~dpfn2"
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
