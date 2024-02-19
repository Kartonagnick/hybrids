[![logo](../logo.png)](../docs.md "documentation") 

[M]: ../docs.md        "родитель"
[P]: ../icons/progress.png  "в процессе..."
[S]: ../icons/success.png   "ошибок не обнаружено"
[E]: ../icons/empty.png     "нет данных"

[![P]][M] errCode v0.0.1
========================
В этом файле хранятся глобальные идентификаторы ошибок:  

```vbs
errorAssertFailed    = vbObjectError + 1
errorTestFailed      = vbObjectError + 2
errorFuncFailed      = vbObjectError + 3
errorExecFailed      = vbObjectError + 4
errorInvalidTag      = vbObjectError + 5
errorInvalidType     = vbObjectError + 6
errorInvalidSize     = vbObjectError + 7
errorInvalidToken    = vbObjectError + 8
errorInvalidOrder    = vbObjectError + 9
errorInvalidArgument = vbObjectError + 10
errorInvalidSequence = vbObjectError + 11
errorEmptyData       = vbObjectError + 12
errorOutRange        = vbObjectError + 13
errorNotFound        = vbObjectError + 14
errorNotExist        = vbObjectError + 15
errorLogick          = vbObjectError + 16
```

А так же функция, которая преобразует код ошибки в текстовое описание:  

```vbs
function errorString(v)
```

--------------------------------------------------------------------------------

История изменений 
-----------------

| **ID** |      версия     |    дата    | время |      ветка       | status  | продукт |  
|:------:|:---------------:|:----------:|:-----:|:----------------:|:-------:|:-------:|  
|  0003  | 0.0.1 [![P]][M] | 2024-02-19 | 15:00 | [#6-dev-errcode] | VERSION |  0.0.1  |  
|  0002  | 0.0.1 [![P]][M] | 2024-02-19 | 14:50 | [#6-dev-errcode] |  DONE   |  0.0.1  |  
|  0001  | 0.0.1 [![E]][M] | 2024-02-19 | 14:20 | [#6-dev-errcode] |  BEGIN  |  0.0.1  |  

*ПРИМЕЧАНИЕ:* под продуктом подразумевается версия `errCode.vbs`  

[#6-dev-errcode]: ../history.md#-v006-dev
