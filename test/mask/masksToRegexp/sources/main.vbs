
'--- local/hybrids                           [test/mask/masksToRegexp][main.vbs]
'[2024-02-23][08:20:00] 001 Kartonagnick PRE
'  --- CastleOfDreams/hybrids                    [test][masksToRegexp][case.vbs]
'  [2022-02-06][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams/vbs                            [test][masksToRegexp.vbs]
'    [2021-07-29][23:30:00] 001 Kartonagnick

dim deep: deep = 0

function ArrayList_(text)
  dim e: dim a
  set a = CreateObject("System.Collections.ArrayList")
  for each e in split(text, ";")
    a.add(e)
  next
  set ArrayList_ = a
end function

sub test(id, masks, must)
  dim real: 
  real = masksToRegexp(masks).toArray()
  real = join(real, ";")
  if real <> must then
    echo deep, "[" & id & "][ERROR] masks : '" & real & "'"
    echo deep, "[" & id & "][ERROR] etalon: '" & must & "'"
    echo deep, "[" & id & "][ERROR] real  : '" & real & "'"
    gMY_TEST = false
  end if
end sub

function main()
  dim masks, etalon

  masks  = "den.*; a??b.tx*"
  etalon = "^den\..*$;^a..b\.tx.*$"
  test 1, masks, etalon

  masks  =  " ; ;  ;; den.*; ; a??b.tx*;  ;  ;; "
  etalon = "^den\..*$;^a..b\.tx.*$"
  test 2, masks, etalon

  masks = Array("", " ", "  ", " den.* ", " a??b.tx*", "  ")
  etalon = "^den\..*$;^a..b\.tx.*$"
  test 3, masks, etalon
   
  set masks = ArrayList_(" ; ;  ;; den.*; ; a??b.tx*;  ;  ;; ")
  etalon = "^den\..*$;^a..b\.tx.*$"
  test 4, masks, etalon

  if not gMY_TEST then
    echo deep, "[ERROR] masksToRegexp"
    WScript.Quit 1
  end if
end function

main()
