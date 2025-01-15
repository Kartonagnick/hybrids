
'--- local/hybrids                                       [dev/badgen][image.vbs]
'[2025-01-15][19:00:00] 001 Kartonagnick PRE

function makeImage(txt)
  dim front, yy, mo, dd, hh, mm, ss, back
  dim pos, expand, matches
  dim dat, tim, url

  makeImage = true
  if not gREGEXP2.test(txt) then 
    exit function
  end if

  set matches = gREGEXP2.Execute(txt)
  if matches.Count < 1 then
    exit function
  end if

  set expand = matches.Item(0).Submatches
  front = expand.Item(0)
  yy = expand.Item(1): mo = expand.Item(2): dd = expand.Item(3)
  hh = expand.Item(4): mm = expand.Item(5): ss = expand.Item(6)
  back = expand.Item(7)

  dat = yy & "-" & mo & "-" & dd 
  tim = hh & ":" & mm & ":" & ss 
  txt = front & "![" & dat & " " & tim & "]" & back
end function
