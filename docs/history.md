[H]: ../README.md  "на главную"
[R]: icons/release.png
[V]: icons/version.png
[P]: icons/progress.png
[S]: icons/success.png
[B]: icons/bug.png

[![S]][H] **История изменений**  
--------------------------------------------------------------------------------

16 октября 2024, 00:45:00. Создано зеркало [гитхабе]  

15 октября 2024, 18:00:00. Отправка старых реинкарнаций в архив:  
  - `Kartonagnick/hybrids`   (последняя активность: 2021-02-03)  
  - `CastleOfDreams/vbs`     (последняя активность: 2021-09-07)  
  - `CastleOfDreams/hybrids` (последняя активность: 2022-03-16)  

13 февраля 2024, 11:17:07. Регистрация реинкарнации в `local` репозитории  
13 февраля 2024, 10:52:04. [Картонажник] создал третью реинкарнацию `hybrids`  
  - очередная попытка довести работу до своего логического завершения:  
    - рефактор всех компонентов, включая исторические метки  
    - продуманный дизайн фабрики гибридов  

6 декабря 2021, 09:00:00. Реинкарнация зарегистрированна в [Замке Грёз] на гитхабе.  
6 декабря 2021, 08:00:00. [Картонажник] создал вторую реинкарнацию `hybrids`  
  - пришло понимание, что нужна более проработанный центральный репозиторий,  
    который предоставит нечто вроде целой эко-системы для гибридов,  
    основанных на `vbs`  
  - работа так и не была доведена до логического завершения.  
    заглохла на этапе рефаторинга компонента для работы с историческими метками.  

17 декабря 2021, 01:13:16. Регистрация проекта `hybrids` на [Github].  
  - пришло понимание, что не только `скрипты.vbs`, 
    но и гибриды тоже нужно версионировать,  
    и поддерживать порядок в кодовой базе  
  - причем `vbs` нужно влить в `hybrids`, 
    для склейки итоговых гибридов  

18 августа 2021, 01:19:40. `vbs` Зарегистрирован в [CastleOfDreams][vbs].  
  - с этого момента началась работа по финишной обработке,  
    и внесению файлов в репозиторий  

16 июля 2021, 20:40:27. [Картонажник] создал проект `vbs`  
  - пришло понимание, что нужно закрепить полученный опыт,  
    путем создания репозитория, в рамках которого можно будет  
    совершенствовать `скрипты.vbs`  

26 декабря 2020, 11:00:00. [Картонажник] создал проект `hybrids`  
  - длительное время проект существовал как обычный каталог без репозитория  
  - файлы в нем не контролировались, что-то появлялось, 
    а что-то безвозвратно терялось  

|    дата    |  время   |              событие             |  
|:----------:|:--------:|:--------------------------------:|  
| 2024-10-16 | 00:45:00 | создано зеркало на [гитхабе]     |  
| 2024-10-15 | 18:00:00 | закрытие старых реинкарнаций     |  
| 2024-02-13 | 11:17:07 | регистрациия [local] репозитория |  
| 2024-02-13 | 10:52:04 | рождение третьей реинкарнации    |  
| 2021-12-06 | 09:00:00 | регистрация в [Замке] на гитхабе |  
| 2021-12-06 | 08:00:00 | рождение второй реинкарнации     |  
| 2021-12-17 | 01:13:16 | регистрация hybrids на [гитхабе] |  
| 2021-08-18 | 01:19:40 | регистрация vbs в замке          |  
| 2021-07-16 | 14:35:47 | день рождения vbs                |  
| 2020-12-26 | 11:00:00 | дата рождения hybrids            |  

[Картонажник]: https://github.com/Kartonagnick
[Замке Грёз]:  https://github.com/CastleOfDreams/hybrids
[Замке]:       https://github.com/CastleOfDreams/hybrids
[гитхабе]:     https://github.com/Kartonagnick/hybrids
[Github]:      https://github.com/Kartonagnick/hybrids
[vbs]:         https://github.com/CastleOfDreams/vbs
[local]:       D:/local/hybrids/README.md

--------------------------------------------------------------------------------


[![S]][H] **v0.6.4 (dev)**
--------------------------------------------------------------------------------
[![V]][VE064] [![2025-01-16 04:50]][VE064]  

[2025-01-16 04:50]: https://img.shields.io/static/v1?label=2025-01-16&message=04:50&color=yellowgreen
[VE064]: changelog.md#-v064-dev

|    дата    | время |     ветка     | статус |  
|:----------:|:-----:|:-------------:|:------:|  
| 2025-01-16 | 04:40 | [#64-dev-git] | DONE   |  
| 2025-01-16 | 00:00 | [#64-dev-git] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`         064  
   - upd: `changelog.md`     064  
   - upd: `history.md`       064  
   - upd: `chrono.md`        064  
   - upd: `docs.md`          064  
2. add: `docs/docs`  
   - add: `git.md`           001  
3. add: `docs/docs/git`  
   - add: `commit.md`        001  
   - add: `gitapi.md`        001  
4. upd: `test`  
   - upd: `test.ver`         057  
5. add:` test/git`  
   - add: `make.bat`         001  
   - add: `test-[wsf].bat`   001  
   - add: `test-[vbs].bat`   001  
6. add: `test/git/sources`  
   - add: `unreachable.vbs`  001  
   - add: `cleanRepo.vbs`    001  
   - add: `branch.vbs`       001  
   - add: `master.vbs`       001  
   - add: `last.vbs`         001  
   - add: `init.vbs`         001  
   - add: `struct.txt`       001  
7. upd: `vbs`  
   - upd: `vbs.ver`          045  
8. add: `vbs/git`  
   - add: `commit.vbs`       001  
   - add: `command.vbs`      001  
   - add: `git.vbs`          001  
9. upd: `project.root`       064  

[#64-dev-git]: tasks/2025-01-16-0064-dev-git.md
<div/>


[![S]][H] **v0.6.3 (dev)**
--------------------------------------------------------------------------------
[![V]][VE063] [![2025-01-15 23:50]][VE063]  

[2025-01-15 23:50]: https://img.shields.io/static/v1?label=2025-01-15&message=23:50&color=yellowgreen
[VE063]: changelog.md#-v063-dev

|    дата    | время |      ветка      | статус |  
|:----------:|:-----:|:---------------:|:------:|  
| 2025-01-15 | 23:40 | [#63-dev-strip] | DONE   |  
| 2025-01-15 | 19:40 | [#63-dev-strip] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`         063  
   - upd: `changelog.md`     063  
   - upd: `history.md`       063  
   - upd: `chrono.md`        063  
   - upd: `docs.md`          063  
2. add: `docs/docs`  
   - add: `strip.md`         001  
3. upd: `test`  
   - upd: `test.ver`         056  
4. add: `test/strip`  
   - add: `make.bat`         001  
   - add: `test-[wsf].bat`   001  
   - add: `test-[vbs].bat`   001  
5. add: `test/strip/sources`  
   - add: `front.vbs`        001  
   - add: `back.vbs`         001  
   - add: `struct.txt`       001  
6. upd: `vbs`  
   - upd: `vbs.ver`          044  
   - add: `strip_front.vbs`  001  
   - add: `strip_back.vbs`   001  
7. upd: `project.root`       063  

[#63-dev-strip]: tasks/2025-01-15-0063-dev-strip.md
<div/>


[![S]][H] **v0.6.2 (dev)**
--------------------------------------------------------------------------------
[![V]][VE062] [![2025-01-15 19:00]][VE062]  

[2025-01-15 19:00]: https://img.shields.io/static/v1?label=2025-01-15&message=19:00&color=yellowgreen
[VE062]: changelog.md#-v062-dev

|    дата    | время |       ветка      | статус |  
|:----------:|:-----:|:----------------:|:------:|  
| 2025-01-15 | 18:50 | [#62-dev-badgen] | DONE   |  
| 2025-01-15 | 10:30 | [#62-dev-badgen] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`        061  
   - upd: `history.md`      061  
   - upd: `docs.md`         061  
   - upd: `chrono.md`       061  
   - upd: `changelog.md`    061  
2. add: `docs/docs/ready`  
   - add: `badgen.md`       001  
3. add: `ready`  
   - add: `badgen.bat`      001  
4. add: `dev/badgen`  
   - add: `make.bat`        001  
   - add: `test-[wsf].bat`  001  
   - add: `test-[vbs].bat`  001  
5. add: `dev/badgen/sources`  
   - add: `struct.txt`      001  
   - add: `shields.vbs`     001  
   - add: `settings.vbs`    001  
   - add: `main.vbs`        001  
   - add: `image.vbs`       001  
   - add: `content.vbs`     001  
   - add: `badgen.vbs`      001  
6. add: `dev/badgen/resources`  
   - add: `example.md`  
7. upd: `project.root`      061  

[#62-dev-badgen]: tasks/2025-01-15-0062-dev-badgen.md
<div/>


[![S]][H] **v0.6.1 (dev)**
--------------------------------------------------------------------------------
[![V]][VE061] [![2025-01-13 12:50]][VE061]  

[2025-01-13 12:50]: https://img.shields.io/static/v1?label=2025-01-13&message=12:50&color=yellowgreen
[VE061]: changelog.md#-v061-dev

|    дата    | время |        ветка       | статус |  
|:----------:|:-----:|:------------------:|:------:|  
| 2025-01-13 | 12:40 | [#61-dev-fcontent] | DONE   |  
| 2025-01-13 | 07:10 | [#61-dev-fcontent] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`        061  
   - upd: `changelog.md`    061  
   - upd: `history.md`      061  
   - upd: `chrono.md`       061  
   - upd: `docs.md`         061  
2. add: `docs/docs`  
   - add: `fcontent.md`     001  
3. upd: `test`  
   - upd: `test.ver`        055  
4. add: `test/fcontent`  
   - add: `make.bat`        001  
   - add: `test-[wsf].bat`  001  
   - add: `test-[vbs].bat`  001  
5. add: `test/fcontent/sources`  
   - add: `test.wsf`        001  
   - add: `main.vbs`        001  
6. add: `test/fcontent/sources/src`  
   - add: `empty-endl.md`  
   - add: `one-endl.md`  
   - add: `etalon.md`  
   - add: `empty.md`  
   - add: `test.md`  
   - add: `one.md`  
7. upd: `vbs`  
   - upd: `vbs.ver`         043  
8. add: `vbs`  
   - add: `fcontent.vbs`    001  
9. upd: `project.root`      061  

[#61-dev-fcontent]: tasks/2025-01-15-0061-dev-fcontent.md
<div/>


[![S]][H] **v0.6.0 (dev)**
--------------------------------------------------------------------------------
[![V]][VE060] [![2024-12-24 19:00]][VE060]  

[2024-12-24 19:00]: https://img.shields.io/static/v1?label=2024-12-22&message=19:00&color=yellowgreen
[VE060]: changelog.md#-v060-dev

|    дата    | время |     ветка     | статус |  
|:----------:|:-----:|:-------------:|:------:|  
| 2024-12-24 | 18:50 | [#60-dev-dir] | DONE   |  
| 2024-12-24 | 11:00 | [#60-dev-dir] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`          060  
   - upd: `changelog.md`      060  
   - upd: `history.md`        060  
   - upd: `chrono.md`         060  
   - upd: `docs.md`           060  
2. add: `docs/docs`  
   - add: `dir.md`            001  
3. add: `docs/docs/dir`  
   - add: `delete.md`         001  
   - add: `empty.md`          001  
   - add: `make.md`           001  
   - add: `move.md`           001  
4. upd: `test`  
   - upd: `test.ver`          054  
5. add: `test/dir`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
6. add: `test/dir/sources`  
   - add: `struct.txt`        001  
   - add: `move.vbs`          001  
   - add: `move.except.vbs`   001  
   - add: `make.vbs`          001  
   - add: `make.except.vbs`   001  
   - add: `empty.vbs`         001  
   - add: `empty.except.vbs`  001  
   - add: `delete.vbs`        001  
7. upd: `vbs`  
   - upd: `vbs.ver`           042  
8. add: `vbs/dir`  
   - add: `move.vbs`          001  
   - add: `make.vbs`          001  
   - add: `empty.vbs`         001  
   - add: `delete.vbs`        001  
9. upd: `project.root`        060  

[#60-dev-dir]: tasks/2024-12-24-0060-dev-dir.md
<div/>


[![S]][H] **v0.5.9 (dev)**
--------------------------------------------------------------------------------
[![V]][VE059] [![2024-12-22 08:50]][VE059]  

[2024-12-22 08:50]: https://img.shields.io/static/v1?label=2024-12-22&message=08:50&color=yellowgreen
[VE059]: changelog.md#-v059-dev

|    дата    | время |      ветка      | статус |  
|:----------:|:-----:|:---------------:|:------:|  
| 2024-12-22 | 08:40 | [#59-dev-7zrun] | DONE   |  
| 2024-12-18 | 22:50 | [#59-dev-7zrun] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`        059  
   - upd: `changelog.md`    059  
   - upd: `history.md`      059  
   - upd: `chrono.md`       059  
   - upd: `docs.md`         059  
2. add: `docs/docs/ready`  
   - add: `7zrun.md`        001  
3. add: `ready`  
   - add: `7zrun.bat`       001  
4. add: `dev/7zrun`  
   - add: `make.bat`        001  
   - add: `test-[wsf].bat`  001  
   - add: `test-[vbs].bat`  001  
5. add: `dev/7zrun/sources`  
   - add: `7zrun.vbs`       001  
   - add: `stamp.vbs`       001  
   - add: `settings.vbs`    001  
   - add: `cversion.vbs`    001  
   - add: `c7zip.vbs`       001  
   - add: `cmask.vbs`       001  
   - add: `struct.txt`      001  
6. upd: `project.root`      059  

[#59-dev-7zrun]: tasks/2024-12-18-0059-dev-7zrun.md
<div/>


[![S]][H] **v0.5.8 (dev)**
--------------------------------------------------------------------------------
[![V]][VE058] [![2024-11-16 12:40]][VE058]  

[2024-11-16 12:40]: https://img.shields.io/static/v1?label=2024-11-16&message=12:40&color=yellowgreen
[VE058]: changelog.md#-v058-dev

|    дата    | время |       ветка       | статус |  
|:----------:|:-----:|:-----------------:|:------:|  
| 2024-11-16 | 14:30 | [#58-dev-tooltip] | DONE   |  
| 2024-11-15 | 22:50 | [#58-dev-tooltip] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`        058  
   - upd: `changelog.md`    058  
   - upd: `chrono.md`       058  
   - upd: `history.md`      058  
   - upd: `docs.md`         058  
2. add: `docs/docs/ready`  
   - add: `tooltip.md`      001  
3. add: `ready`  
   - add: `tooltip.bat`     001  
4. add: `dev/tooltip`  
   - add: `make.bat`        001  
   - add: `test-[wsf].bat`  001  
   - add: `test-[vbs].bat`  001  
5. add: `dev/tooltip/sources`  
   - add: `tooltip.vbs`     001  
   - add: `struct.txt`      001  
6. add: `dev/tooltip/resources`  
   - add: `tooltip.md`  
7. add: `dev/tooltip/resources/img`  
   - add: `plant.jpg`  
   - add: `magnoliophyta.jpg`  
   - add: `eukaryota.jpg`  
   - add: `dicotyledones.jpg`  
   - add: `caryophyllales.jpg`  
   - add: `aizoaceae.jpg`  
   - add: `эукариоты.jpg`  
8. add: `dev/tooltip/resources`  
   - add: `class-11_1.png`  
   - add: `класс-21_1.png`  
   - add: `class-1.html`  
   - add: `класс-2.html`  
9. upd: `project.root`      058  

[#58-dev-tooltip]: tasks/2024-11-15-0058-dev-tooltip.md
<div/>


[![S]][H] **v0.5.7 (dev)**
--------------------------------------------------------------------------------
[![V]][VE057] [![2024-11-08 07:00]][VE057]  

[2024-11-08 07:00]: https://img.shields.io/static/v1?label=2024-11-08&message=07:00&color=yellowgreen
[VE057]: changelog.md#-v057-dev

|    дата    | время |       ветка       | статус |  
|:----------:|:-----:|:-----------------:|:------:|  
| 2024-11-08 | 06:50 | [#57-dev-yedcont] | DONE   |  
| 2024-11-08 | 02:00 | [#57-dev-yedcont] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`        057  
   - upd: `changelog.md`    057  
   - upd: `history.md`      057  
   - upd: `chrono.md`       057  
   - upd: `docs.md`         057  
2. add: `docs/docs/ready`  
   - add: `yedcont.md`      001  
3. add: `ready`  
   - add: `yedcont.bat`     001  
4. add: `dev/yedcont`  
   - add: `make.bat`        001  
   - add: `test-[wsf].bat`  001  
   - add: `test-[vbs].bat`  001  
5. add: `dev/yedcont/sources`  
   - add: `yedcont.vbs`     001  
   - add: `struct.txt`      001  
6. add: `dev/yedcont/resources`  
   - add: `index.graphml`  
7. upd: `project.root`       057  

[#57-dev-yedcont]: tasks/2024-11-08-0057-dev-yedcont.md
<div/>


[![S]][H] **v0.5.6 (dev)**
--------------------------------------------------------------------------------
[![V]][VE056] [![2024-10-10 19:00]][VE056]  

[2024-10-10 19:00]: https://img.shields.io/static/v1?label=2024-10-10&message=19:00&color=yellowgreen
[VE056]: changelog.md#-v056-dev

|    дата    | время |       ветка       | статус |  
|:----------:|:-----:|:-----------------:|:------:|  
| 2024-10-10 | 18:50 | [#56-dev-include] | DONE   |  
| 2024-10-10 | 11:00 | [#56-dev-include] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`        056  
   - upd: `history.md`      056  
   - upd: `changelog.md`    056  
   - upd: `chrono.md`       056  
   - upd: `docs.md`         056  
2. add: `docs/docs`  
   - add: `include.md`      013  
3. upd: `test`  
   - upd: `test.ver`        053  
4. add: `test/include`  
   - add: `make.bat`        001  
   - add: `test-[wsf].bat`  001  
   - add: `test-[vbs].bat`  001  
5. add: `test/include/sources`  
   - add: `struct.txt`      001  
   - add: `double.vbs`      001  
   - add: `main.vbs`        001  
6. upd: `vbs`  
   - upd: `vbs.ver`         041  
   - add: `include.vbs`     013  
7. upd: `project.root`      056  

[#56-dev-include]: tasks/2024-10-10-0056-dev-include.md
<div/>


[![S]][H] **v0.5.5 (dev)**
--------------------------------------------------------------------------------
[![V]][VE055] [![2024-09-30 19:00]][VE055]  

[2024-09-30 19:00]: https://img.shields.io/static/v1?label=2024-09-30&message=19:00&color=yellowgreen
[VE055]: changelog.md#-v055-dev

|    дата    | время |     ветка     | статус |  
|:----------:|:-----:|:-------------:|:------:|  
| 2024-09-30 | 18:50 | [#55-dev-env] | DONE   |  
| 2024-09-29 | 11:00 | [#55-dev-env] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`         055  
   - upd: `changelog.md`     055  
   - upd: `history.md`       055  
   - upd: `chrono.md`        055  
   - upd: `docs.md`          055  
2. add: `docs/docs`  
   - add: `environment.md`   001  
3. upd: `test`  
   - upd: `test.ver`         052  
4. add: `test/environment`  
   - add: `make.bat`         001  
   - add: `test-[vbs].bat`   001  
   - add: `test-[wsf].bat`   001  
5. add: `test/environment/sources`  
   - add: `array.vbs`        001  
   - add: `string.vbs`       001  
   - add: `struct.txt`       001  
6. upd: `vbs`  
   - upd: `vbs.ver`          040  
   - add: `environment.vbs`  001  
7. add: `vbs/env`  
   - add: `string.vbs`       001  
   - add: `array.vbs`        001  
8. upd: `project.root`       055  

[#55-dev-env]: tasks/2024-09-29-0055-dev-env.md
<div/>


[![S]][H] **v0.5.4 (dev)**
--------------------------------------------------------------------------------
[![V]][VE054] [![2024-09-28 19:00]][VE054]  

[2024-09-28 19:00]: https://img.shields.io/static/v1?label=2024-09-28&message=19:00&color=yellowgreen
[VE054]: changelog.md#-v054-dev

|    дата    | время |      ветка      | статус |  
|:----------:|:-----:|:---------------:|:------:|  
| 2024-09-28 | 18:50 | [#54-dev-pushd] | DONE   |  
| 2024-09-27 | 11:00 | [#54-dev-pushd] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`        054  
   - upd: `changelog.md`    054  
   - upd: `chrono.md`       054  
   - upd: `history.md`      054  
   - upd: `docs.md`         054  
2. add: `docs/docs`  
   - add: `pushd.md`        001  
3. upd: `test`  
   - upd: `test.ver`        051  
4. add: `test/pushd`  
   - add: `make.bat`        001  
   - add: `test-[wsf].bat`  001  
   - add: `test-[vbs].bat`  001  
5. add: `test/pushd/sources`  
   - add: `test.wsf`        001  
   - add: `main.vbs`        001  
6. add: `test/pushd/sources/111`  
   - add: `222/333/333.txt`  
   - add: `222/222.txt`  
   - add: `111.txt`  
7. upd: `vbs`  
   - upd: `vbs.ver`         039  
   - add: `pushd.vbs`       001  
8. upd: `project.root`      054  

[#54-dev-pushd]: tasks/2024-09-26-0054-dev-pushd.md
<div/>


[![S]][H] **v0.5.3 (dev)**
--------------------------------------------------------------------------------
[![V]][VE053] [![2024-09-26 19:00]][VE053]  

[2024-09-26 19:00]: https://img.shields.io/static/v1?label=2024-09-26&message=19:00&color=yellowgreen
[VE053]: changelog.md#-v053-dev

|    дата    | время |     ветка      | статус |  
|:----------:|:-----:|:--------------:|:------:|  
| 2024-09-26 | 18:50 | [#53-dev-date] | DONE   |  
| 2024-09-25 | 11:00 | [#53-dev-date] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`        053  
   - upd: `changelog.md`    053  
   - upd: `history.md`      053  
   - upd: `chrono.md`       053  
   - upd: `docs.md`         053  
2. upd: `docs/docs`  
   - upd: `date.md`         002  
3. add: `docs/docs/date`  
   - add: `elapsed.md`      001  
4. upd: `test`  
   - upd: `test.ver`        050  
5. add: `test/date/elapsed`  
   - add: `make.bat`        001  
   - add: `test-[wsf].bat`  001  
   - add: `test-[vbs].bat`  001  
6. add: `test/date/elapsed/sources`  
   - add: `struct.txt`      001  
   - add: `main.vbs`        001  
7. upd: `vbs`  
   - upd: `vbs.ver`         038  
8. add: `vbs/date`  
   - add: `elapsed.vbs`     001  
9. upd: `project.root`      053  

[#53-dev-date]: tasks/2024-09-25-0053-dev-date.md
<div/>


[![S]][H] **v0.5.2 (dev)**
--------------------------------------------------------------------------------
[![V]][VE052] [![2024-09-24 19:00]][VE052]  

[2024-09-24 19:00]: https://img.shields.io/static/v1?label=2024-09-24&message=19:00&color=yellowgreen
[VE052]: changelog.md#-v052-dev

|    дата    | время |     ветка      | статус |  
|:----------:|:-----:|:--------------:|:------:|  
| 2024-09-24 | 18:50 | [#52-dev-date] | DONE   |  
| 2024-09-23 | 11:00 | [#52-dev-date] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`        052  
   - upd: `changelog.md`    052  
   - upd: `history.md`      052  
   - upd: `chrono.md`       052  
   - upd: `docs.md`         052  
2. upd: `docs/docs`  
   - upd: `date.md`         002  
3. add: `docs/docs/date`  
   - add: `datestamp.md`    001  
4. upd: `test`  
   - upd: `test.ver`        049  
5. add: `test/date/datestamp`  
   - add: `make.bat`        001  
   - add: `test-[vbs].bat`  001  
   - add: `test-[wsf].bat`  001  
6. add: `test/date/datestamp/sources`  
   - add: `struct.txt`      001  
   - add: `main.vbs`        001  
7. upd: `vbs`  
   - upd: `vbs.ver`         037  
8. add: `vbs/date`  
   - add: `datestamp.vbs`   001  
9. upd: `project.root`      052  

[#52-dev-date]: tasks/2024-09-23-0052-dev-date.md
<div/>


[![S]][H] **v0.5.1 (dev)**
--------------------------------------------------------------------------------
[![V]][VE051] [![2024-09-22 19:00]][VE051]  

[2024-09-22 19:00]: https://img.shields.io/static/v1?label=2024-09-22&message=19:00&color=yellowgreen
[VE051]: changelog.md#-v051-dev

|    дата    | время |     ветка      | статус |  
|:----------:|:-----:|:--------------:|:------:|  
| 2024-09-22 | 18:50 | [#51-dev-date] | DONE   |  
| 2024-09-21 | 11:00 | [#51-dev-date] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`        051  
   - upd: `changelog.md`    051  
   - upd: `history.md`      051  
   - upd: `chrono.md`       051  
   - upd: `docs.md`         051  
2. upd: `docs/docs`  
   - upd: `date.md`         002  
3. add: `docs/docs/date`  
   - add: `point.md`        001  
4. upd: `test`  
   - upd: `test.ver`        048  
5. add: `test/date/point`  
   - add: `make.bat`        001  
   - add: `test-[wsf].bat`  001  
   - add: `test-[vbs].bat`  001  
6. add: `test/date/point/sources`  
   - add: `struct.txt`      001  
   - add: `main.vbs`        001  
7. upd: `vbs`  
   - upd: `vbs.ver`         036  
8. add: `vbs/date`  
   - add: `point.vbs`       001  
9. upd: `project.root`      051  

[#51-dev-date]: tasks/2024-09-21-0051-dev-date.md
<div/>


[![S]][H] **v0.5.0 (dev)**
--------------------------------------------------------------------------------
[![V]][VE050] [![2024-09-20 19:00]][VE050]  

[2024-09-20 19:00]: https://img.shields.io/static/v1?label=2024-09-20&message=19:00&color=yellowgreen
[VE050]: changelog.md#-v050-dev

|    дата    | время |     ветка      | статус |  
|:----------:|:-----:|:--------------:|:------:|  
| 2024-09-20 | 18:50 | [#50-dev-date] | DONE   |  
| 2024-09-18 | 11:00 | [#50-dev-date] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`                 050  
   - upd: `changelog.md`             050  
   - upd: `history.md`               050  
   - upd: `chrono.md`                050  
   - upd: `docs.md`                  050  
2. upd: `docs/docs`  
   - upd: `date.md`                  002  
3. add: `docs/docs/date`  
   - add: `duration.md`              002  
4. upd: `test`  
   - upd: `test.ver`                 047  
5. add: `test/date/duration`  
   - add: `make.bat`                 001  
   - add: `test-[vbs].bat`           001  
   - add: `test-[wsf].bat`           001  
6. add: `test/date/duration/sources`  
   - add: `struct.txt`               001  
   - add: `durationFromSeconds.vbs`  001  
   - add: `durationFromMS.vbs`       001  
   - add: `durationFrom.vbs`         001  
7. upd: `vbs`  
   - upd: `vbs.ver`                  035  
8. add: `vbs/date`  
   - add: `duration.vbs`             002  
9. upd: `project.root`               050  

[#50-dev-date]: tasks/2024-09-18-0050-dev-date.md
<div/>


[![S]][H] **v0.4.9 (dev)**
--------------------------------------------------------------------------------
[![V]][VE049] [![2024-09-17 19:00]][VE049]  

[2024-09-17 19:00]: https://img.shields.io/static/v1?label=2024-09-17&message=19:00&color=yellowgreen
[VE049]: changelog.md#-v049-dev

|    дата    | время |     ветка      | статус |  
|:----------:|:-----:|:--------------:|:------:|  
| 2024-09-14 | 18:50 | [#49-dev-date] | DONE   |  
| 2024-09-10 | 11:00 | [#49-dev-date] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`           049  
   - upd: `changelog.md`       049  
   - upd: `history.md`         049  
   - upd: `chrono.md`          049  
   - upd: `docs.md`            049  
2. upd: `docs/docs`  
   - upd: `date.md`            002  
3. add: `docs/docs/date`  
   - add: `range.md`           005  
4. upd: `test`  
   - upd: `test.ver`           046  
5. add: `test/date/range`  
   - add: `make.bat`           001  
   - add: `test-[vbs].bat`     001  
   - add: `test-[wsf].bat`     001  
6. add: `test/date/range/sources`  
   - add: `struct.txt`         001  
   - add: `main.vbs`           002  
   - add: `except.vbs`         001  
   - add: `type.assert-1.vbs`  001  
   - add: `type.assert-2.vbs`  001  
   - add: `type.assert-3.vbs`  001  
   - add: `type.assert-4.vbs`  001  
7. upd: `vbs`  
   - upd: `vbs.ver`            034  
8. add: `vbs/date`  
   - add: `range.vbs`          003  
9. upd: `project.root`         049  

[#49-dev-date]: tasks/2024-09-15-0049-dev-date.md
<div/>


[![S]][H] **v0.4.8 (tst)**
--------------------------------------------------------------------------------
[![V]][VE048] [![2024-09-14 19:00]][VE048]  

[2024-09-14 19:00]: https://img.shields.io/static/v1?label=2024-09-14&message=19:00&color=yellowgreen
[VE048]: changelog.md#-v048-tst

|    дата    | время |     ветка      | статус |  
|:----------:|:-----:|:--------------:|:------:|  
| 2024-09-14 | 18:50 | [#48-tst-date] | DONE   |  
| 2024-09-10 | 11:00 | [#48-tst-date] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`             048  
   - upd: `changelog.md`         048  
   - upd: `history.md`           048  
   - upd: `chrono.md`            048  
   - upd: `docs.md`              048  
2. upd: `docs/docs`  
   - upd: `date.md`              002  
3. upd: `docs/docs/date`  
   - upd: `stamp.md`             005  
4. upd: `test`  
   - upd: `test.ver`             045  
5. add: `test/date/DTStamp/sources`  
   - add: `workspace.vbs`        005  
   - add: `value.vbs`            005  
   - add: `usage.vbs`            005  
   - add: `stamp.vbs`            005  
   - add: `posix.vbs`            005  
   - add: `output.vbs`           005  
   - add: `now.vbs`              005  
   - add: `import.vbs`           005  
   - add: `import.except.vbs`    005  
   - add: `getters.vbs`          005  
   - add: `export.vbs`           005  
   - add: `addSeconds.vbs`       005  
   - add: `addMilliseconds.vbs`  005  
6. upd: `project.root`           048  

[#48-tst-date]: tasks/2024-09-10-0048-tst-date.md
<div/>


[![S]][H] **v0.4.7 (dev)**
--------------------------------------------------------------------------------
[![V]][VE047] [![2024-09-09 19:00]][VE047]  

[2024-09-09 19:00]: https://img.shields.io/static/v1?label=2024-09-09&message=19:00&color=yellowgreen
[VE047]: changelog.md#-v047-dev

|    дата    | время |     ветка      | статус |  
|:----------:|:-----:|:--------------:|:------:|  
| 2024-09-09 | 18:50 | [#47-dev-date] | DONE   |  
| 2024-09-04 | 11:00 | [#47-dev-date] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`                047  
   - upd: `changelog.md`            047  
   - upd: `history.md`              047  
   - upd: `chrono.md`               047  
   - upd: `docs.md`                 047  
2. upd: `docs/docs`  
   - upd: `date.md`                 002  
3. add: `docs/docs/date`  
   - add: `stamp.md`                005  
4. upd: `test`  
   - upd: `test.ver`                044  
5. add: `test/date/DTStamp`  
   - add: `make.bat`                001  
   - add: `test-[vbs].bat`          001  
   - add: `test-[wsf].bat`          001  
6. add: `test/date/DTStamp/sources`  
   - add: `struct.txt`              001  
   - add: `ctor.type.assert-3.vbs`  001  
   - add: `ctor.type.assert-2.vbs`  001  
   - add: `ctor.type.assert-1.vbs`  001  
   - add: `ctor.time.vbs`           001  
   - add: `ctor.string.vbs`         001  
   - add: `ctor.string.except.vbs`  005  
   - add: `ctor.posix.vbs`          001  
   - add: `ctor.nothing.vbs`        001  
   - add: `ctor.import.vbs`         001  
   - add: `ctor.export.vbs`         001  
   - add: `ctor.def.vbs`            005  
   - add: `ctor.date.vbs`           001  
   - add: `ctor.arg.vbs`            005  
   - add: `clone.vbs`               005  
7. upd: `vbs`  
   - upd: `vbs.ver`                 033  
8. add: `vbs/date`  
   - add: `stamp.vbs`               005  
9. upd: `project.root`              047  

[#47-dev-date]: tasks/2024-09-04-0047-dev-date.md
<div/>


[![S]][H] **v0.4.6 (dev)**
--------------------------------------------------------------------------------
[![V]][VE046] [![2024-09-03 19:00]][VE046]  

[2024-09-03 19:00]: https://img.shields.io/static/v1?label=2024-09-03&message=19:00&color=yellowgreen
[VE046]: changelog.md#-v046-dev

|    дата    | время |     ветка      | статус |  
|:----------:|:-----:|:--------------:|:------:|  
| 2024-09-03 | 18:50 | [#46-dev-date] | DONE   |  
| 2024-08-30 | 11:00 | [#46-dev-date] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`             046  
   - upd: `changelog.md`         046  
   - upd: `history.md`           046  
   - upd: `chrono.md`            046  
   - upd: `docs.md`              046  
2. upd: `docs/docs`  
   - upd: `date.md`              002  
3. add: `docs/docs/date`  
   - add: `export.md`            005  
4. upd: `test`  
   - upd: `test.ver`             043  
5. add: `test/date/DTSExport`  
   - add: `make.bat`             001  
   - add: `test-[wsf].bat`       001  
   - add: `test-[vbs].bat`       001  
6. add: `test/date/DTSExport/sources`
   - add: `struct.txt`           001  
   - add: `stamp.vbs`            005  
   - add: `stamp.assert.5.vbs`   005  
   - add: `stamp.assert.4.vbs`   005  
   - add: `stamp.assert.3.vbs`   005  
   - add: `stamp.assert.2.vbs`   005  
   - add: `stamp.assert.1.vbs`   005  
   - add: `format.vbs`           005  
   - add: `format.assert.5.vbs`  005  
   - add: `format.assert.4.vbs`  005  
   - add: `format.assert.3.vbs`  005  
   - add: `format.assert.2.vbs`  005  
   - add: `format.assert.1.vbs`  005  
   - add: `ctor.vbs`             005  
   - add: `ctor.assert.5.vbs`    005  
   - add: `ctor.assert.4.vbs`    005  
   - add: `ctor.assert.3.vbs`    005  
   - add: `ctor.assert.2.vbs`    005  
   - add: `ctor.assert.1.vbs`    005  
   - add: `clone.vbs`            005  
7. upd: `vbs`  
   - upd: `vbs.ver`              032  
8. add: `vbs/date`  
   - add: `export.vbs`           005  
9. upd: `project.root`           046  

[#46-dev-date]: tasks/2024-08-30-0046-dev-date.md
<div/>


[![S]][H] **v0.4.5 (dev)**
--------------------------------------------------------------------------------
[![V]][VE045] [![2024-08-29 19:00]][VE045]  

[2024-08-29 19:00]: https://img.shields.io/static/v1?label=2024-08-29&message=19:00&color=yellowgreen
[VE045]: changelog.md#-v045-dev

|    дата    | время |     ветка      | статус |  
|:----------:|:-----:|:--------------:|:------:|  
| 2024-08-29 | 18:50 | [#45-dev-date] | DONE   |  
| 2024-08-25 | 11:00 | [#45-dev-date] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`             045  
   - upd: `changelog.md`         045  
   - upd: `history.md`           045  
   - upd: `chrono.md`            045  
   - upd: `docs.md`              045  
2. upd: `docs/docs`  
   - upd: `date.md`              002  
3. add: `docs/docs/date`  
   - add: `import.md`            005  
4. upd: `test`  
   - upd: `test.ver`             042  
5. add: `test/date/DTSImport`  
   - add: `test-[wsf].bat`       001  
   - add: `test-[vbs].bat`       001  
   - add: `make.bat`             001  
6. add: `test/date/DTSImport/sources`  
   - add: `struct.txt`           001  
   - add: `parse.vbs`            005  
   - add: `parse.except.3.vbs`   005  
   - add: `parse.except.2.vbs`   005  
   - add: `parse.except.1.vbs`   005  
   - add: `format.vbs`           005  
   - add: `format.except.1.vbs`  005  
   - add: `format.assert.5.vbs`  005  
   - add: `format.assert.4.vbs`  005  
   - add: `format.assert.3.vbs`  005  
   - add: `format.assert.2.vbs`  005  
   - add: `format.assert.1.vbs`  005  
   - add: `ctor.vbs`             005  
   - add: `ctor.assert.5.vbs`    005  
   - add: `ctor.assert.4.vbs`    005  
   - add: `ctor.assert.3.vbs`    005  
   - add: `ctor.assert.2.vbs`    005  
   - add: `ctor.assert.1.vbs`    005  
   - add: `clone.vbs`            005  
7. upd: `vbs`  
   - upd: `vbs.ver`              031  
8. add: `vbs/date`  
   - add: `import.vbs`           005  
9. upd: `project.root`           045  

[#45-dev-date]: tasks/2024-08-25-0045-dev-date.md
<div/>


[![S]][H] **v0.4.4 (tst)**
--------------------------------------------------------------------------------
[![V]][VE044] [![2024-08-24 19:00]][VE044]  

[2024-08-24 19:00]: https://img.shields.io/static/v1?label=2024-08-24&message=19:00&color=yellowgreen
[VE044]: changelog.md#-v044-tst

|    дата    | время |     ветка      | статус |  
|:----------:|:-----:|:--------------:|:------:|  
| 2024-08-24 | 18:50 | [#44-tst-date] | DONE   |  
| 2024-08-21 | 11:00 | [#44-tst-date] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`        044  
   - upd: `changelog.md`    044  
   - upd: `history.md`      044  
   - fix: `chrono.md`       044  
   - upd: `docs.md`         044  
2. upd: `docs/docs`  
   - upd: `date.md`         002  
3. upd: `docs/docs/date`  
   - upd: `value.md`        002  
4. upd: `test`  
   - upd: `test.ver`        041  
5. add: `test/date/DTSValue`  
   - add: `assert-01.vbs`   001  
   - add: `assert-02.vbs`   001  
   - add: `assert-03.vbs`   001  
   - add: `assert-04.vbs`   001  
   - add: `assert-05.vbs`   001  
   - add: `assert-06.vbs`   001  
   - add: `assert-07.vbs`   001  
   - add: `assert-08.vbs`   001  
   - add: `assert-09.vbs`   001  
   - add: `assert-10.vbs`   001  
   - add: `assert-11.vbs`   001  
   - add: `assert-12.vbs`   001  
   - add: `assert-13.vbs`   001  
   - add: `assert-14.vbs`   001  
   - add: `assert-15.vbs`   001  
   - add: `assert-16.vbs`   001  
   - add: `assert-17.vbs`   001  
   - add: `assert-18.vbs`   001  
   - add: `assert-19.vbs`   001  
   - add: `assert-20.vbs`   001  
   - add: `assert-21.vbs`   001  
   - add: `assert-22.vbs`   001  
   - add: `assert-23.vbs`   001  
   - add: `assert-24.vbs`   001  
6. upd: `project.root`      044  

[#44-tst-date]: tasks/2024-08-21-0044-tst-date.md
<div/>


[![S]][H] **v0.4.3 (tst)**
--------------------------------------------------------------------------------
[![V]][VE043] [![2024-08-20 19:00]][VE043]  

[2024-08-20 19:00]: https://img.shields.io/static/v1?label=2024-08-20&message=19:00&color=yellowgreen
[VE043]: changelog.md#-v043-tst

|    дата    | время |     ветка      | статус |  
|:----------:|:-----:|:--------------:|:------:|  
| 2024-08-20 | 18:50 | [#43-tst-date] | DONE   |  
| 2024-08-15 | 11:00 | [#43-tst-date] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`        043  
   - upd: `changelog.md`    043  
   - upd: `history.md`      043  
   - upd: `chrono.md`       043  
   - upd: `docs.md`         043  
2. upd: `docs/docs`  
   - upd: `date.md`         001  
3. upd: `docs/docs/date`  
   - upd: `value.md`        001  
4. upd: `test`  
   - upd: `test.ver`        040  
5. add: `test/date/DTSValue/sources`  
   - add: `getters.vbs`     001  
   - add: `output.vbs`      001  
   - add: `posix.vbs`       001  
   - add: `now.vbs`         001  
   - add: `ms.vbs`          001  
6. upd: `project.root`      043  

[#43-tst-date]: tasks/2024-08-15-0043-tst-date.md
<div/>


[![S]][H] **v0.4.2 (tst)**
--------------------------------------------------------------------------------
[![V]][VE042] [![2024-08-14 19:00]][VE042]  

[2024-08-14 19:00]: https://img.shields.io/static/v1?label=2024-08-14&message=19:00&color=yellowgreen
[VE042]: changelog.md#-v042-tst

|    дата    | время |     ветка      | статус |  
|:----------:|:-----:|:--------------:|:------:|  
| 2024-08-14 | 18:50 | [#42-tst-date] | DONE   |  
| 2024-08-09 | 11:00 | [#42-tst-date] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`           042  
   - upd: `changelog.md`       042  
   - upd: `history.md`         042  
   - upd: `chrono.md`          042  
   - upd: `docs.md`            042  
2. upd: `docs/docs`  
   - upd: `date.md`            001  
3. upd: `docs/docs/date`  
   - upd: `value.md`           001  
4. upd: `test`  
   - upd: `test.ver`           039  
5. add: `test/date/DTSValue/sources`  
   - add: `date.string.vbs`    001  
   - add: `date.time.vbs`      001  
   - add: `date.posix.vbs`     001  
   - add: `date-assert-1.vbs`  001  
   - add: `date.assert-2.vbs`  001  
   - add: `date.assert-3.vbs`  001  
6. upd: `project.root`         042  

[#42-tst-date]: tasks/2024-08-09-0042-tst-date.md
<div/>


[![S]][H] **v0.4.1 (tst)**
--------------------------------------------------------------------------------
[![V]][VE041] [![2024-08-08 19:00]][VE041]  

[2024-08-08 19:00]: https://img.shields.io/static/v1?label=2024-08-08&message=19:00&color=yellowgreen
[VE041]: changelog.md#-v041-tst

|    дата    | время |     ветка      | статус |  
|:----------:|:-----:|:--------------:|:------:|  
| 2024-08-08 | 18:50 | [#41-tst-date] | DONE   |  
| 2024-08-02 | 11:00 | [#41-tst-date] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`              041  
   - upd: `changelog.md`          041  
   - upd: `history.md`            041  
   - upd: `chrono.md`             041  
   - upd: `docs.md`               041  
2. upd: `docs/docs`  
   - upd: `date.md`               001  
3. upd: `docs/docs/date`  
   - upd: `value.md`              001  
4. upd: `test`  
   - upd: `test.ver`              038  
5. add: `test/date/DTSValue/sources`  
   - add: `ctor.value.vbs`        001  
   - add: `ctor.stamp.vbs`        001  
   - add: `ctor.posix.vbs`        001  
   - add: `ctor.ms.vbs`           001  
   - add: `ctor.ms.assert-1.vbs`  001  
   - add: `ctor.ms.assert-2.vbs`  001  
   - add: `clone.vbs`             001  
   - add: `addSeconds.vbs`        001  
6. upd: `project.root`            041  

[#41-tst-date]: tasks/2024-08-02-0041-tst-date.md
<div/>


[![S]][H] **v0.4.0 (dev)**
--------------------------------------------------------------------------------
[![V]][VE040] [![2024-08-01 19:00]][VE040]  

[2024-08-01 19:00]: https://img.shields.io/static/v1?label=2024-08-01&message=19:00&color=yellowgreen
[VE040]: changelog.md#-v040-dev

|    дата    | время |     ветка      | статус |  
|:----------:|:-----:|:--------------:|:------:|  
| 2024-08-01 | 18:50 | [#40-dev-date] | DONE   |  
| 2024-07-27 | 11:00 | [#40-dev-date] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`           040  
   - upd: `changelog.md`       040  
   - upd: `history.md`         040  
   - upd: `chrono.md`          040  
   - upd: `docs.md`            040  
2. add: `docs/docs`  
   - add: `date.md`            002  
3. add: `docs/docs/date`  
   - add: `value.md`           002  
4. upd: `test`  
   - upd: `test.ver`           037  
5. add: `test/date/DTSValue`  
   - add: `make.bat`           001  
   - add: `test-[vbs].bat`     001  
   - add: `test-[wsf].bat`     001  
6. add: `test/date/DTSValue/sources`  
   - add: `ctor.def.vbs`       001  
   - add: `ctor.string.vbs`    001  
   - add: `ctor.date.vbs`      001  
   - add: `ctor.time.vbs`      001  
   - add: `ctor.assert-1.vbs`  001  
   - add: `ctor.assert-2.vbs`  001  
   - add: `ctor.assert-3.vbs`  001  
   - add: `struct.txt`         001  
7. upd: `vbs`  
   - upd: `Vbs.ver`            030  
8. add: `vbs/date`  
   - add: `value.vbs`          002  
9. upd: `project.root`         040  

[#40-dev-date]: tasks/2024-07-27-0040-dev-date.md
<div/>


[![S]][H] **v0.3.9 (dev)**
--------------------------------------------------------------------------------
[![V]][VE039] [![2024-07-26 19:00]][VE039]  

[2024-07-26 19:00]: https://img.shields.io/static/v1?label=2024-07-26&message=19:00&color=yellowgreen
[VE039]: changelog.md#-v039-dev

|    дата    | время |       ветка       | статус |  
|:----------:|:-----:|:-----------------:|:------:|  
| 2024-07-26 | 18:50 | [#39-dev-numeric] | DONE   |  
| 2024-07-25 | 11:00 | [#39-dev-numeric] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`        039  
   - upd: `changelog.md`    039  
   - upd: `history.md`      039  
   - upd: `chrono.md`       039  
   - upd: `docs.md`         039  
2. upd: `docs/docs`  
   - upd: `numeric.md`      002  
3. upd: `test`  
   - upd: `test.ver`        036  
4. upd: `test/numeric/sources`  
   - upd: `struct.txt`      002  
   - add: `check.vbs`       001  
5. upd: `vbs`  
   - upd: `vbs.ver`         029  
6. add: `vbs/numeric`  
   - add: `check.vbs`       001  
7. upd: `project.root`      039  

[#39-dev-numeric]: tasks/2024-07-24-0039-dev-numeric.md
<div/>


[![S]][H] **v0.3.8 (dev)**
--------------------------------------------------------------------------------
[![V]][VE038] [![2024-07-24 19:00]][VE038]  

[2024-07-24 19:00]: https://img.shields.io/static/v1?label=2024-07-24&message=19:00&color=yellowgreen
[VE038]: changelog.md#-v038-dev

|    дата    | время |       ветка       | статус |  
|:----------:|:-----:|:-----------------:|:------:|  
| 2024-07-24 | 18:50 | [#38-dev-numeric] | DONE   |  
| 2024-07-22 | 11:00 | [#38-dev-numeric] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`        038  
   - upd: `changelog.md`    038  
   - upd: `history.md`      038  
   - upd: `chrono.md`       038  
   - upd: `docs.md`         038  
2. add: `docs/docs`  
   - add: `numeric.md`      001  
3. upd: `test`  
   - upd: `test.ver`        035  
4. add: `test/numeric`  
   - add: `make.bat`        001  
   - add: `test-[vbs].bat`  001  
   - add: `test-[wsf].bat`  001  
5. add: `test/numeric/sources`  
   - add: `main.vbs`        001  
   - add: `assert-1.vbs`    001  
   - add: `assert-2.vbs`    001  
   - add: `struct.txt`      001  
6. upd: `vbs`  
   - upd: `vbs.ver`         028  
   - add: `numeric.vbs`     001  
7. upd: `project.root`      038  

[#38-dev-numeric]: tasks/2024-07-22-0038-dev-numeric.md
<div/>


[![S]][H] **v0.3.7 (tst)**
--------------------------------------------------------------------------------
[![V]][VE037] [![2024-04-23 19:00]][VE037]  

[2024-04-27 19:00]: https://img.shields.io/static/v1?label=2024-04-27&message=19:00&color=yellowgreen
[VE037]: changelog.md#-v037-tst

|    дата    | время |       ветка      | статус |  
|:----------:|:-----:|:----------------:|:------:|  
| 2024-04-27 | 18:50 | [#37-tst-toggle] | DONE   |  
| 2024-04-24 | 11:00 | [#37-tst-toggle] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`          037  
   - upd: `changelog.md`      037  
   - upd: `history.md`        037  
   - upd: `chrono.md`         037  
   - upd: `docs.md`           037  
   - upd: `docs/toggle.md`    001  
2. upd: `test`  
   - upd: `test.ver`          034  
3. add: `test/toggle/sources`  
   - add: `environment.vbs`   001  
   - add: `disabled.vbs`      001  
   - add: `enabled.vbs`       001  
4. upd: `project.root`        037  

[#37-tst-toggle]: tasks/2024-04-24-0037-tst-toggle.md
<div/>


[![S]][H] **v0.3.6 (tst)**
--------------------------------------------------------------------------------
[![V]][VE036] [![2024-04-23 19:00]][VE036]  

[2024-04-23 19:00]: https://img.shields.io/static/v1?label=2024-04-23&message=19:00&color=yellowgreen
[VE036]: changelog.md#-v036-tst

|    дата    | время |       ветка      | статус |  
|:----------:|:-----:|:----------------:|:------:|  
| 2024-04-23 | 18:50 | [#36-tst-toggle] | DONE   |  
| 2024-04-20 | 11:00 | [#36-tst-toggle] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`              036  
   - upd: `changelog.md`          036  
   - upd: `history.md`            036  
   - upd: `chrono.md`             036  
   - upd: `docs.md`               036  
   - upd: `docs/toggle.md`        001  
1. upd: `test`  
   - upd: `test.ver`              033  
2. add: `test/toggle/sources`  
   - add: `to_bool.vbs`           001  
   - add: `to_bool-assert-1.vbs`  001  
   - add: `to_bool-assert-2.vbs`  001  
   - add: `to_bool-assert-3.vbs`  001  
3. upd: `project.root`            036  

[#36-tst-toggle]: tasks/2024-04-20-0036-tst-toggle.md
<div/>


[![S]][H] **v0.3.5 (tst)**
--------------------------------------------------------------------------------
[![V]][VE035] [![2024-04-14 19:00]][VE035]  

[2024-04-19 19:00]: https://img.shields.io/static/v1?label=2024-04-19&message=19:00&color=yellowgreen
[VE035]: changelog.md#-v035-tst

|    дата    | время |       ветка      | статус |  
|:----------:|:-----:|:----------------:|:------:|  
| 2024-04-19 | 18:50 | [#35-tst-toggle] | DONE   |  
| 2024-04-15 | 11:00 | [#35-tst-toggle] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`                 035  
   - upd: `changelog.md`             035  
   - upd: `history.md`               035  
   - upd: `chrono.md`                035  
   - upd: `docs.md`                  035  
   - upd: `docs/toggle.md`           002  
2. upd: `test`  
   - upd: `test.ver`                 032  
3. add: `test/toggle`  
   - add: `make.bat`                 001  
   - add: `test-[vbs].bat`           001  
   - add: `test-[wsf].bat`           001  
3. add: `test/toggle/sources`  
   - add: `fromString.vbs`           001  
   - add: `fromString.assert-1.vbs`  001  
   - add: `fromString.assert-2.vbs`  001  
   - add: `fromString.assert-3.vbs`  001  
   - add: `fromString.assert-4.vbs`  001  
   - add: `fromString.assert-5.vbs`  001  
   - add: `fromString.assert-6.vbs`  001  
   - add: `fromString.assert-7.vbs`  001  
   - add: `struct.txt`               001  
4. upd: `project.root`               035  

[#35-tst-toggle]: tasks/2024-04-15-0035-tst-toggle.md
<div/>


[![S]][H] **v0.3.4 (dev)**
--------------------------------------------------------------------------------
[![V]][VE034] [![2024-04-14 19:00]][VE034]  

[2024-04-14 19:00]: https://img.shields.io/static/v1?label=2024-04-14&message=19:00&color=yellowgreen
[VE034]: changelog.md#-v034-dev

|    дата    | время |       ветка      | статус |  
|:----------:|:-----:|:----------------:|:------:|  
| 2024-04-14 | 18:50 | [#34-dev-toggle] | DONE   |  
| 2024-04-14 | 11:00 | [#34-dev-toggle] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`        034  
   - upd: `changelog.md`    034  
   - upd: `history.md`      034  
   - upd: `chrono.md`       034  
   - upd: `docs.md`         034  
   - add: `docs/toggle.md`  001  
2. upd: `vbs`  
   - upd: `vbs.ver`         027  
   - add: `toggle.vbs`      001  
3. upd: `project.root`      034  

[#34-dev-toggle]: tasks/2024-04-14-0034-dev-toggle.md
<div/>


[![S]][H] **v0.3.3 (dev)**
--------------------------------------------------------------------------------
[![V]][VE033] [![2024-04-13 19:00]][VE033]  

[2024-04-13 19:00]: https://img.shields.io/static/v1?label=2024-04-13&message=19:00&color=yellowgreen
[VE033]: changelog.md#-v033-dev

|    дата    | время |      ветка     | статус |  
|:----------:|:-----:|:--------------:|:------:|  
| 2024-04-13 | 18:50 | [#33-dev-tree] | DONE   |  
| 2024-04-12 | 11:00 | [#33-dev-tree] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`          033  
   - upd: `changelog.md`      033  
   - upd: `chrono.md`         033  
   - upd: `history.md`        033  
   - upd: `docs.md`           033  
2. add: `docs/docs/view`  
   - add: `tree_debug.md`     001  
3. upd: `test`  
   - upd: `test.ver`          030  
4. add: `test/view/tree_debug`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/test.wsf`  001  
   - add: `sources/main.vbs`  001  
5. upd: `vbs`  
   - upd: `vbs.ver`           026  
6. add: `vbs/view`  
   - add: `tree_debug.vbs`    001  
7. upd: `project.root`        033  

[#33-dev-tree]: tasks/2024-04-12-0033-dev-tree.md
<div/>


[![S]][H] **v0.3.2 (dev)**
--------------------------------------------------------------------------------
[![V]][VE032] [![2024-04-11 19:00]][VE032]  

[2024-04-11 19:00]: https://img.shields.io/static/v1?label=2024-04-11&message=19:00&color=yellowgreen
[VE032]: changelog.md#-v032-dev

|    дата    | время |      ветка     | статус |  
|:----------:|:-----:|:--------------:|:------:|  
| 2024-04-11 | 18:50 | [#32-dev-tree] | DONE   |  
| 2024-04-10 | 11:00 | [#32-dev-tree] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`          032  
   - upd: `changelog.md`      032  
   - upd: `chrono.md`         032  
   - upd: `history.md`        032  
   - upd: `docs.md`           032  
2. add: `docs/docs/view`  
   - add: `tree_empty.md`     001  
3. upd: `test`  
   - upd: `test.ver`          030  
4. add: `test/view/tree_empty`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/test.wsf`  001  
   - add: `sources/main.vbs`  001  
5. upd: `vbs`  
   - upd: `vbs.ver`           025  
6. add: `vbs/view`  
   - add: `tree_empty.vbs`    001  
7. upd: `project.root`        032  

[#32-dev-tree]: tasks/2024-04-10-0032-dev-tree.md
<div/>


[![S]][H] **v0.3.1 (dev)**
--------------------------------------------------------------------------------
[![V]][VE031] [![2024-04-09 19:00]][VE031]  

[2024-04-09 19:00]: https://img.shields.io/static/v1?label=2024-04-09&message=19:00&color=yellowgreen
[VE031]: changelog.md#-v031-dev

|    дата    | время |      ветка     | статус |  
|:----------:|:-----:|:--------------:|:------:|  
| 2024-04-09 | 18:50 | [#31-dev-tree] | DONE   |  
| 2024-04-08 | 11:00 | [#31-dev-tree] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`          031  
   - upd: `changelog.md`      031  
   - upd: `chrono.md`         031  
   - upd: `history.md`        031  
   - upd: `docs.md`           031  
2. add: `docs/docs/view`  
   - add: `tree_type.md`      001  
3. upd: `vbs`  
   - upd: `vbs.ver`           024  
4. add: `vbs/view`  
   - add: `tree_type.vbs`     001  
5. upd: `test`  
   - upd: `test.ver`          029  
6. add: `test/view/tree_type`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/test.wsf`  001  
   - add: `sources/main.vbs`  001  
7. upd: `project.root`        031  

[#31-dev-tree]: tasks/2024-04-08-0031-dev-tree.md
<div/>


[![S]][H] **v0.3.0 (dev)**
--------------------------------------------------------------------------------
[![V]][VE030] [![2024-04-07 19:00]][VE030]  

[2024-04-07 19:00]: https://img.shields.io/static/v1?label=2024-04-07&message=19:00&color=yellowgreen
[VE030]: changelog.md#-v030-dev

|    дата    | время |      ветка     | статус |  
|:----------:|:-----:|:--------------:|:------:|  
| 2024-04-07 | 18:50 | [#30-dev-tree] | DONE   |  
| 2024-04-06 | 11:00 | [#30-dev-tree] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`          030  
   - upd: `changelog.md`      030  
   - upd: `chrono.md`         030  
   - upd: `history.md`        030  
   - upd: `docs.md`           030  
2. add: `docs/docs/view`  
   - add: `tree_short.md`     001  
3. upd: `vbs`  
   - upd: `vbs.ver`           023  
4. add: `vbs/view`  
   - add: `tree_short.vbs`    001  
5. upd: `test`  
   - upd: `test.ver`          028  
6. add: `test/view/tree_short`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/test.wsf`  001  
   - add: `sources/main.vbs`  001  
7. upd: `project.root`        030  

[#30-dev-tree]: tasks/2024-04-06-0030-dev-tree.md
<div/>


[![S]][H] **v0.2.9 (dev)**
--------------------------------------------------------------------------------
[![V]][VE029] [![2024-04-05 23:50]][VE029]  

[2024-04-05 23:50]: https://img.shields.io/static/v1?label=2024-04-05&message=23:50&color=yellowgreen
[VE029]: changelog.md#-v029-dev

|    дата    | время |      ветка     | статус |  
|:----------:|:-----:|:--------------:|:------:|  
| 2024-04-05 | 23:40 | [#29-dev-tree] | DONE   |  
| 2024-04-03 | 11:30 | [#29-dev-tree] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`             029  
   - upd: `changelog.md`         029  
   - upd: `chrono.md`            029  
   - upd: `history.md`           029  
   - upd: `docs.md`              029  
2. add: `docs/docs/view`  
   - add: `tree.md`              001  
3. upd: `test`  
   - upd: `test.ver`             027  
4. add: `test/view/tree`  
   - add: `tree/make.bat`        001  
   - add: `tree/test-[vbs].bat`  001  
   - add: `tree/test-[wsf].bat`  001  
5. add: `test/view/tree/sources`  
   - add: `with_type.vbs`        001  
   - add: `with_empty.vbs`       001  
   - add: `typical.vbs`          001  
   - add: `type_empty.vbs`       001  
   - add: `struct.txt`           001  
8. upd: `vbs`  
   - upd: `vbs.ver`              022  
9. add: `vbs/view`  
   - add: `tree.vbs`             001  
10. upd: `project.root`          029  

[#29-dev-tree]: tasks/2024-04-03-0029-dev-tree.md
<div/>


[![S]][H] **v0.2.8 (dev)**
--------------------------------------------------------------------------------
[![V]][VE028] [![2024-04-02 08:30]][VE028]  

[2024-04-02 08:30]: https://img.shields.io/static/v1?label=2024-04-02&message=08:30&color=yellowgreen
[VE028]: changelog.md#-v028-dev

|    дата    | время |      ветка     | статус |  
|:----------:|:-----:|:--------------:|:------:|  
| 2024-04-02 | 08:20 | [#28-dev-echo] | DONE   |  
| 2024-04-02 | 06:30 | [#28-dev-echo] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`      028  
   - upd: `changelog.md`  028  
   - upd: `history.md`    028  
   - upd: `chrono.md`     028  
   - upd: `docs.md`       028  
   - upd: `docs/echo.md`  003  
2. upd: `vbs`  
   - upd: `vbs.ver`       021  
   - upd: `echo.vbs`      003  
3. upd: `project.root`    028  

[#28-dev-echo]: tasks/2024-04-02-0028-dev-echo.md
<div/>


[![S]][H] **v0.2.7 (dev)**
--------------------------------------------------------------------------------
[![V]][VE027] [![2024-04-02 06:10]][VE027]  

[2024-04-02 06:10]: https://img.shields.io/static/v1?label=2024-04-02&message=06:10&color=yellowgreen
[VE027]: changelog.md#-v027-dev

|    дата    | время |       ветка      | статус |  
|:----------:|:-----:|:----------------:|:------:|  
| 2024-04-02 | 06:00 | [#27-dev-traits] | DONE   |  
| 2024-04-02 | 04:40 | [#27-dev-traits] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`               027  
   - upd: `changelog.md`           027  
   - upd: `history.md`             027  
   - upd: `chrono.md`              027  
   - upd: `docs.md`                027  
   - add: `docs/traits.md`         001  
2. upd: `test`  
   - upd: `test.ver`               026  
3. add: `test/traits`  
   - add: `test-[vbs].bat`         001  
   - add: `test-[wsf].bat`         001  
   - add: `make.bat`               001  
4. add: `test/traits/sources`  
   - add: `boolean_to_string.vbs`  001  
   - add: `double_to_string.vbs`   001  
   - add: `has_method_count.vbs`   001  
   - add: `has_method_stamp.vbs`   001  
   - add: `is_empty_value.vbs`     001  
   - add: `struct.txt`             001  
5. upd: `vbs`  
   - upd: `vbs.ver`                020  
   - add: `traits.vbs`             001  
6. upd: `project.root`             027  

[#27-dev-traits]: tasks/2024-03-20-0026-dev-value.md
<div/>


[![S]][H] **v0.2.6 (dev)**
--------------------------------------------------------------------------------
[![V]][VE026] [![2024-03-20 13:00]][VE026]  

[2024-03-20 13:00]: https://img.shields.io/static/v1?label=2024-03-20&message=13:00&color=yellowgreen
[VE026]: changelog.md#-v026-dev

|    дата    | время |      ветка      | статус |  
|:----------:|:-----:|:---------------:|:------:|  
| 2024-03-20 | 12:50 | [#26-dev-value] | DONE   |  
| 2024-03-20 | 10:40 | [#26-dev-value] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`          026  
   - upd: `changelog.md`      026  
   - upd: `history.md`        026  
   - upd: `chrono.md`         026  
   - upd: `docs.md`           026  
   - add: `docs/value.md`     001  
2. upd: `vbs`  
   - upd: `vbs.ver`           019  
   - add: `value.vbs`         001  
3. upd: `test`  
   - upd: `test.ver`          025  
4. add: `test/value`  
   - add: `make.bat`          001  
   - add: `test-[vbs].bat`    001  
   - add: `test-[wsf].bat`    001  
5. add: `test/value/sources`  
   - add: `is_empty.vbs`      001  
   - add: `show_empty.vbs`    001  
   - add: `hide_empty.vbs`    001  
   - add: `struct.txt`        001  
6. upd: `project.root`        026  

[#26-dev-value]: tasks/2024-03-20-0026-dev-value.md
<div/>


[![S]][H] **v0.2.5 (dev)**
--------------------------------------------------------------------------------
[![V]][VE025] [![2024-03-09 04:10]][VE025]  

[2024-03-09 04:10]: https://img.shields.io/static/v1?label=2024-03-09&message=04:10&color=yellowgreen
[VE025]: changelog.md#-v025-dev

|    дата    | время |       ветка       | статус |  
|:----------:|:-----:|:-----------------:|:------:|  
| 2024-03-09 | 04:00 | [#25-dev-find_in] | DONE   |  
| 2024-03-09 | 03:10 | [#25-dev-find_in] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`         025  
   - upd: `changelog.md`     025  
   - upd: `history.md`       025  
   - upd: `chrono.md`        025  
   - upd: `docs.md`          025  
   - upd: `docs/find_in.md`  003  
2. upd: `vbs`  
   - upd: `vbs.ver`          018  
   - upd: `find_in.vbs`      003  
3. upd: `test`  
   - upd: `test.ver`         024  
4. upd: `find_in/sources  
   - upd: `main.vbs`         003  
5. upd: `project.root`       025  

[#25-dev-find_in]: tasks/2024-03-09-0025-dev-find_in.md
<div/>


[![S]][H] **v0.2.4 (dev)**
--------------------------------------------------------------------------------
[![V]][VE024] [![2024-03-09 19:00]][VE024]  

[2024-03-08 19:00]: https://img.shields.io/static/v1?label=2024-03-08&message=19:00&color=yellowgreen
[VE024]: changelog.md#-v024-dev

|    дата    | время |     ветка      | статус |  
|:----------:|:-----:|:--------------:|:------:|  
| 2024-03-08 | 18:50 | [#24-dev-mask] | DONE   |  
| 2024-03-08 | 18:30 | [#24-dev-mask] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`          024  
   - upd: `changelog.md`      024  
   - upd: `history.md`        024  
   - upd: `chrono.md`         024  
   - upd: `docs.md`           024  
   - upd: `docs/mask.md`      002  
2. upd: `vbs`  
   - upd: `vbs.ver`           017  
   - upd: `mask.vbs`          002  
3. upd: `test`  
   - upd: `test.ver`          023  
4. add: `test/mask/MaskExp/sources`  
   - add: `exclude.vbs`       001  
   - add: `include.vbs`       001  
5. upd: `project.root`        024  

[#24-dev-mask]: tasks/2024-03-08-0024-dev-mask.md
<div/>


[![S]][H] **v0.2.3 (dev)**
--------------------------------------------------------------------------------
[![V]][VE023] [![2024-03-07 23:50]][VE023]  

[2024-03-07 23:50]: https://img.shields.io/static/v1?label=2024-03-07&message=23:50&color=yellowgreen
[VE023]: changelog.md#-v023-dev

|    дата    | время |       ветка       | статус |  
|:----------:|:-----:|:-----------------:|:------:|  
| 2024-03-07 | 23:40 | [#23-dev-find_in] | DONE   |  
| 2024-03-07 | 20:00 | [#23-dev-find_in] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`               023  
   - upd: `changelog.md`           023  
   - upd: `history.md`             023  
   - upd: `chrono.md`              023  
   - upd: `docs.md`                023  
   - add: `docs/find_in.md`        002  
2. upd: `vbs`  
   - upd: `vbs.ver`                016  
   - add: `find_in.vbs`            002  
3. upd: `test`  
   - upd: `test.ver`               022  
4. add: `test/find_in`  
   - add: `make.bat`               001  
   - add: `test-[wsf].bat`         001  
   - add: `test-[vbs].bat`         001  
   - add: `sources/test.wsf`       001  
   - add: `sources/main.vbs`       002  
   - add: `sources/sandbox-1` ...  002  
   - add: `sources/sandbox-2` ...  002  
   - add: `sources/sandbox-3` ...  002  
5. upd: `project.root`             023  

[#23-dev-find_in]: tasks/2024-03-07-0023-dev-find_in.md
<div/>


[![S]][H] **v0.2.2 (dev)**
--------------------------------------------------------------------------------
[![V]][VE022] [![2024-03-06 06:20]][VE022]  

[2024-03-06 06:20]: https://img.shields.io/static/v1?label=2024-03-06&message=06:20&color=yellowgreen
[VE022]: changelog.md#-v022-dev

|    дата    | время |       ветка       | статус |  
|:----------:|:-----:|:-----------------:|:------:|  
| 2024-03-06 | 06:10 | [#22-dev-symptom] | DONE   |  
| 2024-03-06 | 05:10 | [#22-dev-symptom] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`             022  
   - upd: `changelog.md`         022  
   - upd: `history.md`           022  
   - upd: `chrono.md`            022  
   - upd: `docs.md`              022  
   - add: `docs/symptom.md`      001  
2. upd: `vbs/vbs.ver`  
   - upd: `vbs.ver`              015  
   - add: `symptom.vbs`          002  
3. upd: `test`  
   - upd: `test.ver`             021  
4. add: `test/symptom`  
   - add: `make.bat`             001  
   - add: `test-[wsf].bat`       001  
   - add: `test-[vbs].bat`       001  
   - add: `sources/sandbox` ...  002  
   - add: `sources/test.wsf`     001  
   - add: `sources/main.vbs`     002  
5. upd: `project.root`           022  

[#22-dev-symptom]: tasks/2024-03-06-0022-dev-symptom.md
<div/>


[![S]][H] **v0.2.1 (tst)**
--------------------------------------------------------------------------------
[![V]][VE021] [![2024-02-23 09:20]][VE021]  

[2024-02-23 09:20]: https://img.shields.io/static/v1?label=2024-02-23&message=09:20&color=yellowgreen
[VE021]: changelog.md#-v021-tst

|    дата    | время |     ветка      | статус |  
|:----------:|:-----:|:--------------:|:------:|  
| 2024-02-23 | 09:10 | [#21-tst-mask] | DONE   |  
| 2024-02-23 | 09:00 | [#21-tst-mask] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`          021  
   - upd: `changelog.md`      021  
   - upd: `history.md`        021  
   - upd: `chrono.md`         021  
   - upd: `docs.md`           021  
   - upd: `docs/mask.md`      001  
2. upd: `test`  
   - upd: `test.ver`          020  
3. add: `test/mask/matchByMasks`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/main.vbs`  001  
   - add: `sources/test.wsf`  001  
4. add: `test/mask/matchByMask`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/main.vbs`  001  
   - add: `sources/test.wsf`  001  
5. add: `test/mask/matchByInclude`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/main.vbs`  001  
   - add: `sources/test.wsf`  001  
6. add: `test/mask/matchByExclude`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/main.vbs`  001  
   - add: `sources/test.wsf`  001  
7. upd: `project.root`        021  

[#21-tst-mask]: tasks/2024-02-23-0021-tst-mask.md
<div/>


[![S]][H] **v0.2.0 (tst)**
--------------------------------------------------------------------------------
[![V]][VE020] [![2024-02-23 08:50]][VE020]  

[2024-02-23 08:50]: https://img.shields.io/static/v1?label=2024-02-23&message=08:50&color=yellowgreen
[VE020]: changelog.md#-v020-tst

|    дата    | время |     ветка      | статус |  
|:----------:|:-----:|:--------------:|:------:|  
| 2024-02-23 | 08:40 | [#20-tst-mask] | DONE   |  
| 2024-02-23 | 08:30 | [#20-tst-mask] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`          020  
   - upd: `changelog.md`      020  
   - upd: `chrono.md`         020  
   - upd: `history.md`        020  
   - upd: `docs.md`           020  
   - upd: `docs/mask.md`      001  
1. upd: `test`  
   - upd: `test.ver`          019  
2. add: `test/mask/versionByRegexp`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/main.vbs`  001  
   - add: `sources/test.wsf`  001  
2. add: `test/mask/matchByRegexp`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/main.vbs`  001  
   - add: `sources/test.wsf`  001  
3. add: `test/mask/checkByRegexp`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/main.vbs`  001  
   - add: `sources/test.wsf`  001  
4. add: `test/mask/checkByMasks`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/main.vbs`  001  
   - add: `sources/test.wsf`  001  
5. upd: `project.root`        020  

[#20-tst-mask]: tasks/2024-02-23-0020-tst-mask.md
<div/>


[![S]][H] **v0.1.9 (tst)**
--------------------------------------------------------------------------------
[![V]][VE019] [![2024-02-23 08:20]][VE019]  

[2024-02-23 08:20]: https://img.shields.io/static/v1?label=2024-02-23&message=08:20&color=yellowgreen
[VE019]: changelog.md#-v019-tst

|    дата    | время |     ветка      | статус |  
|:----------:|:-----:|:--------------:|:------:|  
| 2024-02-23 | 08:10 | [#19-tst-mask] | DONE   |  
| 2024-02-23 | 07:40 | [#19-tst-mask] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`          019  
   - upd: `changelog.md`      019  
   - upd: `history.md`        019  
   - upd: `chrono.md`         019  
   - upd: `docs.md`           019  
   - upd: `docs/mask.md`      001  
2. upd: `test`  
   - upd: `test.ver`          018  
3. add: `test/mask/masksToRegexp`  
   - add: `make.bat`          001  
   - add: `test-[vbs].bat`    001  
   - add: `test-[wsf].bat`    001  
4. add: `test/mask/masksToRegexp/sources`  
   - add: `assert-3.vbs`      001  
   - add: `assert-2.vbs`      001  
   - add: `assert-1.vbs`      001  
   - add: `main.vbs`          001  
   - add: `struct.txt`        001  
5. upd: `project.root`        019  

[#19-tst-mask]: tasks/2024-02-23-0019-tst-mask.md
<div/>


[![S]][H] **v0.1.8 (tst)**
--------------------------------------------------------------------------------
[![V]][VE018] [![2024-02-23 07:30]][VE017]  

[2024-02-23 07:30]: https://img.shields.io/static/v1?label=2024-02-23&message=07:30&color=yellowgreen
[VE018]: changelog.md#-v018-tst

|    дата    | время |     ветка      | статус |  
|:----------:|:-----:|:--------------:|:------:|  
| 2024-02-23 | 07:20 | [#18-tst-mask] | DONE   |  
| 2024-02-23 | 07:10 | [#18-tst-mask] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`          018  
   - upd: `changelog.md`      018  
   - upd: `history.md`        018  
   - upd: `chrono.md`         018  
   - upd: `docs.md`           018  
   - upd: `docs/mask.md`      001  
2. upd: `test`  
   - upd: `test.ver`          017  
3. add: `test/mask/maskToRegexp`  
   - add: `make.bat`          001  
   - add: `test-[vbs].bat`    001  
   - add: `test-[wsf].bat`    001  
4. add: `test/mask/maskToRegexp/sources`  
   - add: `assert-2.vbs`      001  
   - add: `assert-1.vbs`      001  
   - add: `main.vbs`          001  
   - add: `struct.txt`        001  
5. upd: `project.root`        018  

[#18-tst-mask]: tasks/2024-02-23-0018-tst-mask.md
<div/>


[![S]][H] **v0.1.7 (dev)**
--------------------------------------------------------------------------------
[![V]][VE017] [![2024-02-23 06:50]][VE017]  

[2024-02-23 06:50]: https://img.shields.io/static/v1?label=2024-02-23&message=06:50&color=yellowgreen
[VE017]: changelog.md#-v017-dev

|    дата    | время |     ветка      | статус |  
|:----------:|:-----:|:--------------:|:------:|  
| 2024-02-23 | 06:40 | [#17-dev-mask] | DONE   |  
| 2024-02-23 | 02:20 | [#17-dev-mask] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`                  017  
   - upd: `changelog.md`              017  
   - upd: `history.md`                017  
   - upd: `chrono.md`                 017  
   - upd: `docs.md`                   017  
   - add: `docs/mask.md`              001  
2. upd: `vbs`  
   - upd: `vbs.ver`                   014  
   - add: `mask.vbs`                  001  
3. upd: `test`  
   - upd: `test.ver`                  016  
4. add: `test/mask/MaskExp`  
   - add: `make.bat`                  001  
   - add: `test-[wsf].bat`            001  
   - add: `test-[vbs].bat`            001  
5. add: `test/mask/MaskExp/sources`  
   - add: `toRegexp.vbs`              001  
   - add: `countInclude.vbs`          001  
   - add: `countExclude.vbs`          001  
   - add: `match.vbs`                 001  
   - add: `struct.txt`                001  
6. upd: `project.root`                017  

[#17-dev-mask]: tasks/2024-02-23-0017-dev-mask.md
<div/>


[![S]][H] **v0.1.6 (dev)**
--------------------------------------------------------------------------------
[![V]][VE016] [![2024-02-22 17:40]][VE016]  

[2024-02-22 17:40]: https://img.shields.io/static/v1?label=2024-02-22&message=17:40&color=yellowgreen
[VE016]: changelog.md#-v016-dev

|    дата    | время |      ветка      | статус |  
|:----------:|:-----:|:---------------:|:------:|  
| 2024-02-22 | 17:30 | [#16-dev-array] | DONE   |  
| 2024-02-22 | 12:20 | [#16-dev-array] | BEGIN  |  

1. add: `docs/docs`  
   - upd: `logo.png`          016  
   - upd: `changelog.md`      016  
   - upd: `history.md`        016  
   - upd: `chrono.md`         016  
   - upd: `docs.md`           016  
   - add: `docs/array.md`     001  
2. upd: `vbs`  
   - upd: `vbs.ver`           013  
   - add: `array.vbs`         001  
3. upd: `test`  
   - upd: `test.ver`          015  
4. add: `test/array`
   - add: `make.bat`          001  
   - add: `test-[vbs].bat`    001  
   - add: `test-[wsf].bat`    001  
5. add: `test/array/sources`  
   - add: `toArrayList.vbs`   002  
   - add: `getCount.vbs`      002  
   - add: `getBound.vbs`      002  
   - add: `struct.txt`        001  
6. upd: `project.root`        016  

[#16-dev-array]: tasks/2024-02-22-0016-dev-array.md
<div/>


[![S]][H] **v0.1.5 (dev)**
--------------------------------------------------------------------------------
[![V]][VE015] [![2024-02-21 18:50]][VE015]  

[2024-02-21 18:50]: https://img.shields.io/static/v1?label=2024-02-21&message=18:50&color=yellowgreen
[VE015]: changelog.md#-v015-dev

|    дата    | время |       ветка      | статус |  
|:----------:|:-----:|:----------------:|:------:|  
| 2024-02-21 | 18:40 | [#15-dev-minmax] | DONE   |  
| 2024-02-21 | 17:50 | [#15-dev-minmax] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`          015  
   - upd: `changelog.md`      015  
   - upd: `history.md`        015  
   - upd: `chrono.md`         015  
   - upd: `docs.md`           015  
   - add: `docs/minmax.md`    001  
2. upd: `vbs`  
   - upd: `vbs.ver`           012  
   - add: `minmax.vbs`        001  
3. upd: `test`  
   - upd: `test.ver`          014  
4. add: `test/minmax`  
   - add: `make.bat`          001  
   - add: `test-[vbs].bat`    001  
   - add: `test-[wsf].bat`    001  
5. add: `test/minmax/sources`  
   - add: `minElement.vbs`    002  
   - add: `maxElement.vbs`    002  
   - add: `struct.txt`        001  
6. upd: `project.root`        015  

[#15-dev-minmax]: tasks/2024-02-21-0015-dev-minmax.md
<div/>


[![S]][H] **v0.1.4 (dev)**
--------------------------------------------------------------------------------
[![V]][VE014] [![2024-02-21 14:20]][VE014]  

[2024-02-21 14:20]: https://img.shields.io/static/v1?label=2024-02-21&message=14:20&color=yellowgreen
[VE014]: changelog.md#-v014-dev

|    дата    | время |     ветка      | статус |  
|:----------:|:-----:|:--------------:|:------:|  
| 2024-02-21 | 14:10 | [#14-dev-util] | DONE   |  
| 2024-02-21 | 13:20 | [#14-dev-util] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`          014  
   - upd: `changelog.md`      014  
   - upd: `history.md`        014  
   - upd: `chrono.md`         014  
   - upd: `docs.md`           014  
   - add: `docs/runBat.md`    001  
2. upd: `vbs`  
   - upd: `vbs.ver`           011  
   - add: `runBat.vbs`        001  
3. upd: `test`  
   - upd: `test.ver`          013  
4. add: `test/runBat`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/test.wsf`  001  
   - add: `sources/main.vbs`  001  
   - add: `sources/crol.bat`  001  
5. upd: `project.root`        014  

[#14-dev-util]: tasks/2024-02-21-0014-dev-util.md
<div/>


[![S]][H] **v0.1.3 (dev)**
--------------------------------------------------------------------------------
[![V]][VE013] [![2024-02-21 12:30]][VE013]  

[2024-02-21 12:30]: https://img.shields.io/static/v1?label=2024-02-21&message=12:30&color=yellowgreen
[VE013]: changelog.md#-v013-dev

|    дата    | время |     ветка      | статус |  
|:----------:|:-----:|:--------------:|:------:|  
| 2024-02-21 | 12:20 | [#13-dev-path] | DONE   |  
| 2024-02-21 | 11:30 | [#13-dev-path] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`               013  
   - upd: `changelog.md`           013  
   - upd: `chrono.md`              013  
   - upd: `history.md`             013  
   - upd: `docs.md`                013  
   - add: `docs/path.md`           001  
2. upd: `test`  
   - upd: `test.ver`               012  
3. add: `test/path`  
   - add: `make.bat`               001  
   - add: `test-[vbs].bat`         001  
   - add: `test-[wsf].bat`         001  
4. add: `test/path/sources`  
   - add: `canonicalPath.vbs`      001  
   - add: `relativePath.vbs`       001  
   - add: `isAbsolutePath.vbs`     001  
   - add: `canonicalPathList.vbs`  001  
   - add: `struct.txt`             001  
5. upd: `vbs`  
   - upd: `vbs.ver`                010  
   - add: `path.vbs`               001  
6. upd: `project.root`             013  

[#13-dev-path]: tasks/2024-02-21-0013-dev-path.md
<div/>


[![S]][H] **v0.1.2 (dev)**
--------------------------------------------------------------------------------
[![V]][VE012] [![2024-02-21 01:30]][VE012]  

[2024-02-21 01:30]: https://img.shields.io/static/v1?label=2024-02-21&message=01:30&color=yellowgreen
[VE012]: changelog.md#-v012-dev

|    дата    | время |     ветка      | статус |  
|:----------:|:-----:|:--------------:|:------:|  
| 2024-02-21 | 01:20 | [#12-dev-trim] | DONE   |  
| 2024-02-21 | 00:30 | [#12-dev-trim] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`          012  
   - upd: `changelog.md`      012  
   - upd: `history.md`        012  
   - upd: `chrono.md`         012  
   - upd: `docs.md`           012  
   - add: `docs/trim.md`      001  
2. upd: `vbs`  
   - upd: `vbs.ver`           009  
   - add: `trim.vbs`          001  
3. upd: `test`  
   - upd: `test.ver`          011  
4. add: `test/trim`  
   - add: `make.bat`          001  
   - add: `test-[vbs].bat`    001  
   - add: `test-[wsf].bat`    001  
5. add: `test/trim/sources`  
   - add: `trimmed.vbs`       003  
   - add: `front.vbs`         002  
   - add: `back.vbs`          002  
   - add: `both.vbs`          002  
   - add: `list.vbs`          003  
   - add: `struct.txt`        001  
6. upd: `project.root`        012  

[#12-dev-trim]: tasks/2024-02-21-0012-dev-trim.md
<div/>


[![S]][H] **v0.1.1 (dev)**
--------------------------------------------------------------------------------
[![V]][VE011] [![2024-02-20 23:50]][VE011]  

[2024-02-20 23:50]: https://img.shields.io/static/v1?label=2024-02-20&message=23:50&color=yellowgreen
[VE011]: changelog.md#-v011-dev

|    дата    | время |     ветка      | статус |  
|:----------:|:-----:|:--------------:|:------:|  
| 2024-02-20 | 22:40 | [#11-dev-util] | DONE   |  
| 2024-02-20 | 22:10 | [#11-dev-util] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`          011  
   - upd: `changelog.md`      011  
   - upd: `history.md`        011  
   - upd: `chrono.md`         011  
   - upd: `docs.md`           011  
   - add: `docs/runCmd.md`    001  
2. upd: `vbs`  
   - upd: `vbs.ver`           008  
   - add: `runCmd.vbs`        001  
3. upd: `test`  
   - upd: `test.ver`          010  
4. add: `test/runCmd`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/main.vbs`  003  
   - add: `sources/test.wsf`  001  
5. upd: `project.root`        011  

[#11-dev-util]: tasks/2024-02-20-0011-dev-util.md
<div/>


[![S]][H] **v0.1.0 (dev)**
--------------------------------------------------------------------------------
[![V]][VE010] [![2024-02-20 22:50]][VE010]  

[2024-02-20 22:50]: https://img.shields.io/static/v1?label=2024-02-20&message=22:50&color=yellowgreen
[VE010]: changelog.md#-v010-dev

|    дата    | время |     ветка      | статус |  
|:----------:|:-----:|:--------------:|:------:|  
| 2024-02-20 | 22:40 | [#10-dev-util] | DONE   |  
| 2024-02-20 | 22:10 | [#10-dev-util] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`          010  
   - upd: `changelog.md`      010  
   - upd: `history.md`        010  
   - upd: `chrono.md`         010  
   - upd: `docs.md`           010  
   - add: `docs/padding.md`   001  
2. upd: `vbs`  
   - upd: `vbs.ver`           007  
   - add: `padding.vbs`       002  
3. upd: `test`  
   - upd: `test.ver`          009  
4. add: `test/padding`  
   - add: `make.bat`          001  
   - add: `test-[vbs].bat`    001  
   - add: `test-[wsf].bat`    001  
5. add: `test/padding/sources`  
   - add: `padding.vbs`       002  
   - add: `assert-1.vbs`      002  
   - add: `assert-2.vbs`      002  
   - add: `assert-3.vbs`      002  
   - add: `struct.txt`        001  
6. upd: `project.root`        010  

[#10-dev-util]: tasks/2024-02-20-0010-dev-util.md
<div/>


[![S]][H] **v0.0.9 (tst)**
--------------------------------------------------------------------------------
[![V]][VE009] [![2024-02-20 22:00]][VE009]  

[2024-02-20 22:00]: https://img.shields.io/static/v1?label=2024-02-20&message=22:00&color=yellowgreen
[VE009]: changelog.md#-v009-tst

|    дата    | время |      ветка      | статус |  
|:----------:|:-----:|:---------------:|:------:|  
| 2024-02-20 | 21:50 | [#9-tst-assert] | DONE   |  
| 2024-02-20 | 21:00 | [#9-tst-assert] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`          009  
   - upd: `changelog.md`      009  
   - upd: `history.md`        009  
   - upd: `chrono.md`         009  
   - upd: `docs.md`           009  
   - upd: `docs/assert.md`    001  
2. upd: `test`  
   - upd: `test.ver`          008  
3. add: `test/assert/sources`  
   - add: `assert-11.vbs`     003  
   - add: `assert-12.vbs`     003  
   - add: `assert-13.vbs`     003  
   - add: `assert-14.vbs`     003  
   - add: `assert-15.vbs`     003  
4. upd: `project.root`        009  

[#9-tst-assert]: tasks/2024-02-20-0009-tst-assert.md
<div/>


[![S]][H] **v0.0.8 (tst)**
--------------------------------------------------------------------------------
[![V]][VE008] [![2024-02-20 20:30]][VE008]  

[2024-02-20 20:30]: https://img.shields.io/static/v1?label=2024-02-20&message=20:30&color=yellowgreen
[VE008]: changelog.md#-v008-tst

|    дата    | время |      ветка      | статус |  
|:----------:|:-----:|:---------------:|:------:|  
| 2024-02-20 | 20:20 | [#8-tst-assert] | DONE   |  
| 2024-02-20 | 19:30 | [#8-tst-assert] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`          008  
   - upd: `changelog.md`      008  
   - upd: `history.md`        008  
   - upd: `docs.md`           008  
   - upd: `chrono.md`         008  
   - upd: `docs/assert.md`    001  
2. upd: `test`  
   - upd: `test.ver`          007  
3. add: `test/assert/sources`  
   - add: `assert-05.vbs`     003  
   - add: `assert-06.vbs`     003  
   - add: `assert-07.vbs`     003  
   - add: `assert-09.vbs`     003  
   - add: `assert-10.vbs`     003  
4. upd: `project.root`        008  

[#8-tst-assert]: tasks/2024-02-20-0008-tst-assert.md
<div/>


[![S]][H] **v0.0.7 (dev)**
--------------------------------------------------------------------------------
[![V]][VE007] [![2024-02-19 90:00]][VE007]  

[2024-02-19 19:00]: https://img.shields.io/static/v1?label=2024-02-19&message=19:00&color=yellowgreen
[VE007]: changelog.md#-v007-dev

|    дата    | время |      ветка      | статус |  
|:----------:|:-----:|:---------------:|:------:|  
| 2024-02-19 | 18:50 | [#7-dev-assert] | DONE   |  
| 2024-02-19 | 16:00 | [#7-dev-assert] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`          007  
   - upd: `changelog.md`      007  
   - upd: `history.md`        007  
   - upd: `chrono.md`         007  
   - upd: `docs.md`           007  
   - upd: `docs/assert.md`    001  
2. upd: `vbs`  
   - upd: `vbs.ver`           006  
   - add: `assert.vbs`        003  
3. upd: `test`  
   - upd: `test.ver`          006  
4. add: `test/assert`  
   - add: `make.bat`          001  
   - add: `test-[vbs].bat`    001  
   - add: `test-[wsf].bat`    001  
5. add: `test/assert/sources`  
   - add: `success.vbs`       002  
   - add: `assert-01.vbs`     003  
   - add: `assert-02.vbs`     003  
   - add: `assert-03.vbs`     003  
   - add: `assert-04.vbs`     003  
   - add: `struct.txt`        001  
6. upd: `project.root`        007  

[#7-dev-assert]: tasks/2024-02-19-0007-dev-assert.md
<div/>


[![S]][H] **v0.0.6 (dev)**
--------------------------------------------------------------------------------
[![V]][VE006] [![2024-02-19 15:00]][VE006]  

[2024-02-19 15:00]: https://img.shields.io/static/v1?label=2024-02-19&message=15:00&color=yellowgreen
[VE006]: changelog.md#-v006-dev

|    дата    | время |       ветка      | статус |  
|:----------:|:-----:|:----------------:|:------:|  
| 2024-02-19 | 14:50 | [#6-dev-errcode] | DONE   |  
| 2024-02-19 | 14:20 | [#6-dev-errcode] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`        006  
   - upd: `changelog.md`    006  
   - upd: `history.md`      006  
   - upd: `chrono.md`       006  
   - upd: `docs.md`         006  
2. add: `docs/docs`  
   - add: `errCode.md`      001  
3. upd: `vbs`  
   - upd: `vbs.ver`         005  
   - add: `errCode.vbs`     002  
4. upd: `test`  
   - upd: `test.ver`        005  
5. add: `test/errCode`  
   - add: `test-[wsf].bat`  001  
   - add: `test-[vbs].bat`  001  
   - add: `make.bat`        001  
6. add: `test/errCode/sources`  
   - add: `test.wsf`        001  
   - add: `main.vbs`        003  
7. upd: `project.root`      006  

[#6-dev-errcode]: tasks/2024-02-19-0006-dev-errcode.md
<div/>


[![S]][H] **v0.0.5 (dev)**
--------------------------------------------------------------------------------
[![V]][VE005] [![2024-02-18 03:25]][VE005]  

[2024-02-18 03:25]: https://img.shields.io/static/v1?label=2024-02-18&message=02:05&color=yellowgreen
[VE005]: changelog.md#-v005-dev

|    дата    | время |     ветка     | статус |  
|:----------:|:-----:|:-------------:|:------:|  
| 2024-02-18 | 03:15 | [#5-dev-util] | DONE   |  
| 2024-02-18 | 02:25 | [#5-dev-util] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`        005  
   - upd: `changelog.md`    005  
   - upd: `chrono.md`       005  
   - upd: `history.md`      005  
   - upd: `docs.md`         005  
2. add: `docs/docs`  
   - add: `twoDigits.md`    001  
3. upd: `vbs`  
   - upd: `vbs.ver`         004  
   - add: `twoDigits.vbs`   001  
4. upd: `test`  
   - upd: `test.ver`        004  
5. add: `test/twoDigits`  
   - add: `test-[wsf].bat`  001  
   - add: `test-[vbs].bat`  001  
   - add: `make.bat`        001  
6. add: `test/twoDigits/sources`  
   - add: `test.wsf`        001  
   - add: `main.vbs`        003  
7. upd: `project.root`      005  

[#5-dev-util]: tasks/2024-02-18-0005-dev-util.md
<div/>


[![S]][H] **v0.0.4 (dev)**
--------------------------------------------------------------------------------
[![V]][VE004] [![2024-02-18 02:05]][VE004]  

[2024-02-18 06:20]: https://img.shields.io/static/v1?label=2024-02-18&message=02:05&color=yellowgreen
[VE004]: changelog.md#-v004-dev

|    дата    | время |     ветка     | статус |  
|:----------:|:-----:|:-------------:|:------:|  
| 2024-02-18 | 01:55 | [#4-dev-echo] | DONE   |  
| 2024-02-18 | 00:25 | [#4-dev-echo] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`        004  
   - upd: `history.md`      004  
   - upd: `docs.md`         004  
   - upd: `chrono.md`       004  
   - upd: `changelog.md`    004  
2. add: `docs/docs`  
   - add: `echo.md`         002  
3. upd: `vbs`  
   - upd: `vbs.ver`         003  
   - add: `echo.vbs`        002  
4. upd: `test`  
   - upd: `test.ver`        003  
5. add: `test/echo`  
   - add: `make.bat`        001  
   - add: `test-[wsf].bat`  001  
   - add: `test-[vbs].bat`  001  
6. add: `test/echo/sources`  
   - add: `test.wsf`        001  
   - add: `main.vbs`        001  
7. upd: `project.root`      004  

[#4-dev-echo]: tasks/2024-02-18-0004-dev-echo.md
<div/>


[![S]][H] **v0.0.3 (dev)**
--------------------------------------------------------------------------------
[![V]][VE003] [![2024-02-17 20:30]][VE003]  

[2024-02-17 06:20]: https://img.shields.io/static/v1?label=2024-02-17&message=20:30&color=yellowgreen
[VE003]: changelog.md#-v003-dev

|    дата    | время |     ветка     | статус |  
|:----------:|:-----:|:-------------:|:------:|  
| 2024-02-17 | 20:20 | [#3-dev-glob] | DONE   |  
| 2024-02-17 | 02:00 | [#3-dev-glob] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`        003  
   - upd: `changelog.md`    003  
   - upd: `history.md`      003  
   - upd: `chrono.md`       003  
   - upd: `docs.md`         003  
2. add: `docs/docs`  
   - add: `glob.md`         001  
3. upd: `vbs`  
   - upd: `vbs.ver`         002  
   - add: `glob.vbs`        001  
4. upd: `test`  
   - upd: `test.ver`        002  
5. add: `test/glob`  
   - add: `make.bat`        001  
   - add: `test-[wsf].bat`  001  
   - add: `test-[vbs].bat`  001  
6. add: `test/glob/sources`  
   - add: `test.wsf`        001  
   - add: `main.vbs`        003  
7. upd: `project.root`      003  

[#3-dev-glob]: tasks/2024-02-17-0003-dev-glob.md
<div/>


[![S]][H] **v0.0.2 (dev)**
--------------------------------------------------------------------------------
[![V]][VE002] [![2024-02-15 09:00]][VE002]  

[2024-02-15 09:00]: https://img.shields.io/static/v1?label=2024-02-15&message=09:00&color=yellowgreen
[VE002]: changelog.md#-v002-dev

|    дата    | время |     ветка      | статус |  
|:----------:|:-----:|:--------------:|:------:|  
| 2024-02-15 | 08:50 | [#2-dev-frame] | DONE   |  
| 2024-02-13 | 13:30 | [#2-dev-frame] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`        002  
   - upd: `changelog.md`    002  
   - upd: `chrono.md`       002  
   - upd: `history.md`      002  
   - upd: `docs.md`         002  
2. add: `docs/docs`  
   - add: `factory.md`      001  
3. add: `vbs`  
   - add: `vbs.ver`         001  
4. add: `models`  
   - add: `hybride4.bat`    001  
   - add: `hybride3.bat`    001  
   - add: `hybride2.bat`    001  
   - add: `hybride1.bat`    001  
5. add: `factory`  
   - add: `factory.bat`     003  
6. add: `factory/example/single`  
   - add: `make.bat`        001  
   - add: `run-[wsf].bat`   001  
   - add: `run-[vbs].bat`   001  
   - add: `single.wsf`      001  
7. add: `factory/example/single/sources`  
   - add: `main.vbs`        001  
   - add: `body2.vbs`       001  
   - add: `body1.vbs`       001  
8. add: `factory/example/depend`  
   - add: `make.bat`        001  
   - add: `run-[wsf].bat`   001  
   - add: `run-[vbs].bat`   001  
   - add: `depend.wsf`      001  
9. add: `factory/example/depend/sources`  
   - add: `body1.vbs`       001  
   - add: `body2.vbs`       001  
   - add: `main.vbs`        001  
10. add: `factory/example/depend/sources/additional`  
   - add: `zzzz.vbs`        001  
   - add: `xxxx.vbs`        001  
11. add: `test`  
   - add: `test.ver`        001  
   - add: `clean.bat`       001  
   - add: `test.bat`        001  
   - add: `test-d.bat`  
   - add: `init.vbs`        001  
12. add: `test/staff`  
   - add: `sepparator.vbs`  001  
   - add: `compare.vbs`     001  
   - add: `except.vbs`      001  
13. add: `factory/example/multiple`  
   - add: `make.bat`        001  
   - add: `test-[wsf].bat`  001  
   - add: `test-[vbs].bat`  001  
14. add: `factory/example/multiple/sources`  
   - add: `main.vbs`        001  
   - add: `assert-2.vbs`    001  
   - add: `assert-1.vbs`    001  
   - add: `struct.txt`      001  
15. add: `factory/example/multiple/sources/staff`  
   - add: `foo.vbs`         001  
16. upd: `.gitignore`       002  
17. upd: `project.root`     002  

[#2-dev-frame]: tasks/2024-02-13-0002-dev-frame.md
<div/>


[![S]][H] **v0.0.1 (rep)**
--------------------------------------------------------------------------------
[![V]][VE001] [![2024-02-13 13:20]][VE001]  

[2024-02-13 13:20]: https://img.shields.io/static/v1?label=2024-02-13&message=13:20&color=yellowgreen
[VE001]: changelog.md#-v001-rep

|    дата    | время |     ветка      | статус |  
|:----------:|:-----:|:--------------:|:------:|  
| 2024-02-13 | 13:10 | [#1-rep-first] | DONE   |  
| 2024-02-13 | 11:20 | [#1-rep-first] | BEGIN  |  

1. add: `docs`  
   - add: `logo.png`      001  
   - add: `changelog.md`  001  
   - add: `history.md`    001  
   - add: `chrono.md`     001  
   - add: `docs.md`       001  
   - add: `icons` ...     002  
2. add: `docs/other`  
   - add: `calendar.md`  
3. add: `project.root`    001  
4. add: `.gitlab-ci.yml`  001  
5. add: `.gitignore`      001  
6. fix: `README.md`  
7. add: `LICENSE`  

[#1-rep-first]: tasks/2024-02-13-0001-rep-first.md
<div/>

