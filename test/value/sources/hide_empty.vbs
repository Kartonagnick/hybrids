
'--- local/hybrids                                  [test/value][hide_empty.vbs]
'[2024-03-20][13:00:00] 001 Kartonagnick PRE

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

sub do_error(id, value, result, expected, mode)
  dim vt: vt = vartype(value)
  dim tn: tn = typename(value)
  echo deep, "[" & id & "][ERROR] " & mode
  echo deep, "[" & id & "][ERROR] expected : " & expected
  echo deep, "[" & id & "][ERROR] result   : " & result
  echo deep, "[" & id & "][ERROR] vartype  : " & vt
  echo deep, "[" & id & "][ERROR] typename : " & tn
  gMY_TEST = false
end sub

sub test(id, value, expected)
  dim val: set val = new Value
  dim result: result = val.to_string(value)
  if result <> expected then
    dim mode: mode = "mode: hide empty value" 
    do_error id, value, result, expected, mode
  end if
end sub

function main()

  test_initialize

  test  1, Null     , ""
  test  2, Empty    , ""
  test  3, Nothing  , ""
  test  4, test_obj , "(TestDummy)"
  test  5, "text"   , "text"
  test  6, ""       , ""
  test  7, false    , "false"
  test  8, true     , "true"
  test  9, -1       , "-1"
  test 10,  0       , "0"
  test 11,  1       , "1"
  test 12, -1.1     , "-1.1"
  test 13,  0.0     , "0"
  test 14,  0.1     , "0.1"
  test 15,  1.2     , "1.2"
  test 16, test_arr , "(Array: 3)"
  test 17, test_lst , "(ArrayList: 3)"
  test 18, test_stk , "(Stack: 3)"
  test 19, test_srt , "(SortedList: 3)"
  test 20, test_hsh , "(Hashtable: 3)"
  test 21, test_que , "(Queue: 3)"
  test 22, test_map , "(Dictionary: 3)"

  if not gMY_TEST then
    echo deep, "[ERROR] to_string"
    WScript.Quit 1
  end if
end function

main()
