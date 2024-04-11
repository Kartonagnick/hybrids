
'--- local/hybrids                             [test][view/tree_empty][main.vbs]
'[2024-04-11][19:00:00] 001 Kartonagnick    
'
'checked containers:
'      value = Array
'  set value = CreateObject("Scripting.Dictionary")
'  set value = CreateObject("System.Collections.Queue")
'  set value = CreateObject("System.Collections.Stack")
'  set value = CreateObject("System.Collections.ArrayList")
'  set value = CreateObject("System.Collections.Hashtable")
'  set value = CreateObject("System.Collections.SortedList")

class TestDummy
end class

dim page: set page = CreateObject("System.Collections.ArrayList")
dim obj: set obj = new TestDummy
dim deep: deep = 0
dim subval
dim value

sub test(id, value, expect)
  dim result: dim txt: dim el
  dim out: set out = new TreeEmpty
  set result = out.getText(value)
  txt = result.toArray()
  txt = join(txt, ";")
  if txt <> expect then
    echo deep, "[" & id & "][ERROR] expect: " & expect
    echo deep, "[" & id & "][ERROR] result: " & txt
    gMY_TEST = false
  end if
end sub

sub check(id, value, expect)
  dim result: dim out: set out = new TreeEmpty
  set result = out.getText(value)

  dim res_string
  res_string = result.toArray()
  res_string = join(res_string, ";")

  dim exp_string
  exp_string = expect.toArray()
  exp_string = join(exp_string, ";")

  if res_string <> exp_string then
    gMY_TEST = false
    dim el
    echo deep, "[" & id & "][ERROR] expect:"
    for each el in expect
      echo deep, el
    next
    echo deep, "[" & id & "][ERROR] result:"
    for each el in result
      echo deep, el
    next
  end if
  expect.clear
end sub

function main()

  test  1, Null     , "(empty)"
  test  2, Empty    , "(empty)"
  test  3, Nothing  , "(empty)"
  test  4, ""       , "(empty)"
  test  5, "text"   , "text"
  test  6, false    , "false"
  test  7, true     , "true"
  test  8, -1       , "-1"
  test  9,  0       , "0"
  test 10,  1       , "1"
  test 11, -1.1     , "-1.1"
  test 12,  0.0     , "0"
  test 13,  0.1     , "0.1"
  test 14,  1.2     , "1.2"
  test 15, obj      , "(TestDummy)"
'---
  value = array()  
  test 16, value, "(empty)"

  set value = CreateObject("System.Collections.ArrayList")
  test 17, value, "(empty)"
'---

  value = array(1)  
  page.add "1"
  check 18, value, page 

  set value = CreateObject("System.Collections.ArrayList")
  value.add 1
  test 19, value, "1"

'---
  value = array(1,2,3)  
  page.add "1"
  page.add "2"
  page.add "3"
  check 20, value, page 

  set value = CreateObject("System.Collections.ArrayList")
  value.add 1
  value.add 2
  value.add 3
  page.add "1"
  page.add "2"
  page.add "3"
  check 21, value, page 

'---
  value = array(1, array(1, array(true, 1.1, "", 2, false), Null, Nothing, array(), array(Nothing, Nothing), 3), "end")
  page.add "1"
  page.add "  1"
  page.add "    true"
  page.add "    1.1"
  page.add "    (empty)"
  page.add "    2"
  page.add "    false"
  page.add "  (empty)"
  page.add "  (empty)"
  page.add "  (empty)"
  page.add "    (empty)"
  page.add "    (empty)"
  page.add "  3"
  page.add "end"
  check 22, value, page 

  dim list: set list = CreateObject("System.Collections.ArrayList")
  value = array(1, array(1, array(true, 1.1, "", 2, false), Null, Nothing, list, array(), array(Nothing, Nothing), 3), "end")
  page.add "1"
  page.add "  1"
  page.add "    true"
  page.add "    1.1"
  page.add "    (empty)"
  page.add "    2"
  page.add "    false"
  page.add "  (empty)"
  page.add "  (empty)"
  page.add "  (empty)"
  page.add "  (empty)"
  page.add "    (empty)"
  page.add "    (empty)"
  page.add "  3"
  page.add "end"
  check 23, value, page 

  list.clear
  list.add 11
  list.add true
  list.add 12
  value = array(1, array(1, array(true, 1.1, "", 2, false), Null, Nothing, list, array(), array(Nothing, Nothing), 3), "end")
  page.add "1"
  page.add "  1"
  page.add "    true"
  page.add "    1.1"
  page.add "    (empty)"
  page.add "    2"
  page.add "    false"
  page.add "  (empty)"
  page.add "  (empty)"
  page.add "    11"
  page.add "    true"
  page.add "    12"
  page.add "  (empty)"
  page.add "    (empty)"
  page.add "    (empty)"
  page.add "  3"
  page.add "end"
  check 24, value, page 
'---
  set value = CreateObject("Scripting.Dictionary")
  page.add "(empty)"
  check 25, value, page 

  set value = CreateObject("Scripting.Dictionary")
  value("name") = "Alex"
  value("age") = 18
  page.add "name: Alex"
  page.add "age: 18"
  check 26, value, page 
'---
  set subval = CreateObject("Scripting.Dictionary")
  set value = CreateObject("Scripting.Dictionary")
  value("name") = "Alex"
  value("age") = 18
  value.add "status", subval
  page.add "name: Alex"
  page.add "age: 18"
  page.add "status: (empty)"
  check 27, value, page 
'---
  set subval = CreateObject("Scripting.Dictionary")
  subval("enabled") = true
  subval("errors") = 12
  set value = CreateObject("Scripting.Dictionary")
  value("name") = "Alex"
  value("age") = 18
  value.add "status", subval
  page.add "name: Alex"
  page.add "age: 18"
  page.add "status:"
  page.add "  enabled: true"
  page.add "  errors: 12"
  check 28, value, page 
'---
  set value = CreateObject("System.Collections.SortedList")
  page.add "(empty)"
  check 29, value, page 
  
  value.add "hello", "world"
  page.add "hello: world"
  check 30, value, page 
'---
  set subval = CreateObject("System.Collections.SortedList")
  subval.add "aaa", true
  subval.add "bbb", 12
  set value = CreateObject("System.Collections.SortedList")
  value.add "AAA", "Alex"
  value.add "BBB", 18
  value.add "status", subval
  page.add "AAA: Alex"
  page.add "BBB: 18"
  page.add "status:"
  page.add "  aaa: true"
  page.add "  bbb: 12"
  check 31, value, page 
'---
  set value = CreateObject("System.Collections.Stack")
  page.add "(empty)"
  check 33, value, page 

  value.push 1
  value.push 2
  value.push 3
  page.add "3"
  page.add "2"
  page.add "1"
  check 34, value, page 
'---
  set subval = CreateObject("System.Collections.Stack")
  set value  = CreateObject("System.Collections.Stack")

  value.push 1
  value.push subval
  value.push 3
  page.add "3"
  page.add "(empty)"
  page.add "1"
  check 35, value, page 
'---
  set subval = CreateObject("System.Collections.Stack")
  subval.push "AAA"
  subval.push "BBB"
  subval.push "CCC"
  set value  = CreateObject("System.Collections.Stack")

  value.push 1
  value.push subval
  value.push 3
  page.add "3"
  page.add "  CCC"
  page.add "  BBB"
  page.add "  AAA"
  page.add "1"
  check 36, value, page 
'---
  set value = CreateObject("System.Collections.Queue")
  page.add "(empty)"
  check 37, value, page 
  
  value.Enqueue 1
  value.Enqueue 2
  value.Enqueue 3
  page.add "1"
  page.add "2"
  page.add "3"
  check 38, value, page 

'---
  set subval = CreateObject("System.Collections.Queue")
  set value = CreateObject("System.Collections.Queue")
  
  value.Enqueue 1
  value.Enqueue subval
  value.Enqueue 3
  page.add "1"
  page.add "(empty)"
  page.add "3"
  check 39, value, page 
'---
  set subval = CreateObject("System.Collections.Queue")
  subval.Enqueue 1
  subval.Enqueue 2
  subval.Enqueue 3
  set value = CreateObject("System.Collections.Queue")
  value.Enqueue 1
  value.Enqueue subval
  value.Enqueue 3
  page.add "1"
  page.add "  1"
  page.add "  2"
  page.add "  3"
  page.add "3"
  check 40, value, page 

'---
  set value = CreateObject("System.Collections.Hashtable")
  page.add "(empty)"
  check 41, value, page

  value.add "hello", "world"
  page.add "(Hashtable: 1)"
  check 42, value, page

  set value = CreateObject("System.Collections.Hashtable")
  value.add "hello", "world"
  value.add "ololo", "trololo"
  page.add "(Hashtable: 2)"
  check 43, value, page

  set subval = CreateObject("System.Collections.Hashtable")
  subval.add "hello", "world"
  set value = CreateObject("System.Collections.Hashtable")
  value.add "hello", "world"
  page.add "(Hashtable: 1)"
  page.add "(Hashtable: 1)"
  check 44, Array(subval, value), page

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] view/tree_empty"
  else
    echo deep, "[ERROR] view/tree_empty"
    WScript.Quit 1
  end if
end function

main()
