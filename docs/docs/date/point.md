[![logo](../../logo.png)](../../docs.md "documentation") 

[M]: ../date.md        "родитель"
[P]: ../../icons/progress.png  "в процессе..."
[S]: ../../icons/success.png   "ошибок не обнаружено"
[E]: ../../icons/empty.png     "нет данных"

[![P]][M] date/point v0.0.1
===========================
Инструменты для определения кол-ва прошедшего времени.  

Синопсис:  

```vbs
Определение кол-ва прошедшего времени:
  sub begTimePoint()                    ' создание временной точки
  function endTimePoint()               ' TimePoint: возвращает текущую веременную точку
  function durationTimerPointSeconds()  ' String: длительность: 2 min, 5 sec
  function durationTimePointMS()        ' String: длительность: 2 min, 5 sec, 123 ms

class TimePoint
  sub start()                           ' запоминает текущее время: DTSValue.now 
  function elapsedSeconds()             ' Int: сколько секунд прошло
  function elapsedMS()                  ' Int: сколько миллисекунд прошло
  function durationSeconds()            ' String: сколько времени прошло: 2 min, 5 sec
  function durationMS()                 ' String: сколько времени прошло: 2 min, 5 sec, 123 ms
```

Пример использования:  

```vbs
dim elapsed, deep: deep = 0

sub payload
  begTimePoint
  WScript.sleep 200 'ms
  elapsed = durationTimePointMS()
  echo deep, "elapsed: " & elapsed & " (expected: 200 ms)"
end sub

sub example
  begTimePoint
  WScript.sleep 300 'ms
  payload()
  elapsed = durationTimePointMS()
  echo deep, "elapsed: " & elapsed & " (expected: 500 ms)"
end sub

example()
```

Вывод в консоль:  
```
elapsed: 204 ms (expected: 200 ms)
elapsed: 508 ms (expected: 500 ms)
```

--------------------------------------------------------------------------------

История изменений 
-----------------

| **ID** |      версия     |    дата    | время |     ветка      | status  | продукт |  
|:------:|:---------------:|:----------:|:-----:|:--------------:|:-------:|:-------:|  
|  0003  | 0.0.1 [![P]][M] | 2024-09-22 | 19:00 | [#51-dev-date] | VERSION |  0.0.1  |  
|  0002  | 0.0.1 [![P]][M] | 2024-09-22 | 18:50 | [#51-dev-date] |  DONE   |  0.0.1  |  
|  0001  | 0.0.1 [![E]][M] | 2024-09-21 | 11:00 | [#51-dev-date] |  BEGIN  |  0.0.1  |  

*ПРИМЕЧАНИЕ:* под продуктом подразумевается версия `date/point.vbs`  

[#51-dev-date]:  ../../history.md#-v051-dev

