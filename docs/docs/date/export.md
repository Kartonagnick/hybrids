[![logo](../../logo.png)](../../docs.md "documentation") 

[M]: ../date.md        "родитель"
[P]: ../../icons/progress.png  "в процессе..."
[S]: ../../icons/success.png   "ошибок не обнаружено"
[E]: ../../icons/empty.png     "нет данных"

[Tree]: tree.md

[![P]][M] date/export v0.0.5
============================
Класс для экспорта исторической метки в текстовую строку:  

```vbs
class DTSExport

 'in: String    -> used as format-string
 'in: DTSExport -> used DTSExport.format
 'in: String    -> used as format
 'in: Nothing, Null, Empty -> used by default
 'по умолчаннию: 'YY-MM-DD hh:mm:ss.ms'
  public default function init(v) 

 'in: String -> set format-string
 'in: DTSExport -> set DTSExport.format
 'in: Nothing, Null, Empty -> set by default
  property Let format(v)
  property Set format(v)

 'out: String
  property Get format()

 'out: String (timestamp by format)
 'in: DTSValue, DTStamp, Date, Numeric (source data)
  function stamp(dt) 'String

  function clone
end class
```

Пример использования:  

```vbs
set exp = (new DTSExport)("FI YY/MM/DD TT SE TT")
set dtv = (new DTSValue)(#2000-11-25 12:13:15#, 123)
WScript.Echo "stamp: " & obj.stamp(dtv)
```

Вывод в консоль:  
```
stamp: FI 2000/11/25 12:13:15.123 SE 12:13:15.123
```

--------------------------------------------------------------------------------

История изменений 
-----------------

| **ID** |      версия     |    дата    | время |     ветка      | status  | продукт |  
|:------:|:---------------:|:----------:|:-----:|:--------------:|:-------:|:-------:|  
|  0003  | 0.0.1 [![P]][M] | 2024-09-03 | 19:00 | [#46-dev-date] | VERSION |  0.0.5  |  
|  0002  | 0.0.1 [![P]][M] | 2024-09-03 | 18:50 | [#46-dev-date] |  DONE   |  0.0.5  |  
|  0001  | 0.0.1 [![E]][M] | 2024-08-30 | 11:00 | [#46-dev-date] |  BEGIN  |  0.0.5  |  

*ПРИМЕЧАНИЕ:* под продуктом подразумевается версия `date/export.vbs`  

[#46-dev-date]:  ../../history.md#-v046-dev
