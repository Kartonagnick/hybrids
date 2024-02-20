[![logo](../logo.png)](../docs.md "documentation") 

[M]: ../docs.md        "родитель"
[P]: ../icons/progress.png  "в процессе..."
[S]: ../icons/success.png   "ошибок не обнаружено"
[E]: ../icons/empty.png     "нет данных"

[![P]][M] runCmd v0.0.1
=======================
Инструмент служит для удобства запуска процессов.  

Например: нужно запустить какой ниубудь внешнюю программу, 
и считать результат  

Сигнатура:  
```vbs
  function runCmd(command)
```

Примеры использования:  

```vbs
  dim result: set result = runCmd("hostname") 
  if result.code <> 0 then
    WScript.Echo "ERROR: " & result.code  
    if result.stderr <> Empty then
      WScript.Echo "ERROR: " & result.stderr
    end if
  else
    WScript.Echo "stdout: " & result.stdout
  end if
```

--------------------------------------------------------------------------------

История изменений 
-----------------

| **ID** |      версия     |    дата    | время |      ветка     | status  | продукт |  
|:------:|:---------------:|:----------:|:-----:|:--------------:|:-------:|:-------:|  
|  0003  | 0.0.1 [![P]][M] | 2024-02-20 | 23:50 | [#11-dev-util] | VERSION |  0.0.1  |  
|  0002  | 0.0.1 [![P]][M] | 2024-02-20 | 23:40 | [#11-dev-util] |  DONE   |  0.0.1  |  
|  0001  | 0.0.1 [![E]][M] | 2024-02-20 | 23:10 | [#11-dev-util] |  BEGIN  |  0.0.1  |  

*ПРИМЕЧАНИЕ:* под продуктом подразумевается версия `runCmd.vbs`  

[#11-dev-util]: ../history.md#-v011-dev
