
'--- local/hybrids                             [test/mask/MaskExp][toRegexp.vbs]
'[2024-02-23][06:50:00] 001 Kartonagnick PRE
'  --- CastleOfDreams/hybrids                     [test][mask][MaskExp/case.vbs]
'  [2022-02-06][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams/vbs                            [test][mask][MaskExp.vbs]
'    [2021-07-29][23:30:00] 001 Kartonagnick

dim deep: deep = 0

sub test(id, mask, must)
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
  test  1, "text"    , "^text$"
  test  2, "name.txt", "^name\.txt$"
  test  3, "name.*"  , "^name\..*$"
  test  4, "*.txt"   , "^.*\.txt$"
  test  5, ".git"    , "^\.git$"
  test  6, ".VC.db"  , "^\.VC\.db$"
  test  7, "?"       , "^.$"      
  test  8, "nam?"    , "^nam.$"      
  test  9, "name.t?t", "^name\.t.t$"
  test 10, "n??e.t*t", "^n..e\.t.*t$"
  test 11, "??"      , "^..$"

  if not gMY_TEST then
    echo deep, "[ERROR] MaskExp.toRegexp"
    WScript.Quit 1
  end if
end function

main()