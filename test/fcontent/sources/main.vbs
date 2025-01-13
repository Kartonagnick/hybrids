                                                
'--- local/hybrids                                     [test/fcontent][main.vbs]
'[2025-01-13][12:50:00] 001 Kartonagnick PRE
' includeVBS("glob.vbs")
' includeVBS("fcontent.vbs")

' encode of file: 1251

dim deep: deep = 0
dim text

function getWorkDirectory()
  dim d_work
  d_work = WScript.ScriptFullName
  d_work = g_fso.GetParentFolderName(d_work)
  d_work = g_fso.GetAbsolutePathName(d_work)
  getWorkDirectory = d_work
end function 

function func1(line)
  text  = text & "|" & line
  func1 = true
end function

function func2(line)
  func2 = true
end function

function fileCompare(path1, path2)
  dim os, buf1, buf2
  fileCompare = false
  if not g_fso.FileExists(path1) then
    exit function
  end if
  if not g_fso.FileExists(path2) then
    exit function
  end if
  set os = WScript.CreateObject("ADODB.Stream")
  os.Open: os.Type = 1
  os.LoadFromFile(path1): buf1 = os.Read
  os.LoadFromFile(path2): buf2 = os.Read
  if isNull(buf1) then buf1 = ""
  if isNull(buf2) then buf2 = ""
  if strcomp(buf1, buf2, 0) = 0 then 
    fileCompare = true
  end if
end function
 
function main()
  dim content, loader, src, dst, compare
  makeD getWorkDirectory() & "\dst"
'---
  src = getWorkDirectory() & "\src\test.md"
  dst = getWorkDirectory() & "\dst\test.md"
  set loader = new FileContent
  set content = loader.load(src, "func1")
  eqCompare deep, 1, content.count, 3

  loader.save dst, content
  compare = fileCompare(src, dst)

  eqCompare deep, 2, text, "|ìàìà|ìûëà|ðàìó"
  eqCompare deep, 3, compare, true
'---
  src = getWorkDirectory() & "\src\etalon.md"
  set content = loader.load(src, "func2")
  eqCompare deep, 4, content.count, 1
  eqCompare deep, 5, text, content(0)
'---
  text = ""
  src = getWorkDirectory() & "\src\one-endl.md"
  dst = getWorkDirectory() & "\dst\one-endl.md"
  set content = loader.load(src, "func1")
  eqCompare deep, 6, content.count, 1
  eqCompare deep, 7, text, "|ìàìà"
  loader.saveEndl dst, content
  compare = fileCompare(src, dst)
  eqCompare deep, 8, compare, true
'---
  text = ""
  src = getWorkDirectory() & "\src\one.md"
  dst = getWorkDirectory() & "\dst\one.md"
  set content = loader.load(src, "func1")
  eqCompare deep,  9, content.count, 1
  eqCompare deep, 10, text, "|ìàìà"
  loader.save dst, content
  compare = fileCompare(src, dst)
  eqCompare deep, 11, compare, true
'---
  text = ""
  src = getWorkDirectory() & "\src\empty-endl.md"
  dst = getWorkDirectory() & "\dst\empty-endl.md"
  set content = loader.load(src, "func1")
  eqCompare deep, 12, content.count, 1
  eqCompare deep, 13, text, "|"
  loader.saveEndl dst, content
  compare = fileCompare(src, dst)
  eqCompare deep, 14, compare, true
'---
  text = ""
  src = getWorkDirectory() & "\src\empty.md"
  dst = getWorkDirectory() & "\dst\empty.md"
  set content = loader.load(src, "func1")
  eqCompare deep, 15, content.count, 1
  eqCompare deep, 16, text, "|"
  loader.save dst, content
  compare = fileCompare(src, dst)
  eqCompare deep, 17, compare, true
'---
  deleteD getWorkDirectory() & "\dst"

  if not gMY_TEST then
    echo deep, "[ERROR] include (canonicalPath)"
    WScript.Quit 1
  end if
end function

main()
