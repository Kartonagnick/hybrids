
'--- local/hybrids                          [test][traits][has_method_count.vbs]
'[2024-04-02][06:10:00] 001 Kartonagnick PRE

dim deep: deep = 0

sub test(id, src, must)
  dim real: real = has_method_count(src)
  if real <> must then
    echo deep, "[" & id & "][ERROR] src  : " & src
    echo deep, "[" & id & "][ERROR] must : " & must
    echo deep, "[" & id & "][ERROR] real : " & real
    gMY_TEST = false
  end if
end sub


function main()
  dim sl: set sl = CreateObject("System.Collections.SortedList")
  dim al: set al = CreateObject("System.Collections.ArrayList")
  dim ht: set ht = CreateObject("System.Collections.Hashtable")
  dim qu: set qu = CreateObject("System.Collections.Queue")
  dim st: set st = CreateObject("System.Collections.Stack")
  dim di: set di = CreateObject("Scripting.Dictionary")

  test 1, 0       ,  false
  test 2, true    ,  false
  test 3, array() ,  false
  test 4, sl      ,  true
  test 5, al      ,  true
  test 6, ht      ,  true
  test 7, qu      ,  true
  test 8, st      ,  true
  test 9, di      ,  true

  if not gMY_TEST then
    echo deep, "[ERROR] has_method_count"
    WScript.Quit 1
  end if
end function

main()
