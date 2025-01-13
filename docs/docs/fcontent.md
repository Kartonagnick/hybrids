[![logo](../logo.png)](../docs.md "documentation") 

[M]: ../docs.md        "родитель"
[P]: ../icons/progress.png  "в процессе..."
[S]: ../icons/success.png   "ошибок не обнаружено"
[E]: ../icons/empty.png     "нет данных"

[![P]][M] fcontent v0.0.1
=========================
Инструмент для загрузки/сохранения файлов utf8

```vbs
'  class FileContent
'    function load(path, func)
'    sub saveEndl(path, content)
'    sub save(path, content)
```

Пример использования:  

```vbs

  function func(line)
    func = true
     WScript.Echo "[f] " & line
  end function

  dim content, loader
  dim src: src = "C:\src\test.md"
  dim dst: dst = "C:\dst\test.md"

  set loader = new FileContent
  set content = loader.load(src, "func")
  loader.save dst, content
```

Вывод в консоль:  

```
[f] текст1
[f] текст2
```

--------------------------------------------------------------------------------

История изменений 
-----------------

| **ID** |      версия     |    дата    | время |        ветка       | status  | продукт |  
|:------:|:---------------:|:----------:|:-----:|:------------------:|:-------:|:-------:|  
|  0003  | 0.0.1 [![P]][M] | 2025-01-13 | 13:00 | [#61-dev-fcontent] | VERSION |  0.0.1  |  
|  0002  | 0.0.1 [![P]][M] | 2025-01-13 | 12:50 | [#61-dev-fcontent] |  DONE   |  0.0.1  |  
|  0001  | 0.0.1 [![E]][M] | 2025-01-13 | 10:40 | [#61-dev-fcontent] |  BEGIN  |  0.0.1  |  

*ПРИМЕЧАНИЕ:* под продуктом подразумевается версия `fcontent.vbs`  

[#61-dev-fcontent]: ../history.md#-v061-dev
