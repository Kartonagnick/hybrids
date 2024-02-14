
::' --- local/hybrids                                             [hybride3.bat]
::' [2024-02-15][09:00:00] 001 Kartonagnick PRE
::'   --- Kartonagnick/hybrids                                    [hybride3.bat]
::'   [2020-12-27][19:00:00] 001 Kartonagnick
::'     VBS/Batch Hybrid

::' --- Batch portion ---------
rem^ & @echo off & cls
rem^ & call :'sub %*
rem^ & exit /b

:'sub
rem^ & echo begin batch
rem^ & cscript //nologo //e:vbscript "%~f0" %*
rem^ & echo end batch
rem^ & exit /b

'----- VBS portion ------------
WScript.Echo "begin VBS"
Set objArgs = WScript.Arguments
For i = 0 to objArgs.Count - 1
  WScript.Echo objArgs(I)
next
WScript.Echo "end VBS"
WScript.Quit(0)

'===============================================================================
'===============================================================================

' особенность данного гибрида:
'   - ярко выраженные части `bat` и `vbs`
'   - для bat удобно использовать функции

'===============================================================================
'===============================================================================
