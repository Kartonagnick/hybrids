
'--- local/hybrids                                          [git/strip_back.vbs]
'[2025-01-15][23:40:00] 001 Kartonagnick    

function stripBackImpl(text, back, mode_compare)

  if text = empty then 
    stripBackImpl = ""
    exit function
  end if

  if back = empty then 
    stripBackImpl = text
    exit function
  end if

  dim pos, start: start = Len(text)
  ' sensitive  : 0
  ' insensitive: 1
  pos = InStrRev(text, back, start, mode_compare)
  if pos > 0 then
    stripBackImpl = Left(text, Len(text) - Len(back))
  else
    stripBackImpl = text
  end if
end function

function stripBack(text, back)
  dim sensitive: sensitive = vbBinaryCompare
  stripBack = stripBackImpl(text, back, sensitive)
end function

function stripBackI(text, back)
  dim insensitive: insensitive = vbTextCompare
  stripBackI = stripBackImpl(text, back, insensitive)
end function

