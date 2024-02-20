
'--- local/hybrids                                                  [runCmd.vbs]
'[2024-02-20][23:50:00] 001 Kartonagnick    
'  --- CastleOfDreams\hybrids                                       [runCmd.vbs]
'  [2021-12-27][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams\vbs                                         [runCmd.vbs]
'    [2021-07-31][15:00:00] 001 Kartonagnick

' includeVBS("glob.vbs")

class Executed
  public stdout
  public stderr
  public code
end class

'return object 'Executed'
'example: command = "ping.exe 127.0.0.1 -n 1 -w 500"

function runCmd(command)
  Const running = 0
  dim launch: launch = "cmd.exe /c" & Chr(34) & command & Chr(34)

  dim exec: set exec = g_shell.Exec(launch)
  while exec.Status = running
    WScript.Sleep 50
  wend
  dim ret: set ret = new Executed
  ret.stdout = exec.StdOut.ReadAll
  ret.stderr = exec.StdErr.ReadAll
  ret.code   = exec.ExitCode
  set runCmd = ret
end function
