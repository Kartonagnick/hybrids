[![logo](../logo.png)](../docs.md "documentation") 

[M]: ../docs.md        "родитель"
[P]: ../icons/progress.png  "в процессе..."
[S]: ../icons/success.png   "ошибок не обнаружено"
[E]: ../icons/empty.png     "нет данных"

[![P]][M] find_in v0.0.3
========================
Инструмент служит для поиска файлов или каталогов.  

```vbs
class FindIN
  public default function init(paths)  'можно указать пути к каталогу, где нужно искать
  property Get dirs()                  'возвращает обнаруженные каталоги
  property Get files()                 'возвращает обнаруженные файлы
  property Let hideSkip(v)             'не показывать пропущенные файлы или каталоги
  property Let hideScan(v)             'не показывать лог процесса поиска
  property Let debug(v)                'вкл/выкл отладочный вывод
  property Let once(v)                 'завершить поиск сразу же при первом успешном обнаружении
  property Let scanDirs(v)             'устанавка списка путей каталогов, где нужно искать
  property Let includeF(v)             'установка списка масок имен файлов, которые нужно найти
  property Let excludeF(v)             'установка списка масок имен файлов, которые не интересны
  property Let includeD(v)             'установка списка масок имен каталогов, которые нужно найти
  property Let excludeD(v)             'установка списка масок имен каталогов, которые не интересны
  property Let includeS(v)             'установка списка масок имен каталогов, в которых нужно искать
  property Let excludeS(v)             'установка списка масок имен каталогов, где не нужно искать
  sub showParams(deep)                 'показывает стартовые настройки
  function run(deep)                   'запускает поиск
end class
```

Пример использования:  

```vbs
dim oFind: dim f: dim d
set oFind = (new Find_IN)("../path/to")
oFind.includeD = "*кактус*"
oFind.includeF = "*кактус*"
oFind.run deep + 1

for each f in oFind.files()
  WScript.Echo "f: " & f
next

for each d in oFind.dirs()
  WScript.Echo "d: " & d
next
```

--------------------------------------------------------------------------------

История изменений 
-----------------

| **ID** |      версия     |    дата    | время |       ветка       | status  | продукт |  
|:------:|:---------------:|:----------:|:-----:|:-----------------:|:-------:|:-------:|  
|  0006  | 0.0.3 [![P]][M] | 2024-03-09 | 04:10 | [#25-dev-find_in] | VERSION |  0.0.3  |  
|  0005  | 0.0.3 [![P]][M] | 2024-03-09 | 04:00 | [#25-dev-find_in] |  DONE   |  0.0.3  |  
|  0004  | 0.0.3 [![E]][M] | 2024-03-09 | 03:00 | [#25-dev-find_in] |  BEGIN  |  0.0.3  |  
|  0003  | 0.0.2 [![S]][M] | 2024-03-06 | 23:50 | [#23-dev-find_in] | VERSION |  0.0.2  |  
|  0002  | 0.0.2 [![S]][M] | 2024-03-06 | 23:40 | [#23-dev-find_in] |  DONE   |  0.0.2  |  
|  0001  | 0.0.2 [![E]][M] | 2024-03-06 | 20:00 | [#23-dev-find_in] |  BEGIN  |  0.0.2  |  

*ПРИМЕЧАНИЕ:* под продуктом подразумевается версия `find_in.vbs`  

[#23-dev-find_in]: ../history.md#-v023-dev
[#25-dev-find_in]: ../history.md#-v025-dev
