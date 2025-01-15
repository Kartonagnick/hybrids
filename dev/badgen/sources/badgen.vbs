
'--- local/hybrids                                      [dev/badgen][badgen.vbs]
'[2025-01-15][19:00:00] 001 Kartonagnick PRE

function makeBadgen(txt)
  dim yy, mo, dd, hh, mm, ss
  dim pos, expand, matches
  dim dat, tim, url

  makeBadgen = true

  pos = instr(1, txt, "https://img.shields.io/static/v1?label", 0)
  if pos < 1 then
    makeBadgen = makeImage(txt)
    exit function
  end if

  if not gREGEXP.test(txt) then 
    exit function
  end if

  set matches = gREGEXP.Execute(txt)
  if matches.Count < 1 then
    exit function
  end if

  set expand = matches.Item(0).Submatches
  yy = expand.Item(0): mo = expand.Item(1): dd = expand.Item(2)
  hh = expand.Item(3): mm = expand.Item(4): ss = expand.Item(5)

  dat = yy & "-" & mo & "-" & dd 
  tim = hh & ":" & mm & ":" & ss 
  url = "https://badgen.net/static/v1/" & tim & "/orange?label=" & dat
  txt = "[" & dat & " " & tim & "]: " & url
end function 
