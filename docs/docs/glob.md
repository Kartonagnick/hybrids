[![logo](../logo.png)](../docs.md "documentation") 

[M]: ../docs.md        "родитель"
[P]: ../icons/progress.png  "в процессе..."
[S]: ../icons/success.png   "ошибок не обнаружено"
[E]: ../icons/empty.png     "нет данных"

[![S]][M] glob v0.0.1
=====================
Набор глобальных объектов, которые нужны практически каждому гибриду  

```vbs
set g_list   = CreateObject("System.Collections.ArrayList")
set g_fso    = CreateObject("Scripting.FileSystemObject")
set g_regexp = CreateObject("VBScript.RegExp")
set g_shell  = CreateObject("WScript.Shell")
set g_env    = g_shell.Environment("PROCESS")
```

--------------------------------------------------------------------------------

История изменений 
-----------------

| **ID** |      версия     |    дата    | время |     ветка     | status  | продукт |  
|:------:|:---------------:|:----------:|:-----:|:-------------:|:-------:|:-------:|  
|  0003  | 0.0.1 [![S]][M] | 2024-02-17 | 20:30 | [#3-dev-glob] | VERSION |  0.0.1  |  
|  0002  | 0.0.1 [![S]][M] | 2024-02-17 | 20:20 | [#3-dev-glob] |  DONE   |  0.0.1  |  
|  0001  | 0.0.1 [![E]][M] | 2024-02-17 | 02:00 | [#3-dev-glob] |  BEGIN  |  0.0.1  |  

*ПРИМЕЧАНИЕ:* под продуктом подразумевается версия `glob.vbs`  

[#3-dev-glob]: ../history.md#-v003-dev
