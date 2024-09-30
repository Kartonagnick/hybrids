
'--- local/hybrids                                 [test][environment][array.vbs]
'[2024-09-30][19:00:00] 001 Kartonagnick    

dim result, etalon, deep: deep = 0

sub eq_compare(deep, id, value, etalon)
  if value <> etalon then
    dim tv: tv = typename(value)
    dim te: te = typename(etalon)
    echo deep, "-----------------------------"
    echo deep, "[" & id & "][ERROR] type: '" & tv & "', value : '" & value  & "'"
    echo deep, "[" & id & "][ERROR] type: '" & te & "', etalon: '" & etalon & "'"
    gMY_TEST = false
  end if
end sub

sub test(id, etalon, result)
  dim must, real, i: i = 0
  for each real in result
    if not vartype(real) = vbString then
      echo deep, "[ERROR] invalid type"
      echo deep, "[ERROR] etalon: String"
      echo deep, "[ERROR] result: " & typename(real)
    end if
    must = etalon(i)
   'dbg deep, "[" & id & "] real: " & real & " VS etalon: " & must
    eq_compare deep, id, real, must 
    i = i + 1
  next
end sub

sub main()

  set result = fromEnvironmentArray("test")
  etalon = array(                 _
    "[1970-01-01][00:10:00.300]", _
    "[1970-01-01][00:11:01.330]", _
    "[1970-01-01][00:12:02.360]", _
    "[1970-01-01][00:13:03.390]", _
    "[1970-01-01][00:14:04.420]", _
    "[1970-01-01][00:15:05.450]", _
    "[1970-01-01][00:16:06.480]", _
    "[1970-01-01][00:17:07.510]", _
    "[1970-01-01][00:18:08.540]", _
    "[1970-01-01][00:19:09.570]"  )
  test 1, etalon, result

  if not gMY_TEST then
    echo deep, "[ERROR] environment/array"
    WScript.Quit 1
  end if
end sub

main()
