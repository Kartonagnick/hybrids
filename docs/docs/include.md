[![logo](../logo.png)](../docs.md "documentation") 

[M]: ../docs.md        "родитель"
[P]: ../icons/progress.png  "в процессе..."
[S]: ../icons/success.png   "ошибок не обнаружено"
[E]: ../icons/empty.png     "нет данных"

[![S]][M] include v0.1.3
========================
Процедура подключения внешних `файлов.vbs`  

Сигнатура:  

```vbs
sub includeVBS(path) 
```

Пример использования:  

```vbs
' сначала выполняет поиск файла относительно рабочего каталога
' затем ищет относительно gDIR_VBS
' затем ищет относительно WScript.ScriptFullName

includeVBS("glob.vbs")
includeVBS("echo.vbs")
includeVBS("path.vbs")

sub test(id, deep, path, expected)
  dim result: result = canonicalPath(path)
  if result <> expected then
    echo deep, "[" & id & "][ERROR] path: "     & path
    echo deep, "[" & id & "][ERROR] expected: " & expected
    echo deep, "[" & id & "][ERROR] result: "   & result
    gMY_TEST = false
  end if
end sub

function main()

  dim deep: deep = 0
  test  1, deep, "path"   , "path"
  test  2, deep, "a/b/c"  , "a\b\c"
  test  3, deep, "a/b/c/" , "a\b\c"
  test  4, deep, "a//b/\c", "a\b\c"
  test  5, deep, "a/\/\\/b///\\/\c"   , "a\b\c"
  test  6, deep, "a/b/../c/d"         , "a\c\d"
  test  7, deep, "a/b/../c/d/f"       , "a\c\d\f"
  test  8, deep, "a/b/../../c/d"      , "c\d"
  test  9, deep, "a/b/../../../c/d"   , "..\c\d"
  test 10, deep, "a/b/../../../../c/d", "..\..\c\d"

  if not gMY_TEST then
    echo deep, "[ERROR] include (canonicalPath)"
    WScript.Quit 1
  end if
end function

main()
```

--------------------------------------------------------------------------------

История изменений 
-----------------

| **ID** |    дата    | время |       ветка       | status  | продукт |  
|:------:|:----------:|:-----:|:-----------------:|:-------:|:-------:|  
|  0003  | 2024-10-10 | 19:00 | [#56-dev-include] | VERSION |  0.1.3  |  
|  0002  | 2024-10-10 | 18:50 | [#56-dev-include] |  DONE   |  0.1.3  |  
|  0001  | 2024-10-10 | 11:00 | [#56-dev-include] |  BEGIN  |  0.1.3  |  

*ПРИМЕЧАНИЕ:* под продуктом подразумевается версия `include.vbs`  

[#56-dev-include]: ../history.md#-v056-dev
