
::' --- local/hybrids                                             [hybride2.bat]
::' [2024-02-15][09:00:00] 001 Kartonagnick PRE
::'   --- Kartonagnick/hybrids                                    [hybride2.bat]
::'   [2020-12-27][19:00:00] 001 Kartonagnick
::'@echo off & cls
::'cscript //nologo //e:vbscript "%~f0" %*
::'exit /b

WScript.Echo "Hello, world!"
set objArgs = WScript.Arguments
for i = 0 to objArgs.count - 1
  WScript.Echo objArgs(I)
next
WScript.Quit 0

' | Фишка:
' | После каждого символа апострофа стоит невидимый символ SUB (ASCII 26, 1A)
' | 
' | Как это работает
' | cmd/bat
' | :: начинаются обычные cmd-комментарии, внутри которых присутствует символ SUB.
' | SUB интерпретируется как разрыв строки, что значит, что выражение следом будет выполнено.
' | 
' | vbs
' | : - разделитель команд (x = 0 : y = 0). Не имеет значения если они написаны в начале строки.
' | Апостороф ' начинает vbs-комментарий. Следующий символ SUB является частью комментария и не влияет ни на что.
