[![logo](../../logo.png)](../../docs.md "documentation") 

[M]: ../date.md        "родитель"
[P]: ../../icons/progress.png  "в процессе..."
[S]: ../../icons/success.png   "ошибок не обнаружено"
[E]: ../../icons/empty.png     "нет данных"

[Tree]: tree.md

[![S]][M] date/value v0.0.2
===========================
Класс для хранения даты/времени/миллисекунд  

```vbs
class DTSValue

 'datetime: DTStamp, DTSValue, Date, Numeric, String
 'milliseconds : Numeric, String, Nothing, Null, Empty
  public default function init(datetime, milliseconds)

 'установка даты: DTStamp, DTSValue, Date, Numeric, String
  property Let date(v) 
  property Set date(v) 

 'установка миллисекунд: Numeric, String, Nothing, Null, Empty
  property Let ms(v)  

  property Get date()      'Date: возвращает дату
  property Get ms()        'String : возвращает миллисекунды
  property Get hh()        'String : возвращает часы
  property Get mm()        'String : возвращает минуты
  property Get ss()        'String : возвращает секунды
  property Get yy()        'String : возвращает год
  property Get mo()        'String : возвращает месяц
  property Get dd()        'String : возвращает день

  property Get timeOnly()  'String : 23:19:55
  property Get timeStamp() 'String : 23:19:55.123
  property Get dateStamp() 'String : 2024-08-09
  property Get logsStamp() 'String : [2024-08-09][23:19:55.123]
  property Get fileStamp() 'String : [2024-08m-09][23h-19m]

 'возвращает количество секунд продедших с начала эпохи
  property Get posix() 'Int 

 'устанавливает дату-время на основании количества секунд, 
 'прошедших с начала эпохи
  property Let posix(sec)

 'добавление указанного количества секунд к текущей дате
  sub addSeconds(sec) 'Numeric, String, Null, Empty, Nothing 

 'добавление указанного количества миллисекунд к текущей дате
  sub addMilliseconds(msec) 'Numeric, String, Null, Empty, Nothing 

 'устанавливает текущую дату-время включая миллисекунды
  sub now()

 'возвращает DTSValue: независимый клон объекта
  function clone()
end class
```

--------------------------------------------------------------------------------

История изменений 
-----------------

| **ID** |      версия     |    дата    | время |     ветка      | status  | продукт |  
|:------:|:---------------:|:----------:|:-----:|:--------------:|:-------:|:-------:|  
|  0012  | 0.0.4 [![S]][M] | 2024-08-20 | 19:00 | [#43-tst-date] | VERSION |  0.0.2  |  
|  0012  | 0.0.4 [![S]][M] | 2024-08-20 | 18:50 | [#43-tst-date] |  DONE   |  0.0.2  |  
|  0010  | 0.0.4 [![E]][M] | 2024-08-15 | 11:00 | [#43-tst-date] |  BEGIN  |  0.0.2  |  
|  0009  | 0.0.3 [![S]][M] | 2024-08-14 | 19:00 | [#42-tst-date] | VERSION |  0.0.2  |  
|  0008  | 0.0.3 [![S]][M] | 2024-08-14 | 18:50 | [#42-tst-date] |  DONE   |  0.0.2  |  
|  0007  | 0.0.3 [![E]][M] | 2024-08-09 | 11:00 | [#42-tst-date] |  BEGIN  |  0.0.2  |  
|  0006  | 0.0.2 [![S]][M] | 2024-08-08 | 19:00 | [#41-tst-date] | VERSION |  0.0.2  |  
|  0005  | 0.0.2 [![S]][M] | 2024-08-08 | 18:50 | [#41-tst-date] |  DONE   |  0.0.2  |  
|  0004  | 0.0.2 [![E]][M] | 2024-08-02 | 11:00 | [#41-tst-date] |  BEGIN  |  0.0.2  |  
|  0003  | 0.0.1 [![S]][M] | 2024-08-01 | 19:00 | [#40-dev-date] | VERSION |  0.0.2  |  
|  0002  | 0.0.1 [![S]][M] | 2024-08-01 | 18:50 | [#40-dev-date] |  DONE   |  0.0.2  |  
|  0001  | 0.0.1 [![E]][M] | 2024-07-27 | 11:00 | [#40-dev-date] |  BEGIN  |  0.0.2  |  

*ПРИМЕЧАНИЕ:* под продуктом подразумевается версия `date/value.vbs`  

[#40-dev-date]:  ../../history.md#-v040-dev
[#41-tst-date]:  ../../history.md#-v041-tst
[#42-tst-date]:  ../../history.md#-v042-tst	
[#43-tst-date]:  ../../history.md#-v043-tst
