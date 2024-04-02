
'--- local/hybrids                       [test][traits/is_empty_value][main.vbs]
'[2024-04-02][06:10:00] 001 Kartonagnick    

dim sl: set sl = CreateObject("System.Collections.SortedList")
dim al: set al = CreateObject("System.Collections.ArrayList")
dim ht: set ht = CreateObject("System.Collections.Hashtable")
dim qu: set qu = CreateObject("System.Collections.Queue")
dim st: set st = CreateObject("System.Collections.Stack")
dim di: set di = CreateObject("Scripting.Dictionary")

sub test(id, deep, src, must)
  dim real: real = is_empty_value(src)
  if real <> must then
    echo deep, "[" & id & "][ERROR] src  : " & src
    echo deep, "[" & id & "][ERROR] must : " & must
    echo deep, "[" & id & "][ERROR] real : " & real
    gMY_TEST = false
  end if
end sub

sub fill()
  al.add 1
  st.push 1
  sl.add 1, 1
  ht.add 1, 1
  qu.Enqueue 1
  di(1) = 1
end sub

function main()

  dim deep: deep = 0

  test  1, deep, 0         ,  true
  test  2, deep, ""        ,  true
  test  3, deep, Null      ,  true
  test  4, deep, nothing   ,  true
  test  5, deep, array()   ,  true

  test  6, deep, sl        ,  true
  test  7, deep, al        ,  true
  test  8, deep, ht        ,  true
  test  9, deep, qu        ,  true
  test 10, deep, st        ,  true
  test 11, deep, di        ,  true

  fill

  test 12, deep, sl       ,  false
  test 13, deep, al       ,  false
  test 14, deep, ht       ,  false
  test 15, deep, qu       ,  false
  test 16, deep, st       ,  false
  test 17, deep, di       ,  false

  test 18, deep, 1        ,  false
  test 19, deep, true     ,  false
  test 20, deep, "1"      ,  false
  test 21, deep, array(1) ,  false

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] is_empty_value"
  else
    echo deep, "[ERROR] is_empty_value"
    WScript.Quit 1
  end if
end function

main()
