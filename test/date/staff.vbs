
'--- local/hybrids                                         [test/date/staff.vbs]
'[2024-08-01][19:00:00] 001 Kartonagnick    
'  --- CastleOfDreams\hybrids                       [test][date/cases/staff.vbs]
'  [2022-03-16][19:00:00] 001 Kartonagnick
'    --- CastleOfDreams\vbs                                       [test/all.vbs]
'    [2021-09-06][19:00:00] 019 Kartonagnick
'    [2021-09-03][18:00:00] 019 Kartonagnick
'    [2021-08-31][18:00:00] 018 Kartonagnick
'    [2021-08-25][18:00:00] 017 Kartonagnick
'    [2021-08-15][15:00:00] 016 Kartonagnick
'    [2021-08-10][19:00:00] 015 Kartonagnick
'    [2021-08-08][19:00:00] 014 Kartonagnick
'    [2021-08-04][23:30:00] 013 Kartonagnick
'    [2021-08-02][23:30:00] 012 Kartonagnick
'    [2021-07-31][15:00:00] 011 Kartonagnick
'    [2021-07-30][23:30:00] 010 Kartonagnick
'    [2021-07-29][23:30:00] 009 Kartonagnick
'    [2021-07-28][19:00:00] 008 Kartonagnick
'    [2021-07-27][19:00:00] 007 Kartonagnick
'    [2021-07-25][19:00:00] 006 Kartonagnick
'    [2021-07-24][20:00:00] 005 Kartonagnick
'    [2021-07-22][19:00:00] 004 Kartonagnick
'    [2021-07-21][16:00:00] 003 Kartonagnick
'    [2021-07-20][16:00:00] 002 Kartonagnick
'    [2021-07-19][20:00:00] 001 Kartonagnick

dim gCOMMA_DOUBLE_SEPPARATOR
gCOMMA_DOUBLE_SEPPARATOR = IsNumeric("1,1")

sub eq_compare(deep, id, value, etalon)
  if isDate(value) then
    if dateDiff("s", etalon, value) <> 0 then
      echo deep, "-----------------------------"
      echo deep, "[" & id & "][ERROR] value : '" & value  & "'"
      echo deep, "[" & id & "][ERROR] etalon: '" & etalon & "'"
      gMY_TEST = false
    end if
    exit sub
  end if

  if value <> etalon then
    dim tv: tv = typename(value)
    dim te: te = typename(etalon)
    echo deep, "-----------------------------"
    echo deep, "[" & id & "][ERROR] type: '" & tv & "', value : '" & value  & "'"
    echo deep, "[" & id & "][ERROR] type: '" & te & "', etalon: '" & etalon & "'"
    gMY_TEST = false
  end if
end sub

sub neq_compare(deep, id, value, etalon)
  if isDate(value) then
    if dateDiff("s", etalon, value) = 0 then
      echo deep, "-----------------------------"
      echo deep, "[" & id & "][ERROR] must be negative"
      echo deep, "[" & id & "][ERROR] value : '" & value  & "'"
      echo deep, "[" & id & "][ERROR] etalon: '" & etalon & "'"
      gMY_TEST = false
    end if
    exit sub
  end if

  if value = etalon then
    dim tv: tv = typename(value)
    dim te: te = typename(etalon)
    echo deep, "-----------------------------"
    echo deep, "[" & id & "][ERROR] must be negative"
    echo deep, "[" & id & "][ERROR] type: '" & tv & "', value : '" & value  & "'"
    echo deep, "[" & id & "][ERROR] type: '" & te & "', etalon: '" & etalon & "'"
    gMY_TEST = false
  end if
end sub

sub check_exception(deep, id, err_type)
  if err.Number <> err_type Then
    dim real  : real   = errorString(err.Number)
    dim etalon: etalon = errorString(err_type)
    echo deep, "-----------------------------"
    echo deep, "[" & id & "][ERROR] result-exception(" & err.Number & ") " & real
    echo deep, "[" & id & "][ERROR] etalon-exception(" & err_type   & ") " & etalon
    gMY_TEST = false
    err.Clear
  end if
end sub
