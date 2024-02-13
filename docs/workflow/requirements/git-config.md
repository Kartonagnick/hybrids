
[![logo](../../logo.png)](../../docs.md "documentation") 

[M]: ../requirements.md      "родитель"
[P]: ../../icons/progress.png  "в процессе..."
[S]: ../../icons/success.png   "ошибок не обнаружено"
[E]: ../../icons/empty.png     "нет данных"

[![S]][M] .Git/config v0.0.1
============================
Золотой стандарт для кроссплатформенной разработки.  
Данные настройки ориентированны на разработку как в Windows, так и в Linux,  
так и на режим `remote build from Windows to Linux`:  

> - на стороне Windows запускается msbuild, который подключается к Linux-машине,  
>   и выполняет сборку с помощью gcc-компилятора.  
> 
> - в Windows отладчик Visual Studio подключается к процессу на Linux-машине,  
>   и производит пошаговую отладку linux-процесса.  

Режим `remote build from Windows to Linux` накладывает определенные требования к разработке,
а именно: строгое соблюдение кодировок и EOL для файлов исходного кода,
а главное: для пропсов, и нативных скриптов различных ОСей.
Ниже дается описание настроек на уровне git.  
<br/>

Файл .git/config  
----------------
Возможные значения `autocrlf`:  
 - `autocrlf = true`
   - commit  : замена CRLF на LF  
   - checkout: замена LF на CRLF  
 - `autocrlf = input`
   - commit  : замена CRLF на LF  
   - checkout: ничего не происходит (файлы остаются LF)  
 - `autocrlf = false`
   - commit  : ничего не происходит  
   - checkout: ничего не происходит  

Возможные значения `eol`: определяет EOL рабочих файлов на локальной машине:  
 - `eol = native`  
   - Windows: использовать CRLF  
   - Linux: использовать LF  
 - `eol = CRLF`  
   - всегда использовать CRLF  
 - `eol = LF`  
   - всегда использовать LF  

Рекомендуемые настройки файла `.git/config`

```
[core]
	repositoryformatversion = 0
	filemode = false
	bare = false
	logallrefupdates = true
	symlinks = false
	ignorecase = true

    # не преобразовывать EOL
	autocrlf = false

    # предпочитать нативный EOL (актуально для .gitattributes)
	eol = native
[commit]
    # не добавлять в текст обычных коммитов служебную информацию
	cleanup = strip
[merge]
    # не добавлять в текст мерж-коммитов служебную информацию
	cleanup = strip
[user]
	email = Kartonagnick@gmail.com
	name = Kartonagnick
[taggrouping]
	groups = 
	singles = 
```
<br/>

Глобальные настройки git
------------------------
При установке git, нужно выбрать:  

Choose the default editor used by Git:
  - редактор по умолчанию (что угодно, только не vim: notepad++)  

Adjusting the name of the initial in new repositories:  
  - имя ветки по умолчанию: master  
    - [x] Let Git decide  
    - [ ] Override the default branch name for new repositories  

Adjusting your PATH environment:  
  - [ ] Use Git from Bash only  
  - [x] Git from the command line  and also 3rd-party software  
  - [ ] Use Git and optional Unix tools from the Command Propmpt  

Choosing the SSH executable:  
  - [x] Use bundled OpenSSH  
  - [ ] Use external OpenSSH  

Choosing HTTPS transport backend:  
  - [ ] Use the OpenSSL library  
  - [x] Use the native Windows Secure Channel library  

Configuring the line ending conversion:  
  - [ ] Checkout Windows-style, commit Unix-style line endings  
  - [x] Checkout as-is, commits Unix-style endings  
  - [ ] Checkout as-is, commits as-is  

Configuring the terminal emulator to use Git Bash:  
  - [ ] Use MinTTY (the default terminal of MSYS2)  
  - [x] Use Windows default console window  

Choosing the default behavior of `git pull`  
  - [x] Fast-forward or merge  
  - [ ] Rebase  
  - [ ] Only ever fast-worward  

Choose a credential helper:  
  - [x] Git Credential Manager  
  - [ ] None  

Configuring extra options  
  - [x] Enable file system caching  
  - [ ] Enable symbolic links  
<br/>  


История изменений 
-----------------

|  ID  |    дата    | время |     ветка      | status  | длительность |
|:----:|:----------:|:-----:|:--------------:|:-------:|:------------:|
| 0001 | 2024-02-13 | 13:20 | [#1-rep-first] | VERSION | 2 часа       |

[#1-rep-first]: ../../history.md#-v001-rep
