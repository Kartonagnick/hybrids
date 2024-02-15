@echo off & cls & echo. & echo.
rem ============================================================================
rem ============================================================================

rem --- local/hybrids                                           [test/clean.bat]
rem [2024-02-15][09:00:00] 001 Kartonagnick PRE

rem ============================================================================
rem ============================================================================

:main
  setlocal
  
  set "PATH=C:\workspace\scripts\cmd; %PATH%"
  
  rem delete these files and directories:
  set m1=build; build-*; product; _products; _ready
  set m2=Release; release; release32; release64
  set m3=Debug; debug; debug32; debug64
  set m4=RelWithDebInfo; MinSizeRel
  set m5=.vs; *.suo; *.ncb; *.sdf; ipch; *.VC.db; *.aps;
  set m6=log.txt; cmdlog.txt; debug.txt
  set m7=_cache*.bat; _cache; 
  set mask=%m1%; %m1%; %m2%; %m3%; %m4%; %m5%; %m6%; %m7%;
  
  rem exclude`d rule:
  set e2=google*; boost*; mingw* 
  set e3=external*; product*; build*; programs; cmake*;
  set exclude=%e1%; %e2%; %e3%
  
  garbage.exe         ^
    "-start: %~dp0."  ^
    "--mask: %mask%"  ^
    "--es: %exclude%" ^
    "--zdebug" "--ztest"
exit /b

rem ============================================================================
rem ============================================================================
