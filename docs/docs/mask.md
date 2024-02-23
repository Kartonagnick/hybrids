[![logo](../logo.png)](../docs.md "documentation") 

[M]: ../docs.md        "родитель"
[P]: ../icons/progress.png  "в процессе..."
[S]: ../icons/success.png   "ошибок не обнаружено"
[E]: ../icons/empty.png     "нет данных"

[![S]][M] mask v0.0.1
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

classes
  class MaskExp
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
|  0006  | 0.0.2 [![S]][M] | 2024-02-23 | 07:30 | [#18-tst-mask] | VERSION |  0.0.1  |  
|  0005  | 0.0.2 [![S]][M] | 2024-02-23 | 07:20 | [#18-tst-mask] |  DONE   |  0.0.1  |  
|  0004  | 0.0.2 [![E]][M] | 2024-02-23 | 07:10 | [#18-tst-mask] |  BEGIN  |  0.0.1  |  
|  0003  | 0.0.1 [![S]][M] | 2024-02-22 | 06:50 | [#17-dev-mask] | VERSION |  0.0.1  |  
|  0002  | 0.0.1 [![S]][M] | 2024-02-22 | 06:40 | [#17-dev-mask] |  DONE   |  0.0.1  |  
|  0001  | 0.0.1 [![E]][M] | 2024-02-22 | 02:20 | [#17-dev-mask] |  BEGIN  |  0.0.1  |  

*ПРИМЕЧАНИЕ:* под продуктом подразумевается версия `mask.vbs`  

[#17-dev-mask]: ../history.md#-v016-dev
[#18-tst-mask]: ../history.md#-v017-dev
