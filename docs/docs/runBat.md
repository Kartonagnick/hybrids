[![logo](../logo.png)](../docs.md "documentation") 

[M]: ../docs.md        "родитель"
[P]: ../icons/progress.png  "в процессе..."
[S]: ../icons/success.png   "ошибок не обнаружено"
[E]: ../icons/empty.png     "нет данных"

[![P]][M] runBat v0.0.1
=======================
Инструмент позволяет запускать батники,  
с возможностью сохранить переменные среды,  
которые эти батники настраивают  

Сигнатура:  
```vbs
  function runBat(deep, hide, path_to_bat)
```

Примеры использования:  

```vbs
  dim result: set result = runBat("./example.bat") 
  if result.code <> 0 then
    WScript.Echo "ERROR: " & result.code  
    if result.stderr <> Empty then
      WScript.Echo "ERROR: " & result.stderr
    end if
  else
    for each k in result.stdout.keys()
      WScript.Echo k & " = " & result.stdout.item(k)
    next
  end if
```

--------------------------------------------------------------------------------

История изменений 
-----------------

| **ID** |      версия     |    дата    | время |      ветка     | status  | продукт |  
|:------:|:---------------:|:----------:|:-----:|:--------------:|:-------:|:-------:|  
|  0003  | 0.0.1 [![P]][M] | 2024-02-21 | 14:20 | [#14-dev-util] | VERSION |  0.0.1  |  
|  0002  | 0.0.1 [![P]][M] | 2024-02-21 | 14:10 | [#14-dev-util] |  DONE   |  0.0.1  |  
|  0001  | 0.0.1 [![E]][M] | 2024-02-21 | 13:20 | [#14-dev-util] |  BEGIN  |  0.0.1  |  

*ПРИМЕЧАНИЕ:* под продуктом подразумевается версия `runBat.vbs`  

[#14-dev-util]: ../history.md#-v014-dev
