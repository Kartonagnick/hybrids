
'--- local/hybrids                                   [test][date\range][main.vbs]
'[2024-09-17][19:00:00] 002 Kartonagnick PRE
'  --- CastleOfDreams/vbs                                 [test][date][range.vbs]
'  [2021-09-06][19:00:00] 001 Kartonagnick
'  [2021-09-03][18:00:00] 001 Kartonagnick

dim deep: deep = 0

sub test(id, b, e, count)
  dim tp: tp = typename(b)
  dim real, must, el, i: i = 0
  dim prefix: prefix = "[1970-01-01][00:00:"
  dim list: set list = dateRange(b, e, count)
  dim dval: set dval = new DTSValue
  for each el in list
    if tp <> typename(el) then
      echo deep, "[ERROR] invalid type"
      echo deep, "[ERROR] expected: " & tp
      echo deep, "[ERROR] real: " & typename(el)
    end if
    dval.date = el
    real = dval.logsStamp()
    must = prefix & twoDigits(i) & ".000]"
   'dbg deep, "[" & id & "] date: " & real & " VS etalon: " & must
    eq_compare deep, id, real, must
    i = i + 1
  next 
end sub

sub test_array(id, etalon, result)
  dim tp: tp = "DTSValue"
  dim must, real, i: i = 0
  for each real in result
    if tp <> typename(real) then
      echo deep, "[ERROR] invalid type"
      echo deep, "[ERROR] expected: " & tp
      echo deep, "[ERROR] real: " & typename(real)
    end if
    must = etalon(i)
    real = real.logsStamp()
   'dbg deep, "[" & id & "] real: " & real & " VS etalon: " & must
    eq_compare deep, id, real, must 
    i = i + 1
  next
end sub

sub main()
  dim bd, ed, bv, ev, etalon, result

'---- Date
  bd = #1970-01-01 00:00:00#
  ed = #1970-01-01 00:00:10#
  test 1, bd, ed, 10

'---- DTSValue
  bd = #1970-01-01 00:00:00#
  ed = #1970-01-01 00:00:10#
  set bv = (new DTSValue)(bd, 0)
  set ev = (new DTSValue)(ed, 0)
  test 2, bv, ev, 10

'---- DTStamp
  bd = #1970-01-01 00:00:00#
  ed = #1970-01-01 00:00:10#
  set bv = (new DTStamp)(bd)
  set ev = (new DTStamp)(ed)
  test 3, bv, ev, 10

'---- String 1
  etalon = array(              _
    "[1970-01-01][00:00:00.300]", _
    "[1970-01-01][00:00:01.330]", _
    "[1970-01-01][00:00:02.360]", _
    "[1970-01-01][00:00:03.390]", _
    "[1970-01-01][00:00:04.420]", _
    "[1970-01-01][00:00:05.450]", _
    "[1970-01-01][00:00:06.480]", _
    "[1970-01-01][00:00:07.510]", _
    "[1970-01-01][00:00:08.540]", _
    "[1970-01-01][00:00:09.570]", _
    "[1970-01-01][00:00:10.600]"  )

  bv = "1970-01m-01 00:00:00.300"
  ev = "1970-01m-01 00:00:10.600"
  set result = dateRange(bv, ev, 10)
  test_array 4, etalon, result 

'---- String 2
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
    "[1970-01-01][00:19:09.570]", _
    "[1970-01-01][00:20:10.600]"  )

  bv = "1970-01m-01 00:10:00.300"
  ev = "1970-01m-01 00:20:10.600"

  set result = dateRange(bv, ev, 10)
  test_array 5, etalon, result 

  if not gMY_TEST then
    echo deep, "[ERROR] dateRange"
    WScript.Quit 1
  end if
end sub

main()
