[![logo](../logo.png)](../docs.md "documentation") 

[M]: ../docs.md        "родитель"
[P]: ../icons/progress.png  "в процессе..."
[S]: ../icons/success.png   "ошибок не обнаружено"
[E]: ../icons/empty.png     "нет данных"

[![P]][M] pushd v0.0.1
======================
Инструмент служит для перехода в каталог,  
и возврата обратно по принципу стека  

Сигнатура:  

```vbs
' переход к указанный каталог
sub pushd(path)

' переход в каталог указанного файла
sub pushf(path)

' возврат обратно в предыдущий каталог
sub popd()
```

Пример использования:  

```vbs
sub callThree()
  WScript.Echo "callThree(beg): " & g_shell.CurrentDirectory
  WScript.Echo "callThree(end): " & g_shell.CurrentDirectory
end sub

sub callSecond()
  WScript.Echo "callSecond(beg): " & g_shell.CurrentDirectory
  pushd g_shell.CurrentDirectory & "\333"
  callThree
  popd
  WScript.Echo "callSecond(end): " & g_shell.CurrentDirectory
end sub

sub callFirst()
  WScript.Echo "callFirst(beg): " & g_shell.CurrentDirectory
  pushd g_shell.CurrentDirectory & "\222"
  callSecond
  popd
  WScript.Echo "callFirst(end): " & g_shell.CurrentDirectory
end sub

sub example
  dim d: d = g_fso.GetParentFolderName(WScript.ScriptFullName) 
  WScript.Echo "example(beg): " & g_shell.CurrentDirectory
  pushd d & "\111"
  callFirst
  popd
  WScript.Echo "example(end): " & g_shell.CurrentDirectory
end sub

example
```

Вывод в консоль:  
```
example(beg): D:\local\hybrids\test\pushd
callFirst(beg): D:\local\hybrids\test\pushd\sources\111
callSecond(beg): D:\local\hybrids\test\pushd\sources\111\222
callThree(beg): D:\local\hybrids\test\pushd\sources\111\222\333
callThree(end): D:\local\hybrids\test\pushd\sources\111\222\333
callSecond(end): D:\local\hybrids\test\pushd\sources\111\222
callFirst(end): D:\local\hybrids\test\pushd\sources\111
example(end): D:\local\hybrids\test\pushd
```

--------------------------------------------------------------------------------

История изменений 
-----------------

| **ID** |      версия     |    дата    | время |      ветка      | status  | продукт |  
|:------:|:---------------:|:----------:|:-----:|:---------------:|:-------:|:-------:|  
|  0003  | 0.0.1 [![P]][M] | 2024-09-28 | 19:00 | [#54-dev-pushd] | VERSION |  0.0.1  |  
|  0002  | 0.0.1 [![P]][M] | 2024-09-28 | 18:50 | [#54-dev-pushd] |  DONE   |  0.0.1  |  
|  0001  | 0.0.1 [![E]][M] | 2024-09-27 | 11:00 | [#54-dev-pushd] |  BEGIN  |  0.0.1  |  

*ПРИМЕЧАНИЕ:* под продуктом подразумевается версия `pushd.vbs`  

[#54-dev-pushd]: ../history.md#-v054-dev