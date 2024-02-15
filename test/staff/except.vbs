
'--- local/hybrids                                       [test/staff/except.vbs]
'[2024-02-15][19:00:00] 001 Kartonagnick    
' includeVBS("errCode.vbs")

dim gERR_NUMBER

sub saveException()
  gERR_NUMBER = err.Number
end sub

sub checkException(deep, id, err_etalon)
  if gERR_NUMBER <> err_etalon Then
    dim real  : real   = errorString(gERR_NUMBER)
    dim etalon: etalon = errorString(err_etalon)
    echo deep, "-----------------------------"
    echo deep, "[" & id & "][ERROR] result-exception(" & gERR_NUMBER & ") " & real
    echo deep, "[" & id & "][ERROR] etalon-exception(" & err_etalon  & ") " & etalon
    gMY_TEST = false
    err.Clear
  end if
end sub
