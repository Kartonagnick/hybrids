
'--- local/hybrids                                    [test/runBat][main.vbs]
' [2024-02-21][14:20:00] 001 Kartonagnick PRE

sub test(id, deep, stdout)

  dim path, result, was_err: was_err = false

  path = g_fso.GetParentFolderName(WScript.ScriptFullName)
  path = g_fso.BuildPath(path, "crol.bat") 
  dbg deep, "path: " & path

  set result = runBat(deep, true, path) 
  
  if result.stdout.count = 0 then was_err = true
  if result.stderr <> Empty  then was_err = true
  if result.code   <> 0      then was_err = true

  if was_err then
    echo deep, "[" & id & "][ERROR] cmd: '" & path & "'"
   
    if result.stdout.count = 0 then 
      echo deep, "[" & id & "][ERROR] stdout.count must be > 0"
    end if
  
    if result.stderr <> Empty then
      echo deep, "[" & id & "][ERROR] stderr: '" & result.stderr & "'"
    end if
  
    if result.code <> 0 then 
      echo deep, "[" & id & "][ERROR] exit-code: '" & result.code & "'"
    end if
  
    gMY_TEST = false
  end if

  if result.stdout.item("XXX") <> "1" then 
    echo deep, "[" & id & "][ERROR] value of variable 'XXX' must be 1"
    echo deep, "[" & id & "][ERROR] real: " & result.stdout.item("XXX")
    gMY_TEST = false
  end if

  if result.stdout.item("YYY") <> "2" then 
    echo deep, "[" & id & "][ERROR] value of variable 'YYY' must be 2"
    echo deep, "[" & id & "][ERROR] real: " & result.stdout.item("YYY")
    gMY_TEST = false
  end if

  if result.stdout.item("ZZZ") <> "3" then 
    echo deep, "[" & id & "][ERROR] value of variable 'ZZZ' must be 3"
    echo deep, "[" & id & "][ERROR] real: " & result.stdout.item("ZZZ")
    gMY_TEST = false
  end if
end sub

function main()
  dim deep: deep = 0
  test 1, deep, "hello world"

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] runBat"
  else
    echo deep, "[ERROR] runBat"
    WScript.Quit 1
  end if
end function

main()
