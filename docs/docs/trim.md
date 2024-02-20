[![logo](../logo.png)](../docs.md "documentation") 

[M]: ../docs.md        "родитель"
[P]: ../icons/progress.png  "в процессе..."
[S]: ../icons/success.png   "ошибок не обнаружено"
[E]: ../icons/empty.png     "нет данных"

[![S]][M] trim v0.0.1
=====================
Инструмент служит обрезания ненужных символов с кончика, или в конце строки  

Сигнатуры функций:  

```vbs
chars - символы, которые нужно удалить

functions:
  function trimFront(text, chars)
  function trimBack(text, chars)
  function trimBoth(text, chars)
  function trimList(lst)
```

Пример использования:  

```vbs
 'удаляет и проблеы, и символ слеша
  WScript.Echo trimBoth("text"           , "\ ")
  WScript.Echo trimBoth(" text "         , "\ ")
  WScript.Echo trimBoth("  text  "       , "\ ")
  WScript.Echo trimBoth("\text\"         , "\ ")
  WScript.Echo trimBoth("\\text\\"       , "\ ")
  WScript.Echo trimBoth(" \text\ "       , "\ ")
  WScript.Echo trimBoth(" \\text\\ "     , "\ ")
  WScript.Echo trimBoth("\ \text\ \"     , "\ ")
  WScript.Echo trimBoth("\\ \\text\\  \\", "\ ")
  WScript.Echo trimBoth("\ text \"       , "\ ")
  WScript.Echo trimBoth("\\ text \\"     , "\ ")
```

--------------------------------------------------------------------------------

История изменений 
-----------------

| **ID** |      версия     |    дата    | время |     ветка      | status  | продукт |  
|:------:|:---------------:|:----------:|:-----:|:--------------:|:-------:|:-------:|  
|  0003  | 0.0.1 [![S]][M] | 2024-02-21 | 01:30 | [#12-dev-trim] | VERSION |  0.0.1  |  
|  0002  | 0.0.1 [![S]][M] | 2024-02-21 | 01:20 | [#12-dev-trim] |  DONE   |  0.0.1  |  
|  0001  | 0.0.1 [![E]][M] | 2024-02-21 | 00:30 | [#12-dev-trim] |  BEGIN  |  0.0.1  |  

*ПРИМЕЧАНИЕ:* под продуктом подразумевается версия `trim.vbs`  

[#12-dev-trim]: ../history.md#-v012-dev
