[![logo](../logo.png)](../docs.md "documentation") 

[M]: ../docs.md        "родитель"
[P]: ../icons/progress.png  "в процессе..."
[S]: ../icons/success.png   "ошибок не обнаружено"
[E]: ../icons/empty.png     "нет данных"

[![P]][M] environment v0.0.1
============================
Инструмент для работы с переменными окружения среды   
Синопсис:  

```cpp
' возвращает непустое значение переменной среды name
' если значение среды пусто, тогда возвращает значение def
function fromEnvironment(name, def)

' если text: пусто, ноль, false, off, no -> false
' если text: true, on, yes -> true
' иначе возаращеется значение text
function fromStringEnv(text)

' возвращает ArrayList, который содержит значения массива
' заданного в перменных окрежния среды
function fromEnvironmentArray(arr_name)
```

Пример использования:  

```vbs
WScript.Echo "val: " & fromEnvironment("eVALUE" , def)
WScript.Echo "def: " & fromEnvironment("novalue", "xxxx")

dim lst: set lst = fromEnvironmentArray("eARRAY")
for each elem in lst
  WScript.Echo "elem: " & elem
next
```

Вывод в консоль:  
```
val: test
def: xxxx
elem: one
elem: two
```

--------------------------------------------------------------------------------

История изменений 
-----------------

| **ID** |      версия     |    дата    | время |     ветка     | status  | продукт |  
|:------:|:---------------:|:----------:|:-----:|:-------------:|:-------:|:-------:|  
|  0003  | 0.0.1 [![P]][M] | 2024-09-30 | 13:00 | [#55-dev-env] | VERSION |  0.0.1  |  
|  0002  | 0.0.1 [![P]][M] | 2024-09-30 | 12:50 | [#55-dev-env] |  DONE   |  0.0.1  |  
|  0001  | 0.0.1 [![E]][M] | 2024-09-29 | 10:40 | [#55-dev-env] |  BEGIN  |  0.0.1  |  

*ПРИМЕЧАНИЕ:* под продуктом подразумевается версия `environment.vbs`  

[#55-dev-env]:   ../history.md#-v055-dev
