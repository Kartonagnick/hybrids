
'--- local/hybrids                                      [test/logging][main.vbs]
'[2026-01-29][19:30:00] 001 Kartonagnick    

dim deep: deep = 0
dim READ_LINE: READ_LINE = -2

Const adTypeBinary = 1
Const adTypeText = 2
Const adModeUnknown = 0         'Значение по умолчанию. Права еще не заданы.
Const adModeRead = 1            'Только чтение. Поток можно только читать.
Const adModeWrite = 2           'Только запись. Поток можно только записывать.
Const adModeReadWrite = 3       'Чтение и запись.
Const adModeShareDenyRead  = 4  'Запрещает другим открытие с правами чтения.
Const adModeShareDenyWrite = 8  'Запрещает другим открытие с правами записи.

Const adSaveCreateOverWrite = 2

sub test_message(msg)
  WScript.Echo indent(deep) & msg
end sub

function check(id, result, etalon)
  result = trim(result)
  if result = etalon then
    check = true
    exit function
  end if
  test_message "[" & id & "][ERROR] etalon: '"  & etalon & "'"    
  test_message "[" & id & "][ERROR] result: '"  & result & "'"    
  gMY_TEST = false
  check = false
end function

sub test(id)
  dim path: path = g_logg.path
  if not g_fso.FileExists(path) then
    test_message "[" & id & "][ERROR] not exist: '"  & path & "'"    
    gMY_TEST = false
    exit sub
  end if

' test_message "path: " & path

  dim stream: set stream = CreateObject("ADODB.Stream")
  with stream
'   .Mode = adModeRead 
    .Type = adTypeText
    .CharSet = "utf-8"
    .Open
    .LoadFromFile path
  end with

  dim line, index: index = 0
  do while not stream.EOS
    line = stream.ReadText(READ_LINE)
    if index = 0 then
      check id, line, "main(1): running" 
      index = index + 1
    else
      check id, line, "main(1): done" 
      exit sub
    end if
  loop
end sub

function main()

  g_logg.echo 0, "main(1): running"
  g_logg.echo 0, "main(1): done"
  g_logg.close

  test 1

  if not gMY_TEST then
    echo deep, "[ERROR] logger"
    WScript.Quit 1
  end if
end function

main()
