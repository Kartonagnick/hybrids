
'--- local/hybrids                                 [test][date\range][except.vbs]
'[2024-09-17][19:00:00] 001 Kartonagnick    

dim bd, ed, bv, ev, bs, es, deep: deep = 0

sub test(id, bd, ed, count)
  on error resume Next
  err.clear
  dim list: set list = dateRange(bd, ed, count)
  check_exception deep, id, errorOutRange
  on error goto 0
end sub

sub main()

'--- date: exception(b <= e)
  bd = #1970-01-01 00:00:10#
  ed = #1970-01-01 00:00:00#
  test 1, bd, ed, 1

'--- date: exception(count >=0)
  bd = #1970-01-01 00:00:00#
  ed = #1970-01-01 00:00:10#
  test 2, bd, ed, -1

'--- DTSValue: exception(b <= e)
  bd = #1970-01-01 00:00:10#
  ed = #1970-01-01 00:00:00#
  set bv = (new DTSValue)(bd, 0)
  set ev = (new DTSValue)(ed, 0)
  test 3, bv, ev, 1

'--- DTSValue: exception(count >=0)
  bd = #1970-01-01 00:00:00#
  ed = #1970-01-01 00:00:10#
  set bv = (new DTSValue)(bd, 0)
  set ev = (new DTSValue)(ed, 0)
  test 4, bv, ev, -1

'--- DTStamp: exception(b <= e)
  bd = #1970-01-01 00:00:10#
  ed = #1970-01-01 00:00:00#
  set bs = (new DTStamp)(bd)
  set es = (new DTStamp)(ed)
  test 5, bs, es, 1

'--- DTStamp: exception(count >=0)
  bd = #1970-01-01 00:00:00#
  ed = #1970-01-01 00:00:10#
  set bs = (new DTStamp)(bd)
  set es = (new DTStamp)(ed)
  test 6, bs, es, -1

'--- String: exception(b <= e)
  bd = "1970-01-01 00:00:10"
  ed = "1970-01-01 00:00:00"
  test 7, bd, ed, 1

'--- String: exception(count >=0)
  bd = "1970-01-01 00:00:00"
  ed = "1970-01-01 00:00:10"
  test 8, bd, ed, -1

  if not gMY_TEST = true then
    echo deep, "[ERROR] dateRange: exception"
    WScript.Quit 1
  end if
end sub

main()
