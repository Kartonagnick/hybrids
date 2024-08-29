
'--- local/hybrids                                  [test][DTSImport][parse.vbs]
'[2024-08-29][19:00:00] 005 Kartonagnick    
'  --- CastleOfDreams/vbs                               [test][date][import.vbs]
'  [2021-09-06][19:00:00] 004 Kartonagnick
'  [2021-08-28][18:00:00] 003 Kartonagnick
'  [2021-08-23][18:00:00] 002 Kartonagnick
'  [2021-08-19][18:00:00] 001 Kartonagnick

dim deep: deep = 0

sub test(id, format, value, etalon)
  dim obj, dt, result
  set obj = (new DTSImport)(format)
  set dt  = obj.parse(value)
  result  = dt.logsStamp
  if result <> etalon then
    echo deep, "-----------------------------"
    echo deep, "[" & id & "][ERROR] result: " & result 
    echo deep, "[" & id & "][ERROR] etalon: " & etalon 
    gMY_TEST = false
  end if
end sub

sub main()

'--- typical  
  '         format                       source value                      result logsStamp    
  test  1, "YY-MM-DD"              , "2021-09-15"                  , "[2021-09-15][00:00:00.000]"
  test  2, "YY-MM-DD hh:mm:ss"     , "2021-09-15 12:25:35"         , "[2021-09-15][12:25:35.000]"
  test  3, "YY-MM-DD hms"          , "2021-09-15 12:25:35"         , "[2021-09-15][12:25:35.000]"
  test  4, "YY-MM-DD TIME"         , "2021-09-15 12:25:35"         , "[2021-09-15][12:25:35.000]"
  test  5, "YY-MM-DD TT"           , "2021-09-15 12:25:35.123"     , "[2021-09-15][12:25:35.123]"
  test  6, "Name_YY-MM-DD TT"      , "Name_2021-09-15 12:25:35.123", "[2021-09-15][12:25:35.123]"
  test  7, "text YY-DD text"       , "text 2021-09 text"           , "[2021-01-09][00:00:00.000]"
  test  8, "text DD hh text"       , "text 25 12 text"             , "[1970-01-25][12:00:00.000]"
  test  9, "hh YY/MM-DD mm[ss].ms" , "12 2021/11-25 35[59].123"    , "[2021-11-25][12:35:59.123]"
  test 10, "YY hh:mm:ss.ms DD MM"  , "2021 12:35:59.123 25 11"     , "[2021-11-25][12:35:59.123]"
  test 13, "YY"                    , "2021"                        , "[2021-01-01][00:00:00.000]"
  test 14, " "                     , "2021-08-25 12:35:59.123"     , "[2021-08-25][12:35:59.123]"
  test 15, ""                      , "2021-08-25 12:35:59.123"     , "[2021-08-25][12:35:59.123]"

'--- workspace style
  test 16, nothing                 , "2021y-08m-22d 12:23:45.123"  , "[2021-08-22][12:23:45.123]"
  test 17, nothing                 , "2021-08m-22   12:23:45.123"  , "[2021-08-22][12:23:45.123]"

'--- optional milliseconds
  test 18, "YY-MM-DD hh:mm:ss.ms"  , "2021-09-15 12:25:35"         , "[2021-09-15][12:25:35.000]"
  test 19, "YY-MM-DD TT"           , "2021-09-15 12:25:35"         , "[2021-09-15][12:25:35.000]"
  test 20, nothing                 , "2021-09-15 12:25:35"         , "[2021-09-15][12:25:35.000]"
  test 21, ""                      , "2021-09-15 12:25:35"         , "[2021-09-15][12:25:35.000]"

  if not gMY_TEST = true then
    echo deep, "[ERROR] DTSImport.parse"
    WScript.Quit 1
  end if
end sub

main()
