
'--- local/hybrids                                      [test/errCode][main.vbs]
'[2024-02-19][15:00:00] 003 Kartonagnick PRE
'  --- CastleOfDreams/hybrids                           [test/errcode][case.vbs]
'  [2022-02-22][19:00:00] 003 Kartonagnick
'  [2022-01-26][19:00:00] 002 Kartonagnick
'  [2021-12-26][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams/vbs                      [test/errcode][errorString.vbs]
'    [2021-08-15][15:00:00] 003 Kartonagnick
'    [2021-08-08][19:00:00] 002 Kartonagnick
'    [2021-07-19][20:00:00] 001 Kartonagnick

sub test(id, deep, val, must)
  dim real: real = errorString(val)
  if real <> must then
    echo deep, "[" & id & "][ERROR] val  : " & val
    echo deep, "[" & id & "][ERROR] must : " & must
    echo deep, "[" & id & "][ERROR] real : " & real
    gMY_TEST = false
  end if
end sub

function main()
  dim deep: deep = 0

  test  1, deep, errorAssertFailed    , "errorAssertFailed"
  test  2, deep, errorTestFailed      , "errorTestFailed"
  test  3, deep, errorFuncFailed      , "errorFuncFailed"
  test  4, deep, errorExecFailed      , "errorExecFailed"
  test  5, deep, errorInvalidTag      , "errorInvalidTag"
  test  6, deep, errorInvalidType     , "errorInvalidType"
  test  7, deep, errorInvalidSize     , "errorInvalidSize"
  test  8, deep, errorInvalidToken    , "errorInvalidToken"
  test  9, deep, errorInvalidOrder    , "errorInvalidOrder"
  test 10, deep, errorInvalidArgument , "errorInvalidArgument"
  test 11, deep, errorInvalidSequence , "errorInvalidSequence"
  test 12, deep, errorInvalidText     , "errorInvalidText"
  test 13, deep, errorEmptyData       , "errorEmptyData"
  test 14, deep, errorOutRange        , "errorOutRange"
  test 15, deep, errorNotFound        , "errorNotFound"
  test 16, deep, errorNotExists       , "errorNotExists"
  test 17, deep, errorAlreadyExists   , "errorAlreadyExists"
  test 18, deep, errorLogick          , "errorLogick"
  test 19, deep, errorLogick + 1      , "errorUnknown"
  test 20, deep, errorLogick + 10     , "errorUnknown"
  test 21, deep, errorLogick + 100    , "errorUnknown"

  if not gMY_TEST then
    echo deep, "[ERROR] errCode"
    WScript.Quit 1
  end if
end function

main()
