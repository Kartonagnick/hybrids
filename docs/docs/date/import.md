[![logo](../../logo.png)](../../docs.md "documentation") 

[M]: ../date.md        "родитель"
[P]: ../../icons/progress.png  "в процессе..."
[S]: ../../icons/success.png   "ошибок не обнаружено"
[E]: ../../icons/empty.png     "нет данных"

[Tree]: tree.md

[![P]][M] date/import v0.0.5
============================
Класс для импорта исторической метки из текста:  

```vbs
class DTSImport

 'v: 'String, Null, Nothing, Empty
 'по умолчаннию: 'YY-MM-DD hh:mm:ss.ms'
  public default function init(v) 

  property Let format(v) 'String
  property Set format(v) 'DTSImport, Null, Nothing, Empty
  property Get format()  'String

 'на входе : получает строку в заданном формате (например: 'YY-MM-DD hh:mm:ss.ms')
 'на выходе: возвращает объект DTSValue
  function parse(text)

 'возвращает независимую копию DTSImport
  function clone
end class
```

Пример использования:  

```vbs
set obj = (new DTSImport)("example YY-MM-DD TIME text")
set dtv = obj.parse("example 2021-09-15 12:25:35 text")
result  = dt.logsStamp
WScript.Echo result
```

Вывод в консоль:
```
[2021-09-15][12:25:35.000]
```

--------------------------------------------------------------------------------

История изменений 
-----------------

| **ID** |      версия     |    дата    | время |     ветка      | status  | продукт |  
|:------:|:---------------:|:----------:|:-----:|:--------------:|:-------:|:-------:|  
|  0003  | 0.0.1 [![P]][M] | 2024-08-29 | 19:00 | [#45-dev-date] | VERSION |  0.0.5  |  
|  0002  | 0.0.1 [![P]][M] | 2024-08-29 | 18:50 | [#45-dev-date] |  DONE   |  0.0.5  |  
|  0001  | 0.0.1 [![E]][M] | 2024-08-25 | 11:00 | [#45-dev-date] |  BEGIN  |  0.0.5  |  

*ПРИМЕЧАНИЕ:* под продуктом подразумевается версия `date/import.vbs`  

[#45-dev-date]:  ../../history.md#-v045-dev
