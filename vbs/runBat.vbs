
'--- local/hybrids                                                  [runBat.vbs]
'[2024-02-21][14:20:00] 001 Kartonagnick PRE
'  --- CastleOfDreams\clone                                         [runBat.vbs]
'  [2022-04-02][19:00:00] 001 Kartonagnick 

' includeVBS("glob.vbs")
' includeVBS("echo.vbs")
' includeVBS("errCode.vbs")

class ExecBat
  public stdout
  public stderr
  public code
end class

function runBat(deep, hide, path_to_bat)
  dim msg, ret, marker, command, launch, exec, fname

  if not g_fso.FileExists(path_to_bat) then
    msg = "file not found (" & path_to_bat & ")"
    call err.Raise(errorNotFound, "runBat", msg)
  end if

  set ret = new ExecBat
  set ret.stdout = CreateObject("Scripting.Dictionary")
  ret.stdout.CompareMode = 1

  marker  = "-_-_-list of environment variables-_-_-"
  command = Chr(34) & path_to_bat & Chr(34) & " && @echo " & marker & " && set"
  launch  = "cmd.exe /c" & Chr(34) & command & Chr(34)

  dbg deep, "[run] " & g_fso.GetFile(path_to_bat) & " ..."

  Const running = 0
  set exec = g_shell.Exec(launch)
  do
    loadEnvFromBatch deep, hide, exec.StdOut, ret.stdout
    WScript.Sleep 1
  loop while exec.Status = running

  ret.stderr = exec.StdErr.ReadAll
  ret.code = exec.ExitCode

  if ret.code <> 0 then
    fname = g_fso.GetFileName(path_to_bat)
    call err.Raise(errorExecFailed, fname, "finished with error")
  end if

  set runBat = ret
end function

sub loadEnvFromBatch(deep, hide, stream, dst)
  dim x, text, pos, var, val, founded: founded = false

  do while not stream.AtEndOfStream
    x = stream.ReadLine: text = trim(x)
    if not hide then
      echo deep, x
    end if
    if founded then
      pos = Instr(text, "=")
      if pos > 0 then
        var = Left(text, pos - 1)
        val = Right(text, len(text) - pos)
        var = trim(var)
        val = trim(val)
        g_env.Item(var) = val
        dst(var) = val
      end if
    elseif text = "-_-_-list of environment variables-_-_-" then 
      founded = true
    end if
  loop
end sub
