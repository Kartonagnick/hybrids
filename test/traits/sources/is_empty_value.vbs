
'--- local/hybrids                            [test][traits][is_empty_value.vbs]
'[2024-04-02][06:10:00] 001 Kartonagnick    

dim deep: deep = 0
dim sl: set sl = CreateObject("System.Collections.SortedList")
dim al: set al = CreateObject("System.Collections.ArrayList")
dim ht: set ht = CreateObject("System.Collections.Hashtable")
dim qu: set qu = CreateObject("System.Collections.Queue")
dim st: set st = CreateObject("System.Collections.Stack")
dim di: set di = CreateObject("Scripting.Dictionary")

sub test(id, src, must)
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
  test  1, 0         ,  true
  test  2, ""        ,  true
  test  3, Null      ,  true
  test  4, nothing   ,  true
  test  5, array()   ,  true

  test  6, sl        ,  true
  test  7, al        ,  true
  test  8, ht        ,  true
  test  9, qu        ,  true
  test 10, st        ,  true
  test 11, di        ,  true

  fill

  test 12, sl       ,  false
  test 13, al       ,  false
  test 14, ht       ,  false
  test 15, qu       ,  false
  test 16, st       ,  false
  test 17, di       ,  false

  test 18, 1        ,  false
  test 19, true     ,  false
  test 20, "1"      ,  false
  test 21, array(1) ,  false

  if not gMY_TEST then
    echo deep, "[ERROR] is_empty_value"
    WScript.Quit 1
  end if
end function

main()
