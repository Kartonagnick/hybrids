
'--- local/hybrids                              [test/mask/MaskExp][include.vbs]
'[2024-03-08][19:00:00] 001 Kartonagnick PRE

dim deep: deep = 0

sub test(id, text, inc, expected)
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
  test 1, "main.cpp" , ""            , ""
  test 2, "main.cpp" , "*.hpp"       , "^.*\.hpp$"
  test 3, "main.cpp" , "*.hpp; *.cpp", "^.*\.hpp$;^.*\.cpp$"
  if not gMY_TEST then
    echo deep, "[ERROR] MaskExp.include"
    WScript.Quit 1
  end if
end function

main()
