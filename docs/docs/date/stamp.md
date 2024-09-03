[![logo](../../logo.png)](../../docs.md "documentation") 

[M]: ../date.md        "родитель"
[P]: ../../icons/progress.png  "в процессе..."
[S]: ../../icons/success.png   "ошибок не обнаружено"
[E]: ../../icons/empty.png     "нет данных"

[Tree]: tree.md

[![S]][M] date/stamp v0.0.5
===========================
Класс для хранения даты/времени/миллисекунд  
Позволяет удобным образом импортировать/экпортировать данные

```vbs
class DTStamp

 'in: DTStamp -> init from other DTStamp
 'in: DTSValue, Date, Numeric, String
 '  -> format/onput used by default
 '  -> init DTSValue 
 'in: Nothing, Null, Empty -> used by default
  public default function init(v) 

  property Get import()     'String
  property Get export()     'String

  property Get value()      'DTSValue
  property Let value(v)     'DTStamp, DTSValue
  property Set value(v)     'DTStamp, DTSValue

  property Get stamp()      'String: by export-format

  property Set import(v)    'DTStamp, DTSImport, Nothing
  property Let import(v)    'String, Null, Empty

  property Let export(v)    'String, Null, Empty
  property Set export(v)    'DTStamp, DTSImport, 

  property Let date(v)      'Date, Numeric, String
  property Set date(v)      'DTSValue
  property Get date()       'DTSValue

  property Let posix(sec)   'Numeric: POSIX-seconds
  property Get posix()      'Int

  property Let ms(v)        'Numeric

 'getters:
  property Get yy()         'String
  property Get mo()         'String
  property Get dd()         'String
  property Get hh()         'String
  property Get mm()         'String
  property Get ss()         'String
  property Get ms()         'String

  property Get timeOnly()   'String: 23:19:55
  property Get timeStamp()  'String: 23:19:55.123
  property Get dateStamp()  'String: 2024-08-09
  property Get logsStamp()  'String: [2024-08-09][23:19:55.123]
  property Get fileStamp()  'String: [2024-08m-09][23h-19m]

  sub addSeconds(sec)       'Numeric
  sub addMilliseconds(msec) 'Numeric
  sub now()                 'set current datetime with ms
  function clone            'make independent copy
end class
```

--------------------------------------------------------------------------------

История изменений 
-----------------

| **ID** |      версия     |    дата    | время |     ветка      | status  | продукт |  
|:------:|:---------------:|:----------:|:-----:|:--------------:|:-------:|:-------:|  
|  0006  | 0.0.2 [![S]][M] | 2024-09-14 | 19:00 | [#48-tst-date] | VERSION |  0.0.5  |  
|  0005  | 0.0.2 [![S]][M] | 2024-09-14 | 18:50 | [#48-tst-date] |  DONE   |  0.0.5  |  
|  0004  | 0.0.2 [![E]][M] | 2024-09-10 | 11:00 | [#48-tst-date] |  BEGIN  |  0.0.5  |  
|  0003  | 0.0.1 [![S]][M] | 2024-09-09 | 19:00 | [#47-dev-date] | VERSION |  0.0.5  |  
|  0002  | 0.0.1 [![S]][M] | 2024-09-09 | 18:50 | [#47-dev-date] |  DONE   |  0.0.5  |  
|  0001  | 0.0.1 [![E]][M] | 2024-09-04 | 11:00 | [#47-dev-date] |  BEGIN  |  0.0.5  |  

*ПРИМЕЧАНИЕ:* под продуктом подразумевается версия `date/stamp.vbs`  

[#47-dev-date]:  ../../history.md#-v047-dev
[#48-tst-date]:  ../../history.md#-v048-dev
