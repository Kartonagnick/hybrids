
'--- local/hybrids                     [test][traits/has_method_count][main.vbs]
'[2024-04-02][06:10:00] 001 Kartonagnick PRE

sub test(id, deep, src, must)
  dim real: real = has_method_count(src)
  if real <> must then
    echo deep, "[" & id & "][ERROR] src  : " & src
    echo deep, "[" & id & "][ERROR] must : " & must
    echo deep, "[" & id & "][ERROR] real : " & real
    gMY_TEST = false
  end if
end sub


function main()

  dim deep: deep = 0

  dim sl: set sl = CreateObject("System.Collections.SortedList")
  dim al: set al = CreateObject("System.Collections.ArrayList")
  dim ht: set ht = CreateObject("System.Collections.Hashtable")
  dim qu: set qu = CreateObject("System.Collections.Queue")
  dim st: set st = CreateObject("System.Collections.Stack")
  dim di: set di = CreateObject("Scripting.Dictionary")


  test 1, deep, 0       ,  false
  test 2, deep, true    ,  false
  test 3, deep, array() ,  false
  test 4, deep, sl      ,  true
  test 5, deep, al      ,  true
  test 6, deep, ht      ,  true
  test 7, deep, qu      ,  true
  test 8, deep, st      ,  true
  test 9, deep, di      ,  true

  if gMY_TEST = true then
   'echo deep, "[SUCCESS] has_method_count"
  else
    echo deep, "[ERROR] has_method_count"
    WScript.Quit 1
  end if
end function

main()
