[![logo](../../logo.png)](../../docs.md "documentation") 

[M]: ../git.md               "родитель"
[P]: ../../icons/progress.png  "в процессе..."
[S]: ../../icons/success.png   "ошибок не обнаружено"
[E]: ../../icons/empty.png     "нет данных"

[![P]][M] git/git v0.0.1
========================
Класс отвечает за инициализацию модуля, и содержит базовые методы:  
```
class GitAPI
  property get version()
  property get lastCommitFull()
  property get lastCommitShort()
  property get branch()
  property get unreachable()
  sub cleanRepo(deep)
  function branchByHash(hash)
  function getMasterCommits()
  function getBranchCommits()
```

--------------------------------------------------------------------------------

История изменений 
-----------------

| **ID** |      версия     |    дата    | время |     ветка     | status  | продукт |  
|:------:|:---------------:|:----------:|:-----:|:-------------:|:-------:|:-------:|  
|  0003  | 0.0.1 [![P]][M] | 2025-01-16 | 04:50 | [#64-dev-git] | VERSION |  0.0.1  |  
|  0002  | 0.0.1 [![P]][M] | 2025-01-16 | 04:40 | [#64-dev-git] |  DONE   |  0.0.1  |  
|  0001  | 0.0.1 [![E]][M] | 2025-01-16 | 00:00 | [#64-dev-git] |  BEGIN  |  0.0.1  |  

*ПРИМЕЧАНИЕ:* под продуктом подразумевается версия `vbs/git/git.vbs`  

[#64-dev-git]:   ../../history.md#-v064-dev