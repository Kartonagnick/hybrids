[![logo](../logo.png)](../docs.md "documentation") 

[M]: ../docs.md        "родитель"
[P]: ../icons/progress.png  "в процессе..."
[S]: ../icons/success.png   "ошибок не обнаружено"
[E]: ../icons/empty.png     "нет данных"

[![P]][M] padding v0.0.1
========================
Инструмент служит для выравнивания текста по заданной длине.  

Сигнатура:  
```vbs
  function padding(text, count, symbol)
```

Примеры использования:  
```vbs
  WScript.Echo padding("1"   , 5  , "*") ' ****1
  WScript.Echo padding("1"   , 4  , "*") ' ***1
  WScript.Echo padding("1"   , 3  , "*") ' **1
  WScript.Echo padding("12"  , 3  , "*") ' *12
  WScript.Echo padding("123" , 3  , "*") ' 123
  WScript.Echo padding("1234", 3  , "*") ' 1234
  WScript.Echo padding("1"   , 0  , "*") ' 1
  WScript.Echo padding(1     , 5  , "*") ' ****1
  WScript.Echo padding(12    , 3  , "*") ' *12
  WScript.Echo padding(123   , 3  , "*") ' 123
  WScript.Echo padding(1234  , 3  , "*") ' 1234
```

--------------------------------------------------------------------------------

История изменений 
-----------------

| **ID** |      версия     |    дата    | время |     ветка      | status  | продукт |  
|:------:|:---------------:|:----------:|:-----:|:--------------:|:-------:|:-------:|  
|  0003  | 0.0.1 [![S]][M] | 2024-02-20 | 22:50 | [#10-dev-util] | VERSION |  0.0.1  |  
|  0002  | 0.0.1 [![S]][M] | 2024-02-20 | 22:40 | [#10-dev-util] |  DONE   |  0.0.1  |  
|  0001  | 0.0.1 [![E]][M] | 2024-02-20 | 22:10 | [#10-dev-util] |  BEGIN  |  0.0.1  |  

*ПРИМЕЧАНИЕ:* под продуктом подразумевается версия `padding.vbs`  

[#10-dev-util]: ../history.md#-v010-dev
