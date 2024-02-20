
'--- local/hybrids                                                  [runCmd.vbs]
'[2024-02-20][23:50:00] 001 Kartonagnick PRE
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

function runCmd(cmd)
  const running = 0
  dim launch, ret, exec
  launch = "cmd.exe /c" & Chr(34) & cmd & Chr(34)
  set ret = new Executed
  set exec = g_shell.Exec(launch)
  while exec.Status = running
    ret.stdout = ret.stdout & exec.StdOut.ReadAll
    if exec.Status = running then
      WScript.Sleep 10
    end if
  wend
  ret.stdout = ret.stdout & exec.StdOut.ReadAll
  ret.stderr = exec.StdErr.ReadAll
  ret.code   = exec.ExitCode
  set runCmd = ret
end function

function runCommand(cmd)
  const running = 0
  dim launch, exec, ret
  launch = "cmd.exe /c" & Chr(34) & cmd & Chr(34)
  set ret = new Executed
  set exec = g_shell.Exec(launch)
  set ret.stdout = CreateObject("System.Collections.ArrayList")
  while exec.Status = running
    do
      ret.stdout.add exec.StdOut.ReadLine()
    loop while not exec.Stdout.atEndOfStream
    if exec.Status = running then
      WScript.Sleep 10
    end if
  wend
  ret.stderr = exec.StdErr.ReadAll
  ret.code   = exec.ExitCode
  set runCommand = ret
end function
