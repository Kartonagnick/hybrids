
'--- local/hybrids                                    [test/value][is_empty.vbs]
'[2024-03-20][13:00:00] 001 Kartonagnick    

class TestDummy
end class

dim deep: deep = 0
dim test_obj:
dim test_arr:
dim test_lst:
dim test_stk:
dim test_srt: 
dim test_hsh: 
dim test_que:
dim test_map:

sub test_initialize
  set test_obj = new TestDummy
  
  test_arr = array(1,2,3)
  
  set test_lst = CreateObject("System.Collections.ArrayList")
  test_lst.add 1
  test_lst.add 2
  test_lst.add 3
  
  set test_stk = CreateObject("System.Collections.Stack")
  test_stk.push 1
  test_stk.push 2
  test_stk.push 3
  
  set test_srt = CreateObject("System.Collections.SortedList")
  test_srt.add 1, 1
  test_srt.add 2, 2
  test_srt.add 3, 3
  
  set test_hsh = CreateObject("System.Collections.Hashtable")
  test_hsh.add 1, 1
  test_hsh.add 2, 2
  test_hsh.add 3, 3
  
  set test_que = CreateObject("System.Collections.Queue")
  test_que.Enqueue 1
  test_que.Enqueue 2
  test_que.Enqueue 3
  
  set test_map = CreateObject("Scripting.Dictionary")
  test_map(1) = 1
  test_map(2) = 2
  test_map(3) = 3
end sub

sub test_reset
  test_arr = array()
  set test_lst = CreateObject("System.Collections.ArrayList")
  set test_stk = CreateObject("System.Collections.Stack")
  set test_srt = CreateObject("System.Collections.SortedList")
  set test_hsh = CreateObject("System.Collections.Hashtable")
  set test_que = CreateObject("System.Collections.Queue")
  set test_map = CreateObject("Scripting.Dictionary")
end sub

sub do_error(id, value, result, expected)
  dim vt: vt = vartype(value)
  dim tn: tn = typename(value)
  echo deep, "[" & id & "][ERROR] expected : " & expected
  echo deep, "[" & id & "][ERROR] result   : " & result
  echo deep, "[" & id & "][ERROR] vartype  : " & vt
  echo deep, "[" & id & "][ERROR] typename : " & tn
  gMY_TEST = false
end sub

sub test(id, value, expected)
  dim val: set val = new Value
  dim result: result = val.is_empty(value)
  if result <> expected then
    do_error id, value, result, expected
  end if
end sub

function main()

  test_initialize

  test  1, Null     , true
  test  2, Empty    , true
  test  3, Nothing  , true
  test  4, test_obj , false
  test  5, "text"   , false
  test  6, ""       , true
  test  7, false    , true
  test  8, true     , false
  test  9, -1       , false
  test 10,  0       , true
  test 11,  1       , false
  test 12, -1.1     , false
  test 13,  0.0     , true
  test 14,  0.1     , false
  test 15,  1.2     , false
  test 16, test_arr , false
  test 17, test_lst , false
  test 18, test_stk , false
  test 19, test_srt , false
  test 20, test_hsh , false
  test 21, test_que , false
  test 22, test_map , false

  test_reset

  test 23, test_arr , true
  test 24, test_lst , true
  test 25, test_stk , true
  test 26, test_srt , true
  test 27, test_hsh , true
  test 28, test_que , true
  test 29, test_map , true

  if not gMY_TEST then
    echo deep, "[ERROR] to_string"
    WScript.Quit 1
  end if
end function

main()
