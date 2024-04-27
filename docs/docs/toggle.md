[![logo](../logo.png)](../docs.md "documentation") 

[M]: ../docs.md        "родитель"
[P]: ../icons/progress.png  "в процессе..."
[S]: ../icons/success.png   "ошибок не обнаружено"
[E]: ../icons/empty.png     "нет данных"

[![S]][M] toggle v0.0.1
=======================
Класс `Toggle` - переключатель.
Может быть в двух состояниях: вкл/выкл  

Идея заключается в том, что значения 1/true/ON/YES интерпретируются как "вкл"  
А значения 0, false, OFF, NO, или значения пустышки (NULL, Nothing) - как "выкл"  

Синопсис:  

```vbs
class Toogle
  default function init(v)   'set: 1/0 true/false ON/OFF YES/NO
  property Let value(v)      'set: 1/0 true/false ON/OFF YES/NO
  property Get disabled()    'if false -> return true
  property Get enabled()     'if true  -> return true
  function to_string(text)   'return string: ON/OFF
  sub environment(name, def) 'set value from environment

  function to_bool(v) 
    if Null, Nothing, 0, false, OFF, NO, Toogle.disabled then 
      return false   
    if 1, true, ON, YES, Toogle.enabled then 
      return true

  function fromString(text)
    true : 1, true , on , yes,
    false: 0, false, off, no

  function fromEnvironment(name, def) 
    loaded value from environment
    return true/false 
```


Пример использования:  

```vbs
  dim def: def = "OFF"
  dim obj: set obj = new Toggle
  obj.environment "eDEBUG", def
  WScript.Echo "DEBUG MODE: " & obj.to_string()
```

--------------------------------------------------------------------------------

История изменений 
-----------------

| **ID** |      версия     |    дата    | время |      ветка       | status  | продукт |  
|:------:|:---------------:|:----------:|:-----:|:----------------:|:-------:|:-------:|  
|  0012  | 0.0.4 [![S]][M] | 2024-04-27 | 19:00 | [#37-tst-toggle] | VERSION |  0.0.1  |  
|  0011  | 0.0.4 [![S]][M] | 2024-04-27 | 18:50 | [#37-tst-toggle] |  DONE   |  0.0.1  |  
|  0010  | 0.0.4 [![E]][M] | 2024-04-24 | 11:00 | [#37-tst-toggle] |  BEGIN  |  0.0.1  |  
|  0009  | 0.0.3 [![S]][M] | 2024-04-23 | 19:00 | [#36-tst-toggle] | VERSION |  0.0.1  |  
|  0008  | 0.0.3 [![S]][M] | 2024-04-23 | 18:50 | [#36-tst-toggle] |  DONE   |  0.0.1  |  
|  0007  | 0.0.3 [![E]][M] | 2024-04-20 | 11:00 | [#36-tst-toggle] |  BEGIN  |  0.0.1  |  
|  0006  | 0.0.2 [![S]][M] | 2024-04-19 | 19:00 | [#35-tst-toggle] | VERSION |  0.0.1  |  
|  0005  | 0.0.2 [![S]][M] | 2024-04-19 | 18:50 | [#35-tst-toggle] |  DONE   |  0.0.1  |  
|  0004  | 0.0.2 [![E]][M] | 2024-04-15 | 11:00 | [#35-tst-toggle] |  BEGIN  |  0.0.1  |  
|  0003  | 0.0.1 [![S]][M] | 2024-04-14 | 19:00 | [#34-dev-toggle] | VERSION |  0.0.1  |  
|  0002  | 0.0.1 [![S]][M] | 2024-04-14 | 18:50 | [#34-dev-toggle] |  DONE   |  0.0.1  |  
|  0001  | 0.0.1 [![E]][M] | 2024-04-14 | 11:00 | [#34-dev-toggle] |  BEGIN  |  0.0.1  |  

*ПРИМЕЧАНИЕ:* под продуктом подразумевается версия `toggle.vbs`  

[#34-dev-toggle]:  ../history.md#-v034-dev
[#35-tst-toggle]:  ../history.md#-v035-tst
[#36-tst-toggle]:  ../history.md#-v036-tst
[#37-tst-toggle]:  ../history.md#-v037-tst
