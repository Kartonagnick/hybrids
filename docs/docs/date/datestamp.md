[![logo](../../logo.png)](../../docs.md "documentation") 

[M]: ../date.md        "родитель"
[P]: ../../icons/progress.png  "в процессе..."
[S]: ../../icons/success.png   "ошибок не обнаружено"
[E]: ../../icons/empty.png     "нет данных"

[![S]][M] date/datestamp v0.0.1
===============================
Инструменты для определения кол-ва прошедшего времени.  

Синопсис:  

```vbs
function datestamp()
  dim dt: dt = now()
  dim tt: tt = timer()
  dim yy: yy = year(dt)
  dim mo: mo = right("0" & month(dt) , 2)
  dim dd: dd = right("0" & day(dt)   , 2) 
  dim hh: hh = right("0" & hour(dt)  , 2)
  dim mm: mm = right("0" & minute(dt), 2) 
  dim ss: ss = right("0" & second(dt), 2) 
  dim ms: ms = int((tt - int(tt)) * 1000 + 0.5)    
  datestamp = "[" & yy & "-" & mo & "m-" & dd & "][" & hh & ":" & mm & ":" & ss & "." & ms & "]"
end function
```

Пример использования:  

```vbs
WScript.Echo "stamp: " & datestamp()
```

Вывод в консоль:  
```
stamp: [2024-09m-05][03:43:26.924]
```

--------------------------------------------------------------------------------

История изменений 
-----------------

| **ID** |      версия     |    дата    | время |     ветка      | status  | продукт |  
|:------:|:---------------:|:----------:|:-----:|:--------------:|:-------:|:-------:|  
|  0003  | 0.0.1 [![S]][M] | 2024-09-24 | 19:00 | [#52-dev-date] | VERSION |  0.0.1  |  
|  0002  | 0.0.1 [![S]][M] | 2024-09-24 | 18:50 | [#52-dev-date] |  DONE   |  0.0.1  |  
|  0001  | 0.0.1 [![E]][M] | 2024-09-23 | 11:00 | [#52-dev-date] |  BEGIN  |  0.0.1  |  

*ПРИМЕЧАНИЕ:* под продуктом подразумевается версия `date/datestamp.vbs`  

[#52-dev-date]:  ../../history.md#-v052-dev
