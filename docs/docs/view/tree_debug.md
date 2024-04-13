[![logo](../../logo.png)](../../docs.md "documentation") 

[M]: ../../docs.md        "родитель"
[P]: ../../icons/progress.png  "в процессе..."
[S]: ../../icons/success.png   "ошибок не обнаружено"
[E]: ../../icons/empty.png     "нет данных"

[Tree]: tree.md

[![P]][M] view/tree_debug v0.0.1
================================
Инструмент служит для отображения содержимого древовидных структур в виде текста.  
Для этого, класс на входе принимает объект древовидной структуры,  
и на выходе возвращает список текстовых строк.  

Класс `TreeDebug` по своему действию аналогичен классу [Tree],  
который запущен в режиме:   
  - показывать пустые элементы  
  - показывать типы элементов  

Сигнатура:  

```vbs
class TreeDebug
  public function getText(v)
  sub show(deep, title, v)
```

Вывод с отображением и типов и пустышек:

```vbs
  dim value: dim out: dim deep: deep = 0
  value = array(                             _
    1,                                       _
    array(1, array(true, 1.1, "", 2, false), _
      Null,                                  _
      Nothing,                               _
      array(),                               _
      array(Nothing, Nothing),               _
      3                                      _
    ),                                       _
    "end"                                    _
  )
  set out = new TreeDebug
  out.show deep, value
```

Вывод в консоль:  

```
<Array: 3>
  <Integer> 1
  <Array: 7>
    <Integer> 1
    <Array: 5>
      <Bool> true
      <Double> 1.1
      <String> (empty)
      <Integer> 2
      <Bool> false
    <Null> (empty)
    <Nothing> (empty)
    <Array> (empty)
    <Array: 2>
      <Nothing> (empty)
      <Nothing> (empty)
    <Integer> 3
  <String> end
```
<br/>

<br/>

--------------------------------------------------------------------------------

История изменений 
-----------------

| **ID** |      версия     |    дата    | время |     ветка      | status  | продукт |  
|:------:|:---------------:|:----------:|:-----:|:--------------:|:-------:|:-------:|  
|  0003  | 0.0.1 [![P]][M] | 2024-04-13 | 19:00 | [#33-dev-tree] | VERSION |  0.0.1  |  
|  0002  | 0.0.1 [![P]][M] | 2024-04-13 | 18:50 | [#33-dev-tree] |  DONE   |  0.0.1  |  
|  0001  | 0.0.1 [![E]][M] | 2024-04-12 | 11:00 | [#33-dev-tree] |  BEGIN  |  0.0.1  |  

*ПРИМЕЧАНИЕ:* под продуктом подразумевается версия `view/tree_debug.vbs`  

[#33-dev-tree]: ../../history.md#-v033-dev
