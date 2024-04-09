[![logo](../../logo.png)](../../docs.md "documentation") 

[M]: ../../docs.md        "родитель"
[P]: ../../icons/progress.png  "в процессе..."
[S]: ../../icons/success.png   "ошибок не обнаружено"
[E]: ../../icons/empty.png     "нет данных"

[Tree]: tree.md

[![S]][M] view/tree_type v0.0.1
================================
Инструмент служит для отображения содержимого древовидных структур в виде текста.  
Для этого, класс на входе принимает объект древовидной структуры,  
и на выходе возвращает список текстовых строк.  

Класс `TreeType` по своему действию аналогичен классу [Tree],  
который запущен в режиме:   
  - не показывать пустые элементы  
  - показывать типы элементов  

Сигнатура:  

```vbs
class TreeType
  public function getText(v)
  sub show(deep, title, v)
```

Вывод с отображением типов элементов (без пустышек):  

```vbs
  dim value: dim out: dim deep: deep = 0
  value = array(                      _
    1,                                _
    array(                            _
      1,                              _
      array(true, 1.1, "", 2, false), _
      Null,                           _
      Nothing,                        _
      list,                           _
      array(),                        _
      array(Nothing, Nothing),        _
      3                               _
    ),                                _
    "end"                             _
  )

  set out = new TreeType
  out.show deep, value
```

Вывод в консоль:  

```
<Array: 3>
  <Integer> 1
  <Array: 8>
    <Integer> 1
    <Array: 5>
      <Bool> true
      <Double> 1.1
      <Integer> 2
      <Bool> false
    <ArrayList: 3>
      <Integer> 11
      <Bool> true
      <Integer> 12
    <Array: 2>
    <Integer> 3
  <String> end
```
<br/>


--------------------------------------------------------------------------------

История изменений 
-----------------

| **ID** |      версия     |    дата    | время |     ветка      | status  | продукт |  
|:------:|:---------------:|:----------:|:-----:|:--------------:|:-------:|:-------:|  
|  0003  | 0.0.1 [![S]][M] | 2024-04-09 | 19:00 | [#31-dev-tree] | VERSION |  0.0.1  |  
|  0002  | 0.0.1 [![S]][M] | 2024-04-09 | 18:50 | [#31-dev-tree] |  DONE   |  0.0.1  |  
|  0001  | 0.0.1 [![E]][M] | 2024-04-08 | 11:00 | [#31-dev-tree] |  BEGIN  |  0.0.1  |  

*ПРИМЕЧАНИЕ:* под продуктом подразумевается версия `view/tree_type.vbs`  

[#31-dev-tree]: ../../history.md#-v031-dev
