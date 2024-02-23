
'--- local/hybrids                             [test/MaskExp.toRegexp][main.vbs]
'[2024-02-23][06:50:00] 001 Kartonagnick PRE
'  --- CastleOfDreams/hybrids                     [test][mask][MaskExp/case.vbs]
'  [2022-02-06][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams/vbs                            [test][mask][MaskExp.vbs]
'    [2021-07-29][23:30:00] 001 Kartonagnick

sub test(id, deep, mask, must)
  dim check: set check = new MaskExp
  dim real: real = check.toRegexp(mask)
  if real <> must then
    echo deep, "-----------------------------"
    echo deep, "[" & id & "][ERROR] mask: '" & mask & "'"
    echo deep, "[" & id & "][ERROR] must: '" & must & "'"
    echo deep, "[" & id & "][ERROR] real: '" & real & "'"
    gCASE = false
  end if
end sub


function main()

  dim deep: deep = 0

  test  1, deep, "text"    , "^text$"
  test  2, deep, "name.txt", "^name\.txt$"
  test  3, deep, "name.*"  , "^name\..*$"
  test  4, deep, "*.txt"   , "^.*\.txt$"
  test  5, deep, ".git"    , "^\.git$"
  test  6, deep, ".VC.db"  , "^\.VC\.db$"
  test  7, deep, "?"       , "^.$"      
  test  8, deep, "nam?"    , "^nam.$"      
  test  9, deep, "name.t?t", "^name\.t.t$"
  test 10, deep, "n??e.t*t", "^n..e\.t.*t$"
  test 11, deep, "??"      , "^..$"

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] MaskExp.toRegexp"
  else
    echo deep, "[ERROR] MaskExp.toRegexp"
    WScript.Quit 1
  end if
end function

main()
