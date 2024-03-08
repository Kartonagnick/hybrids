
'--- local/hybrids                              [test/MaskExp.include][main.vbs]
'[2024-03-08][19:00:00] 001 Kartonagnick    

sub test(id, deep, text, inc, expected)
  dim check: set check = new MaskExp
  check.include = inc

  dim result: result = check.include.toArray
  result = join(result, ";")

  if result <> expected then
    echo deep, "[" & id & "][ERROR] exclude : '" & inc      & "'"
    echo deep, "[" & id & "][ERROR] expected: '" & expected & "'"
    echo deep, "[" & id & "][ERROR] result  : '" & result   & "'"
    gMY_TEST = false
  end if
end sub

function main()
  dim deep: deep = 0

  test 1, deep, "main.cpp" , ""            , ""
  test 2, deep, "main.cpp" , "*.hpp"       , "^.*\.hpp$"
  test 3, deep, "main.cpp" , "*.hpp; *.cpp", "^.*\.hpp$;^.*\.cpp$"

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] MaskExp.include"
  else
    echo deep, "[ERROR] MaskExp.include"
    WScript.Quit 1
  end if
end function

main()
