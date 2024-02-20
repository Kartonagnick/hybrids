
'--- local/hybrids                                                 [padding.vbs]
'[2024-02-20][22:50:00] 002 Kartonagnick PRE
'  --- CastleOfDreams\hybrids                                      [padding.vbs]
'  [2022-01-26][19:00:00] 002 Kartonagnick
'  [2021-12-23][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams\vbs                                        [padding.vbs]
'    [2021y-01m-30d][19:00:00] 001 Kartonagnick

function padding(text, count, symbol)

  if count < 0 then
    WScript.Echo "[ERROR][ASSERT] padding: text: '" & text & "'"
    WScript.Echo "[ERROR][ASSERT] padding: count: '" & count & "'"
    WScript.Echo "[ERROR][ASSERT] padding: 'count' can not be < 0" 
    WScript.Quit 1
  end if

  if count > 20 then
    WScript.Echo "[ERROR][ASSERT] padding: text: '" & text & "'"
    WScript.Echo "[ERROR][ASSERT] padding: count: '" & count & "'"
    WScript.Echo "[ERROR][ASSERT] padding: 'count' can not be > 20" 
    WScript.Quit 1
  end if

  if len(symbol) > 1 then
    WScript.Echo "[ERROR][ASSERT] padding: text: '" & text & "'"
    WScript.Echo "[ERROR][ASSERT] padding: symbol: '" & symbol & "'"
    WScript.Echo "[ERROR][ASSERT] padding: len(symbol) must be = 1"
    WScript.Quit 1
  end if

  dim len_text: len_text = len(text)
  if len_text >= count then
    padding = "" & text
  else
    dim pd: pd = string(count - len_text, symbol)
    padding = pd & text
  end if  

end function
