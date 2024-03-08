[![logo](../logo.png)](../docs.md "documentation") 

[M]: ../docs.md        "родитель"
[P]: ../icons/progress.png  "в процессе..."
[S]: ../icons/success.png   "ошибок не обнаружено"
[E]: ../icons/empty.png     "нет данных"

[![S]][M] mask v0.0.2
=====================
Инструмент для работы с файловыми масками  
Сигнатуры функций:  

```vbs
functions:
  function maskToRegexp(mask)
  function masksToRegexp(masks)
  function matchByRegexp(text, regex)
  function matchByInclude(text, list)
  function matchByExclude(text, list)
  function checkByRegexp(text, includes, excludes)

  function matchByMask(text, mask)
  function matchByMasks(text, masks)
  function checkByMasks(text, includes, excludes)

  function versionByRegexp(prefix, line)

classes:
  class MaskExp
    default function init(includes, excludes) 'списки масок
    property Let include(masks) 'список масок нужного текста
    property Let exclude(masks) 'список масок игнорируемого текста
    property Get include()      'получение списка регулярок
    property Get exclude()      'получение списка регулярок
    property Get countInclude() 'получение количества регулярок
    property Get countExclude() 'получение количества регулярок
    function toRegexp(mask)     'преобразование маски в регулярку
    function match(text)        'проверка соответсвия текста маскам
```

Пример испльзования:  

```vbs
dim check: set check = new MaskExp

with check
  .include = "*.hpp; *.cpp"
  .exclude = "_*"
end with

if check.match("hello.hpp") then
  WScript.Echo "matched!"
end if
```

--------------------------------------------------------------------------------

История изменений 
-----------------

| **ID** |      версия     |    дата    | время |      ветка     | status  | продукт |  
|:------:|:---------------:|:----------:|:-----:|:--------------:|:-------:|:-------:|  
|  0018  | 0.0.6 [![S]][M] | 2024-03-08 | 19:00 | [#24-dev-mask] | VERSION |  0.0.2  |  
|  0017  | 0.0.6 [![S]][M] | 2024-03-08 | 18:50 | [#24-dev-mask] |  DONE   |  0.0.2  |  
|  0016  | 0.0.6 [![E]][M] | 2024-03-08 | 18:30 | [#24-dev-mask] |  BEGIN  |  0.0.2  |  
|  0015  | 0.0.5 [![S]][M] | 2024-02-23 | 09:20 | [#21-tst-mask] | VERSION |  0.0.1  |  
|  0014  | 0.0.5 [![S]][M] | 2024-02-23 | 09:10 | [#21-tst-mask] |  DONE   |  0.0.1  |  
|  0013  | 0.0.5 [![E]][M] | 2024-02-23 | 09:00 | [#21-tst-mask] |  BEGIN  |  0.0.1  |  
|  0012  | 0.0.4 [![S]][M] | 2024-02-23 | 08:50 | [#20-tst-mask] | VERSION |  0.0.1  |  
|  0011  | 0.0.4 [![S]][M] | 2024-02-23 | 08:40 | [#20-tst-mask] |  DONE   |  0.0.1  |  
|  0010  | 0.0.4 [![E]][M] | 2024-02-23 | 08:30 | [#20-tst-mask] |  BEGIN  |  0.0.1  |  
|  0009  | 0.0.3 [![S]][M] | 2024-02-23 | 08:20 | [#19-tst-mask] | VERSION |  0.0.1  |  
|  0008  | 0.0.3 [![S]][M] | 2024-02-23 | 08:10 | [#19-tst-mask] |  DONE   |  0.0.1  |  
|  0007  | 0.0.3 [![E]][M] | 2024-02-23 | 07:40 | [#19-tst-mask] |  BEGIN  |  0.0.1  |  
|  0006  | 0.0.2 [![S]][M] | 2024-02-23 | 07:30 | [#18-tst-mask] | VERSION |  0.0.1  |  
|  0005  | 0.0.2 [![S]][M] | 2024-02-23 | 07:20 | [#18-tst-mask] |  DONE   |  0.0.1  |  
|  0004  | 0.0.2 [![E]][M] | 2024-02-23 | 07:10 | [#18-tst-mask] |  BEGIN  |  0.0.1  |  
|  0003  | 0.0.1 [![S]][M] | 2024-02-22 | 06:50 | [#17-dev-mask] | VERSION |  0.0.1  |  
|  0002  | 0.0.1 [![S]][M] | 2024-02-22 | 06:40 | [#17-dev-mask] |  DONE   |  0.0.1  |  
|  0001  | 0.0.1 [![E]][M] | 2024-02-22 | 02:20 | [#17-dev-mask] |  BEGIN  |  0.0.1  |  

*ПРИМЕЧАНИЕ:* под продуктом подразумевается версия `mask.vbs`  

[#17-dev-mask]: ../history.md#-v017-dev
[#18-tst-mask]: ../history.md#-v018-tst
[#19-tst-mask]: ../history.md#-v019-tst
[#20-tst-mask]: ../history.md#-v020-tst
[#21-tst-mask]: ../history.md#-v021-tst
[#24-dev-mask]: ../history.md#-v024-dev
