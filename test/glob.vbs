
'--- local/hybrids                                               [test/glob.vbs]
'[2024-02-15][09:00:00] 001 Kartonagnick PRE
'  --- CastleOfDreams\hybrids                                      [initial.vbs]
'  [2022y-01m-11d][19:00:00] 001 Kartonagnick

dim g_list   : set g_list   = CreateObject("System.Collections.ArrayList")
dim g_fso    : set g_fso    = CreateObject("Scripting.FileSystemObject")
dim g_regexp : set g_regexp = CreateObject("VBScript.RegExp")
dim g_shell  : set g_shell  = CreateObject("WScript.Shell")
dim g_env    : set g_env    = g_shell.Environment("PROCESS")

