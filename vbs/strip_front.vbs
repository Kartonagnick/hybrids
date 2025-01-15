
'--- local/hybrids                                         [git/strip_front.vbs]
'[2025-01-15][23:40:00] 001 Kartonagnick    

function stripFrontImpl(front, text, mode_compare)

  if text = empty then 
    stripFrontImpl = ""
    exit function
  end if

  if front = empty then 
    stripFrontImpl = text
    exit function
  end if

  dim pos, start: start = 1
  ' sensitive  : 0
  ' insensitive: 1
  pos = Instr(start, text, front, mode_compare)
  if pos > 0 then
    stripFrontImpl = Right(text, Len(text) - Len(front))
  else
    stripFrontImpl = text
  end if
end function

function stripFront(front, text)
  dim sensitive: sensitive = vbBinaryCompare
  stripFront = stripFrontImpl(front, text, sensitive)
end function

function stripFrontI(front, text)
  dim insensitive: insensitive = vbTextCompare
  stripFrontI = stripFrontImpl(front, text, insensitive)
end function

