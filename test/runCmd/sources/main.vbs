'--- local/hybrids                                    [test/runCmd][main.vbs]
'[2024-02-20][23:50:00] 003 Kartonagnick PRE
'  --- CastleOfDreams/hybrids                         [test/runCmd][case.vbs]
'  [2022-01-26][19:00:00] 002 Kartonagnick
'  [2021-12-27][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams/vbs                                 [test/runCmd.vbs]
'    [2021-07-31][15:00:00] 001 Kartonagnick

sub test(id, deep, cmd, stdout, stderr, code)
  dim result: set result = runCmd(cmd) 
  dim was_err: was_err = false

  if result.stdout <> stdout then was_err = true
  if result.stderr <> stderr then was_err = true
  if result.code   <> code   then was_err = true

  if was_err then
    echo deep, "-----------------------------"
    echo deep, "[" & id & "][ERROR] cmd   : '" & cmd    & "'"
   
    if result.stdout <> stdout then 
      echo deep, "[" & id & "][ERROR] expected-stdout: '" & stdout & "'"
      echo deep, "[" & id & "][ERROR] real-stdout: '" & result.stdout & "'"
    end if

    if result.stderr <> stderr then
      echo deep, "[" & id & "][ERROR] expected-stderr: '" & stderr & "'"
      echo deep, "[" & id & "][ERROR] real-stderr: '" & result.stderr & "'"
    end if

    if result.code <> code then 
      echo deep, "[" & id & "][ERROR] expected-code  : '" & code & "'"
      echo deep, "[" & id & "][ERROR] real-code: '" & result.code & "'"
    end if

    gMY_TEST = false
  end if
end sub

function main()
  dim deep: deep = 0

  dim network: set network = WScript.CreateObject("WScript.Network")
  dim name: name = network.ComputerName  & vbCrLf
  test 1, deep, "hostname", name, "", 0

  if not gMY_TEST then
    echo deep, "[ERROR] runCmd"
    WScript.Quit 1
  end if
end function

main()
