
'--- local/hybrids                                                 [unquote.vbs]
'[2026-01-28][18:10:00] 001 Kartonagnick    

function unquote(str)
  dim quot: quot = """"
  if left(str, 1) & right(str, 1) = quot & quot then 
    unquote = mid(str, 2, len(str) - 2)
  else
    unquote = str
  end if
end function
