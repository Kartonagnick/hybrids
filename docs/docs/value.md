[![logo](../logo.png)](../docs.md "documentation") 

[M]: ../docs.md        "родитель"
[P]: ../icons/progress.png  "в процессе..."
[S]: ../icons/success.png   "ошибок не обнаружено"
[E]: ../icons/empty.png     "нет данных"

[![P]][M] value v0.0.1
======================
Инструмент для анализа типов и их значений  

```vbs
'  class Value
'    default function init(v)   'enable/disable show empty values
'    property Let show_empty(v) 'enable/disable show empty values
'    function to_string(text)   'convert value to string
```

Пример использования:

```vbs
dim val: set val = new Value(true)
dim txt1: txt1 = val.to_string(Nothing)
dim txt2: txt2 = val.to_string(12.34)
WScript.Echo txt1  ' (Nothing)
WScript.Echo txt2  ' 12.34
```

--------------------------------------------------------------------------------

История изменений 
-----------------

| **ID** |      версия     |    дата    | время |      ветка      | status  | продукт |  
|:------:|:---------------:|:----------:|:-----:|:---------------:|:-------:|:-------:|  
|  0003  | 0.0.1 [![P]][M] | 2024-03-20 | 13:00 | [#26-dev-value] | VERSION |  0.0.1  |  
|  0002  | 0.0.1 [![P]][M] | 2024-03-20 | 12:50 | [#26-dev-value] |  DONE   |  0.0.1  |  
|  0001  | 0.0.1 [![E]][M] | 2024-03-20 | 10:40 | [#26-dev-value] |  BEGIN  |  0.0.1  |  

*ПРИМЕЧАНИЕ:* под продуктом подразумевается версия `value.vbs`  

[#26-dev-value]: ../history.md#-v026-dev
