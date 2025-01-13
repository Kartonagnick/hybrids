
@echo off & cls

for /f "tokens=* delims=" %%a in ('dir /a-d/b/s "*.*"') do (
  call :show "%%~a"
)
exit / b

:show
echo [f]  %~1
enca -n mime -L ru  "%~1"
::enca -e -L ru  "%~1"
echo ---
exit /b

