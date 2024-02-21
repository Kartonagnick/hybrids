[![logo](../logo.png)](../docs.md "documentation") 

[M]: ../docs.md        "родитель"
[P]: ../icons/progress.png  "в процессе..."
[S]: ../icons/success.png   "ошибок не обнаружено"
[E]: ../icons/empty.png     "нет данных"

[![P]][M] path v0.0.1
=====================
Набор инструментов для работы с файловыми путями:  

```vbs
functions:
  isAbsolutePath(path)
  relativePath(general, target)
  canonicalPath(path)
  canonicalPathList(path)
```

```vbs
  возвращает ArrayList с нормализованными токенами пути
  canonicalPathList(path)
```

```vbs
example:
  canonicalPath("path"   ) ---------------> "path"
  canonicalPath("a/b/c"  ) ---------------> "a\b\c"
  canonicalPath("a/b/c/" ) ---------------> "a\b\c"
  canonicalPath("a//b/\c") ---------------> "a\b\c"
  canonicalPath("a/\/\\/b///\\/\c"   ) ---> "a\b\c"
  canonicalPath("a/b/../c/d"         ) ---> "a\c\d"
  canonicalPath("a/b/../c/d/f"       ) ---> "a\c\d\f"
  canonicalPath("a/b/../../c/d"      ) ---> "c\d"
  canonicalPath("a/b/../../../c/d"   ) ---> "..\c\d"
  canonicalPath("a/b/../../../../c/d") ---> "..\..\c\d"
```


```vbs
example:
  isAbsolutePath("C:\") -----> true
  isAbsolutePath("C:/") -----> true
  isAbsolutePath("\path") ---> true
  isAbsolutePath("\\path") --> true
  isAbsolutePath("/path") ---> true
  isAbsolutePath("//path") --> true
  isAbsolutePath("path") ----> false
  isAbsolutePath("./path") --> false
```

```vbs
example:
  relativePath("path"     , "path"    ) --> ""
  relativePath("a/b"      , "a/b"     ) --> ""
  relativePath("a/b"      , "a/b/c"   ) --> "c"
  relativePath("a/b"      , "a/b/c/d" ) --> "c\d"
  relativePath("a/b"      , "a/f"     ) --> "..\f"
  relativePath("a/b"      , "../f"    ) --> "..\..\..\f"
  relativePath("a/b"      , "a/c/d"   ) --> "..\c\d"
  relativePath("a/c"      , "../f"    ) --> "..\..\..\f"
  relativePath("a/b/c/d"  , "../c/d"  ) --> "..\..\..\..\..\c\d"
  relativePath("a/c"      , "f"       ) --> "..\..\f"
  relativePath("a/b/c"    , "a/f"     ) --> "..\..\f"
  relativePath("a/b/c"    , "b/f"     ) --> "..\..\..\b\f"
  relativePath(""         , ""        ) --> ""
  relativePath(""         , "a/b/c"   ) --> "a\b\c"
  relativePath(""         , "a/b/../c") --> "a\c"
  relativePath("a/b/c"    , ""        ) --> "a\b\c"
  relativePath("a/b/../c" , ""        ) --> "a\c"
```

--------------------------------------------------------------------------------

История изменений 
-----------------

| **ID** |      версия     |    дата    | время |      ветка     | status  | продукт |  
|:------:|:---------------:|:----------:|:-----:|:--------------:|:-------:|:-------:|  
|  0003  | 0.0.1 [![P]][M] | 2024-02-21 | 12:30 | [#13-dev-path] | VERSION |  0.0.1  |  
|  0002  | 0.0.1 [![P]][M] | 2024-02-21 | 12:20 | [#13-dev-path] |  DONE   |  0.0.1  |  
|  0001  | 0.0.1 [![E]][M] | 2024-02-21 | 11:30 | [#13-dev-path] |  BEGIN  |  0.0.1  |  

*ПРИМЕЧАНИЕ:* под продуктом подразумевается версия `path.vbs`  

[#13-dev-path]: ../history.md#-v013-dev
