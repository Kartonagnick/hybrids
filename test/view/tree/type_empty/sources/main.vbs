
'--- local/hybrids                             [test][tree/type_empty][main.vbs]
rem [2024-04-05][23:50:00] 001 Kartonagnick PRE
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
  dim out: set out = (new Tree)(true, true)
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
  dim result: dim out: set out = (new Tree)(true, true)
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

  test  1, Null     , "<Null> (empty)"
  test  2, Empty    , "<Empty> (empty)"
  test  3, Nothing  , "<Nothing> (empty)"
  test  4, ""       , "<String> (empty)"
  test  5, "text"   , "<String> text"
  test  6, false    , "<Bool> false"
  test  7, true     , "<Bool> true"
  test  8, -1       , "<Integer> -1"
  test  9,  0       , "<Integer> 0"
  test 10,  1       , "<Integer> 1"
  test 11, -1.1     , "<Double> -1.1"
  test 12,  0.0     , "<Double> 0"
  test 13,  0.1     , "<Double> 0.1"
  test 14,  1.2     , "<Double> 1.2"
  test 15, obj      , "<TestDummy>"
'---
  value = array()  
  test 16, value, "<Array> (empty)"

  set value = CreateObject("System.Collections.ArrayList")
  test 17, value, "<ArrayList> (empty)"
'---

  value = array(1)  
  page.add "<Array: 1>"
  page.add "  <Integer> 1"
  check 18, value, page 

  set value = CreateObject("System.Collections.ArrayList")
  value.add 1
  page.add "<ArrayList: 1>"
  page.add "  <Integer> 1"
  check 19, value, page 

'---
  value = array(1,2,3)  
  page.add "<Array: 3>"
  page.add "  <Integer> 1"
  page.add "  <Integer> 2"
  page.add "  <Integer> 3"
  check 20, value, page 

  set value = CreateObject("System.Collections.ArrayList")
  value.add 1
  value.add 2
  value.add 3
  page.add "<ArrayList: 3>"
  page.add "  <Integer> 1"
  page.add "  <Integer> 2"
  page.add "  <Integer> 3"
  check 21, value, page 

'---
  value = array(1, array(1, array(true, 1.1, "", 2, false), Null, Nothing, array(), array(Nothing, Nothing), 3), "end")
  page.add "<Array: 3>"
  page.add "  <Integer> 1"
  page.add "  <Array: 7>"
  page.add "    <Integer> 1"
  page.add "    <Array: 5>"
  page.add "      <Bool> true"
  page.add "      <Double> 1.1"
  page.add "      <String> (empty)"
  page.add "      <Integer> 2"
  page.add "      <Bool> false"
  page.add "    <Null> (empty)"
  page.add "    <Nothing> (empty)"
  page.add "    <Array> (empty)"
  page.add "    <Array: 2>"
  page.add "      <Nothing> (empty)"
  page.add "      <Nothing> (empty)"
  page.add "    <Integer> 3"
  page.add "  <String> end"
  check 22, value, page 

  dim list: set list = CreateObject("System.Collections.ArrayList")
  value = array(1, array(1, array(true, 1.1, "", 2, false), Null, Nothing, list, array(), array(Nothing, Nothing), 3), "end")
  page.add "<Array: 3>"
  page.add "  <Integer> 1"
  page.add "  <Array: 8>"
  page.add "    <Integer> 1"
  page.add "    <Array: 5>"
  page.add "      <Bool> true"
  page.add "      <Double> 1.1"
  page.add "      <String> (empty)"
  page.add "      <Integer> 2"
  page.add "      <Bool> false"
  page.add "    <Null> (empty)"
  page.add "    <Nothing> (empty)"
  page.add "    <ArrayList> (empty)"
  page.add "    <Array> (empty)"
  page.add "    <Array: 2>"
  page.add "      <Nothing> (empty)"
  page.add "      <Nothing> (empty)"
  page.add "    <Integer> 3"
  page.add "  <String> end"
  check 23, value, page 

  list.clear
  list.add 11
  list.add true
  list.add 12
  value = array(1, array(1, array(true, 1.1, "", 2, false), Null, Nothing, list, array(), array(Nothing, Nothing), 3), "end")
  page.add "<Array: 3>"
  page.add "  <Integer> 1"
  page.add "  <Array: 8>"
  page.add "    <Integer> 1"
  page.add "    <Array: 5>"
  page.add "      <Bool> true"
  page.add "      <Double> 1.1"
  page.add "      <String> (empty)"
  page.add "      <Integer> 2"
  page.add "      <Bool> false"
  page.add "    <Null> (empty)"
  page.add "    <Nothing> (empty)"
  page.add "    <ArrayList: 3>"
  page.add "      <Integer> 11"
  page.add "      <Bool> true"
  page.add "      <Integer> 12"
  page.add "    <Array> (empty)"
  page.add "    <Array: 2>"
  page.add "      <Nothing> (empty)"
  page.add "      <Nothing> (empty)"
  page.add "    <Integer> 3"
  page.add "  <String> end"
  check 24, value, page 
'---
  set value = CreateObject("Scripting.Dictionary")
  page.add "<Dictionary> (empty)"
  check 25, value, page 

  set value = CreateObject("Scripting.Dictionary")
  value("name") = "Alex"
  value("age") = 18
  page.add "<Dictionary: 2>"
  page.add "  key <String> name"
  page.add "    <String> Alex"
  page.add "  key <String> age"
  page.add "    <Integer> 18"
  check 26, value, page 
'---
  set subval = CreateObject("Scripting.Dictionary")
  set value = CreateObject("Scripting.Dictionary")
  value("name") = "Alex"
  value("age") = 18
  value.add "status", subval
  page.add "<Dictionary: 3>"
  page.add "  key <String> name"
  page.add "    <String> Alex"
  page.add "  key <String> age"
  page.add "    <Integer> 18"
  page.add "  key <String> status"
  page.add "    <Dictionary> (empty)"
  check 27, value, page 
'---
  set subval = CreateObject("Scripting.Dictionary")
  subval("enabled") = true
  subval("errors") = 12
  set value = CreateObject("Scripting.Dictionary")
  value("name") = "Alex"
  value("age") = 18
  value.add "status", subval
  page.add "<Dictionary: 3>"
  page.add "  key <String> name"
  page.add "    <String> Alex"
  page.add "  key <String> age"
  page.add "    <Integer> 18"
  page.add "  key <String> status"
  page.add "    <Dictionary: 2>"
  page.add "      key <String> enabled"
  page.add "        <Bool> true"
  page.add "      key <String> errors"
  page.add "        <Integer> 12"
  check 28, value, page 
'---
  set value = CreateObject("System.Collections.SortedList")
  page.add "<SortedList> (empty)"
  check 29, value, page 
  
  value.add "hello", "world"
  page.add "<SortedList: 1>"
  page.add "  key <String> hello"
  page.add "    <String> world"
  check 30, value, page 
'---
  set subval = CreateObject("System.Collections.SortedList")
  subval.add "aaa", true
  subval.add "bbb", 12
  set value = CreateObject("System.Collections.SortedList")
  value.add "AAA", "Alex"
  value.add "BBB", 18
  value.add "status", subval
  page.add "<SortedList: 3>"
  page.add "  key <String> AAA"
  page.add "    <String> Alex"
  page.add "  key <String> BBB"
  page.add "    <Integer> 18"
  page.add "  key <String> status"
  page.add "    <SortedList: 2>"
  page.add "      key <String> aaa"
  page.add "        <Bool> true"
  page.add "      key <String> bbb"
  page.add "        <Integer> 12"
  check 31, value, page 
'---
  set value = CreateObject("System.Collections.Stack")
  page.add "<Stack> (empty)"
  check 32, value, page 

  value.push 1
  value.push 2
  value.push 3
  page.add "<Stack: 3>"
  page.add "  <Integer> 3"
  page.add "  <Integer> 2"
  page.add "  <Integer> 1"
  check 33, value, page 
'---
  set subval = CreateObject("System.Collections.Stack")
  set value  = CreateObject("System.Collections.Stack")

  value.push 1
  value.push subval
  value.push 3
  page.add "<Stack: 3>"
  page.add "  <Integer> 3"
  page.add "  <Stack> (empty)"
  page.add "  <Integer> 1"
  check 34, value, page 
'---
  set subval = CreateObject("System.Collections.Stack")
  subval.push "AAA"
  subval.push "BBB"
  subval.push "CCC"
  set value  = CreateObject("System.Collections.Stack")

  value.push 1
  value.push subval
  value.push 3
  page.add "<Stack: 3>"
  page.add "  <Integer> 3"
  page.add "  <Stack: 3>"
  page.add "    <String> CCC"
  page.add "    <String> BBB"
  page.add "    <String> AAA"
  page.add "  <Integer> 1"
  check 35, value, page 
'---
  set value = CreateObject("System.Collections.Queue")
  page.add "<Queue> (empty)"
  check 36, value, page 
  
  value.Enqueue 1
  value.Enqueue 2
  value.Enqueue 3
  page.add "<Queue: 3>"
  page.add "  <Integer> 1"
  page.add "  <Integer> 2"
  page.add "  <Integer> 3"
  check 37, value, page 

'---
  set subval = CreateObject("System.Collections.Queue")
  set value = CreateObject("System.Collections.Queue")
  
  value.Enqueue 1
  value.Enqueue subval
  value.Enqueue 3
  page.add "<Queue: 3>"
  page.add "  <Integer> 1"
  page.add "  <Queue> (empty)"
  page.add "  <Integer> 3"
  check 38, value, page 
'---
  set subval = CreateObject("System.Collections.Queue")
  subval.Enqueue 1
  subval.Enqueue 2
  subval.Enqueue 3
  set value = CreateObject("System.Collections.Queue")
  value.Enqueue 1
  value.Enqueue subval
  value.Enqueue 3
  page.add "<Queue: 3>"
  page.add "  <Integer> 1"
  page.add "  <Queue: 3>"
  page.add "    <Integer> 1"
  page.add "    <Integer> 2"
  page.add "    <Integer> 3"
  page.add "  <Integer> 3"
  check 39, value, page 

'---
  set value = CreateObject("System.Collections.Hashtable")
  page.add "<Hashtable> (empty)"
  check 40, value, page
         
  value.add "hello", "world"
  page.add "<Hashtable: 1>"
  check 41, value, page

  set value = CreateObject("System.Collections.Hashtable")
  value.add "hello", "world"
  value.add "ololo", "trololo"
  page.add "<Hashtable: 2>"
  check 42, value, page

  set subval = CreateObject("System.Collections.Hashtable")
  subval.add "hello", "world"
  set value = CreateObject("System.Collections.Hashtable")
  value.add "hello", "world"
  page.add "<Array: 2>"
  page.add "  <Hashtable: 1>"
  page.add "  <Hashtable: 1>"
  check 43, Array(subval, value), page

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] tree/type_empty"
  else
    echo deep, "[ERROR] tree/type_empty"
    WScript.Quit 1
  end if
end function

main()
