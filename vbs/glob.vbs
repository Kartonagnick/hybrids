
'--- local/hybrids                                                    [glob.vbs]
'[2024-02-17][20:30:00] 001 Kartonagnick    
'  --- CastleOfDreams\hybrids                                      [initial.vbs]
'  [2022-01-11][19:00:00] 001 Kartonagnick

dim g_list   : set g_list   = CreateObject("System.Collections.ArrayList")
dim g_fso    : set g_fso    = CreateObject("Scripting.FileSystemObject")
dim g_regexp : set g_regexp = CreateObject("VBScript.RegExp")
dim g_shell  : set g_shell  = CreateObject("WScript.Shell")
dim g_env    : set g_env    = g_shell.Environment("PROCESS")
