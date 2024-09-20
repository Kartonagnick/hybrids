[![logo](../../logo.png)](../../docs.md "documentation") 

[M]: ../date.md        "родитель"
[P]: ../../icons/progress.png  "в процессе..."
[S]: ../../icons/success.png   "ошибок не обнаружено"
[E]: ../../icons/empty.png     "нет данных"

[![P]][M] date/duration v0.0.2
==============================
Содержит функции для получения человекочитабельного описания длительности.  

Cинопсис:  

```vbs
Функции возвращают String: длительность
Например: 3 min 5 sec 123 ms

function durationFrom(ms, sec, min, hours, byval days)
function durationFromSeconds(seconds)
function durationFromMS(milliseconds)
```

Пример использования:  

```vbs
dim result, sec: sec = 2678399
result = durationFromSeconds(sec)
WScript.Echo result
```

Вывод в консоль:  
```
30 days, 23 hours, 59 min, 59 sec
```

Пример использования:  

```vbs
dim result, ms: ms = 2678522
result = durationFromMS(ms)
WScript.Echo result
```

Вывод в консоль:  
```
30 days, 23 hours, 59 min, 59 sec, 123 ms
```

Пример использования:  

```vbs
'                      ms  ss  mm  hh  dd
result = durationFrom(123, 20, 30, 40, 50)
WScript.Echo result
```

Вывод в консоль:  
```
50 days, 40 hours, 30 min, 20 sec, 123 ms
```


--------------------------------------------------------------------------------

История изменений 
-----------------

| **ID** |      версия     |    дата    | время |     ветка      | status  | продукт |  
|:------:|:---------------:|:----------:|:-----:|:--------------:|:-------:|:-------:|  
|  0003  | 0.1.1 [![P]][M] | 2024-09-20 | 19:00 | [#50-dev-date] | VERSION |  0.0.2  |  
|  0002  | 0.1.1 [![P]][M] | 2024-09-20 | 18:50 | [#50-dev-date] |  DONE   |  0.0.2  |  
|  0001  | 0.1.1 [![E]][M] | 2024-09-18 | 11:00 | [#50-dev-date] |  BEGIN  |  0.0.2  |  

*ПРИМЕЧАНИЕ:* под продуктом подразумевается версия `date/duration.vbs`  

[#50-dev-date]:  ../../history.md#-v050-dev
