
'--- local/hybrids                                              [env/string.vbs]
'[2024-09-30][19:00:00] 001 Kartonagnick PRE
' includeVBS("../assert.vbs")

function fromStringEnv(text)
  dim v
  if not vartype(text) = vbString then
    v = typename(text)
    exitByAssert "fromString", "invalid type: '" & v & "' (must be string)"
  end if
  if text = "" or text = "0" then 
    fromStringEnv = false
  elseif text = "1" then
    fromStringEnv = true
  else
    v = lcase(text)
    if v = "false" or v = "off" or v = "no" then 
      fromStringEnv = false
    elseif v = "true" or v = "on" or v = "yes" then 
      fromStringEnv = true
    else
      fromStringEnv = text
    end if
  end if
end function
