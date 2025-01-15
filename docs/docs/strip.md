[![logo](../logo.png)](../docs.md "documentation") 

[M]: ../docs.md        "родитель"
[P]: ../icons/progress.png  "в процессе..."
[S]: ../icons/success.png   "ошибок не обнаружено"
[E]: ../icons/empty.png     "нет данных"

[![P]][M] strip v0.0.1
======================
Сигнатуры функций:  

```vbs
function stripFrontI(front, text)   'без учета регистра
function stripFront(front, text)  
function stripBackI(text, back)     'без учета регистра
function stripBack(text, back)  
```

Пример использования:  

```vbs
  WScript.Echo stripFront("ver ", "ver 1.2.3")
  WScript.Echo stripBack("ver 1.2.3", " 1.2.3")
```

Вывод в консоль:  

```
1.2.3
ver
```

--------------------------------------------------------------------------------

История изменений 
-----------------

| **ID** |      версия     |    дата    | время |      ветка      | status  | продукт |  
|:------:|:---------------:|:----------:|:-----:|:---------------:|:-------:|:-------:|  
|  0003  | 0.0.1 [![P]][M] | 2025-01-15 | 23:50 | [#63-dev-strip] | VERSION |  0.0.1  |  
|  0002  | 0.0.1 [![P]][M] | 2025-01-15 | 23:40 | [#63-dev-strip] |  DONE   |  0.0.1  |  
|  0001  | 0.0.1 [![E]][M] | 2025-01-15 | 19:40 | [#63-dev-strip] |  BEGIN  |  0.0.1  |  

*ПРИМЕЧАНИЕ:* под продуктом подразумевается версия `strip_front.vbs`  

[#63-dev-strip]:  ../history.md#-v063-dev