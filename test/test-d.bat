@echo off & cls & echo. & echo.

echo [START] please wait...
::set "eDEBUG=ON"
call "%~dp0test.bat" > "%~dp0log.txt" 2>&1
echo [DONE]
