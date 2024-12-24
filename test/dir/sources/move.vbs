
'--- local/hybrids                                          [test][dir][move.vbs]
'[2024-12-24][19:00:00] 001 Kartonagnick PRE

dim deep: deep = 0

sub errMessage(id, path, etalon, result)
  echo deep, "-----------------------------"
  echo deep, "[" & id & "][ERROR] path  : '" & path   & "'"
  echo deep, "[" & id & "][ERROR] etalon: '" & etalon & "'"
  echo deep, "[" & id & "][ERROR] result: '" & result & "'"
  gMY_TEST = false
end sub

sub testF(id, path, etalon)
  dim result: result = g_fso.FileExists(path)
  if result <> etalon then
    errMessage id, path, etalon, result
  end if
end sub

sub testD(id, path, etalon)
  dim result: result = g_fso.FolderExists(path)
  if result <> etalon then
    errMessage id, path, true, result
  end if
end sub

function rootD()
  dim dir: dir = WScript.ScriptFullName
  dir = g_fso.GetParentFolderName(dir)
  rootD = dir & "\dir_move"
end function

function makeSrc()
  dim src, file, txt
  src = rootD() & "\src\1\2\3\4"
  txt = src & "\test.txt"

  makeD src: testD 1, src, true 
  testD 1, src, true

  set file = g_fso.OpenTextFile(txt, 8 , true)
  file.WriteLine("Writing text to a file")
  set file = nothing
  testF 2, txt, true 

  makeSrc = gMY_TEST 
end function

function moveDst()
  dim src, dst, file, txt
  src = rootD() & "\src\1\2"
  dst = rootD() & "\dst\1\2"
  moveD src, dst

  testD  3, rootD()                           , true
  testD  4, rootD() & "\src"                  , true
  testD  5, rootD() & "\src\1"                , true
  testD  6, rootD() & "\src\1\2"              , false
  testD  7, rootD() & "\src\1\2\3"            , false
  testD  8, rootD() & "\src\1\2\3\4"          , false
  testF  8, rootD() & "\src\1\2\3\4\test.txt" , false

  testD  9, rootD()                           , true
  testD 10, rootD() & "\dst"                  , true
  testD 11, rootD() & "\dst\1"                , true
  testD 12, rootD() & "\dst\1\2"              , true
  testD 13, rootD() & "\dst\1\2\3"            , true
  testD 14, rootD() & "\dst\1\2\3\4"          , true
  testF 15, rootD() & "\dst\1\2\3\4\test.txt" , true

  moveDst = gMY_TEST 
end function

function main()
  if makeSrc then
    if moveDst then
      deleteD rootD
    end if
  end if

  if not gMY_TEST then
    echo deep, "[ERROR] dir.move"
    WScript.Quit 1
  end if
end function

main()
