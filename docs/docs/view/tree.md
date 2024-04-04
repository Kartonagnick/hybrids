[![logo](../../logo.png)](../../docs.md "documentation") 

[M]: ../../docs.md        "родитель"
[P]: ../../icons/progress.png  "в процессе..."
[S]: ../../icons/success.png   "ошибок не обнаружено"
[E]: ../../icons/empty.png     "нет данных"

[![P]][M] view/tree v0.0.1
==========================
Инструмент служит для отображения содержимого древовидных структур в виде текста.  
Для этого, класс на входе принимает объект древовидной структуры,  
и на выходе возвращает список текстовых строк.  

Сигнатура:  

```vbs
class Tree
  public default function init(enable_empty, enable_type)

  property Let show_type(v)
  property Let show_empty(v)

  public sub show(deep, title, v)
  public function getText(v)
```

Всего у механизма 4ре режима работы:
  - типичный (не показывает типы, и не показывает пустые элементы)
  - показывает типы, не показывает пустышки
  - показывает пустышки, не показывает типы
  - показывает и типы, и пустышки

Примеры использования в типичном режиме:  

```vbs
  dim value: dim out: dim deep: deep = 0
  value = array(                              _
    1,                                        _
    array(1, array(true, 1.1, "", 2, false),  _
      Null,                                   _
      Nothing,                                _
      list,                                   _
      array(),                                _
      array(Nothing, Nothing),                _
      3                                       _
    ),                                        _
    "end"                                     _
  )
  set out = (new Tree)(false, false)
  out.show deep, value
```

Вывод в консоль:  

```
1
  1
    true
    1.1
    2
    false
    11
    true
    12
  3
end
```
<br/>


Вывод с отображением пустышек (без типов):  
```vbs
  dim value: dim out: dim deep: deep = 0
  value = array(
    1, 
    array(                              _
      1,                                _
      array(true, 1.1, "", 2, false),   _
      Null,                             _
      Nothing,                          _
      array(),                          _
      array(Nothing, Nothing),          _
      3                                 _
    ),                                  _
    "end"                               _
  )
  set out = (new Tree)(true, false)
  out.show deep, value
```

Вывод в консоль:  

```
1
  1
    true
    1.1
    (empty)
    2
    false
  (empty)
  (empty)
  (empty)
    (empty)
    (empty)
  3
end
```
<br/>



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

  set out = (new Tree)(false, true)
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
  set out = (new Tree)(true, true)
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


--------------------------------------------------------------------------------

История изменений 
-----------------

| **ID** |      версия     |    дата    | время |     ветка      | status  | продукт |  
|:------:|:---------------:|:----------:|:-----:|:--------------:|:-------:|:-------:|  
|  0003  | 0.0.1 [![P]][M] | 2024-04-05 | 23:50 | [#29-dev-tree] | VERSION |  0.0.1  |  
|  0002  | 0.0.1 [![P]][M] | 2024-04-05 | 23:40 | [#29-dev-tree] |  DONE   |  0.0.1  |  
|  0001  | 0.0.1 [![E]][M] | 2024-04-03 | 11:00 | [#29-dev-tree] |  BEGIN  |  0.0.1  |  

*ПРИМЕЧАНИЕ:* под продуктом подразумевается версия `view/tree.vbs`  

[#29-dev-tree]: ../../history.md#-v029-dev
