[![logo](../logo.png)](../docs.md "documentation") 

[M]: ../docs.md        "родитель"
[P]: ../icons/progress.png  "в процессе..."
[S]: ../icons/success.png   "ошибок не обнаружено"
[E]: ../icons/empty.png     "нет данных"

[![S]][M] numeric v0.0.2
========================
Сигнатуры функций:  

```vbs
functions:
  function toNumeric(v)
  function toDouble(v)
```

toNumeric
---------

если аргумент функции:  
  - `String`, тогда значение аргумента может быть скорректированно:  
    в зависимости от локали, запятая может быть заменена точкой,  
    или же точка заменена запятой  

если аргумент функции:  
  - `Nothing`, `Empty`, `Null`, тогда значение заменяется на ноль  

если аргумент функции:  
  - `Bool`, тогда true заменяется на 1, false заменяется на ноль  

если аргумент функции:  
  - принципиально не подходит для преобразования к `Numeric`,  
    тогда сработает `assert`  

если аргумент функции:  
  - является текстовой строкой,  
    которая принципиально не подходит для преобразования к `Numeric`,  
    тогда будет брошено исключкение: `errorInvalidText`  

--------------------------------------------------------------------------------

История изменений 
-----------------

| **ID** |      версия     |    дата    | время |       ветка       | status  | продукт |  
|:------:|:---------------:|:----------:|:-----:|:-----------------:|:-------:|:-------:|  
|  0006  | 0.0.2 [![S]][M] | 2024-07-26 | 19:00 | [#39-dev-numeric] | VERSION |  0.0.1  |  
|  0005  | 0.0.2 [![S]][M] | 2024-07-26 | 18:50 | [#39-dev-numeric] |  DONE   |  0.0.1  |  
|  0004  | 0.0.2 [![E]][M] | 2024-07-25 | 11:00 | [#39-dev-numeric] |  BEGIN  |  0.0.1  |  
|  0003  | 0.0.1 [![S]][M] | 2024-07-24 | 19:00 | [#38-dev-numeric] | VERSION |  0.0.1  |  
|  0002  | 0.0.1 [![S]][M] | 2024-07-24 | 18:50 | [#38-dev-numeric] |  DONE   |  0.0.1  |  
|  0001  | 0.0.1 [![E]][M] | 2024-07-22 | 11:00 | [#38-dev-numeric] |  BEGIN  |  0.0.1  |  

*ПРИМЕЧАНИЕ:* под продуктом подразумевается версия `numeric.vbs`  

[#38-dev-numeric]: ../history.md#-v038-dev
[#39-dev-numeric]: ../history.md#-v039-dev
