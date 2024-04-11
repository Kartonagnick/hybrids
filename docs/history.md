[H]: ../README.md  "на главную"
[R]: icons/release.png
[V]: icons/version.png
[P]: icons/progress.png
[S]: icons/success.png
[B]: icons/bug.png

[![S]][H] **История изменений**  
--------------------------------------------------------------------------------

13 февраля 2024, 11:17:07. Реинкарнация зарегистрированна в `local` репозитории  
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
| 2024-02-13 | 11:17:07 | регистрациия [local] репозитория |  
| 2024-02-13 | 10:52:04 | рождение третьей реинкарнации    |  
| 2021-12-06 | 09:00:00 | регистрация в [Замке] на гитхабе |  
| 2021-12-06 | 08:00:00 | рождение второй реинкарнации     |  
| 2021-12-17 | 01:13:16 | регистрация hybrids на [гитхабе] |  
| 2021-08-18 | 01:19:40 | регистрация vbs в замке          |  
| 2021-07-16 | 14:35:47 | день рождения vbs                |  
| 2020-12-26 | 11:00:00 | дата рождения hybrids            |  

[vbs]:        https://github.com/CastleOfDreams/vbs
[Github]:     https://github.com/Kartonagnick/hybrids
[гитхабе]:    https://github.com/Kartonagnick/hybrids
[Замке Грёз]: https://github.com/CastleOfDreams/hybrids
[Замке]:      https://github.com/CastleOfDreams/hybrids
[local]:      D:/local/hybrids/README.md

[Картонажник]: https://github.com/Kartonagnick

--------------------------------------------------------------------------------


[![P]][H] **v0.3.2 (dev)**
--------------------------------------------------------------------------------
[![V]][VE032] [![2024-04-11 19:00]][VE032]  

[2024-04-11 19:00]: https://img.shields.io/static/v1?label=2024-04-11&message=19:00&color=yellowgreen
[VE032]: changelog.md#-v032-dev

|    дата    | время |      ветка     | статус |  
|:----------:|:-----:|:--------------:|:------:|  
| 2024-04-11 | 18:50 | [#32-dev-tree] | DONE   |  
| 2024-04-10 | 11:00 | [#32-dev-tree] | BEGIN  |  

1. upd: `docs`  
   - upd: `logo.png`         (032) PRE  
   - upd: `changelog.md`     (032) PRE  
   - upd: `chrono.md`        (032) PRE  
   - upd: `history.md`       (032) PRE  
   - upd: `docs.md`          (032) PRE  
2. add: `docs/docs/view`  
   - add: `tree_empty.md`    (001) PRE  
3. upd: `test`  
   - upd: `test.ver`         (030) PRE  
4. add: `test/view/tree_empty`  
   - add: `make.bat`         (001) PRE  
   - add: `test-[wsf].bat`   (001) PRE  
   - add: `test-[vbs].bat`   (001) PRE  
   - add: `sources/test.wsf` (001) PRE  
   - add: `sources/main.vbs` (001) PRE  
5. upd: `vbs`  
   - upd: `vbs.ver`          (025) PRE  
6. add: `vbs/view`  
   - add: `tree_empty.vbs`   (001) PRE  
7. upd: `project.root`       (032) PRE  

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
   - upd: `logo.png`          029  
   - upd: `changelog.md`      029  
   - upd: `chrono.md`         029  
   - upd: `history.md`        029  
   - upd: `docs.md`           029  
2. add: `docs/docs/view`  
   - add: `tree.md`           001  
3. upd: `test`  
   - upd: `test.ver`          027  
4. add: `test/view/tree/with_type`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/test.wsf`  001  
   - add: `sources/main.vbs`  001  
5. add: `test/view/tree/with_empty`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/test.wsf`  001  
   - add: `sources/main.vbs`  001  
6. add: `test/view/tree/typical`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/test.wsf`  001  
   - add: `sources/main.vbs`  001  
7. add: `test/view/tree/type_empty`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/test.wsf`  001  
   - add: `sources/main.vbs`  001  
8. upd: `vbs`  
   - upd: `vbs.ver`           022  
9. add: `vbs/view`  
   - add: `tree.vbs`          001  
10. upd: `project.root`       029  

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
   - upd: `logo.png`          027  
   - upd: `changelog.md`      027  
   - upd: `history.md`        027  
   - upd: `chrono.md`         027  
   - upd: `docs.md`           027  
   - add: `docs/traits.md`    001  
2. upd: `test`  
   - upd: `test.ver`          026  
3. add: `test/traits/is_empty_value`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/test.wsf`  001  
   - add: `sources/main.vbs`  001  
4. add: `test/traits/has_method_stamp`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/test.wsf`  001  
   - add: `sources/main.vbs`  001  
5. add: `test/traits/has_method_count`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/test.wsf`  001  
   - add: `sources/main.vbs`  001  
6. add: `test/traits/double_to_string`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/test.wsf`  001  
   - add: `sources/main.vbs`  001  
7. add: `test/traits/boolean_to_string`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/test.wsf`  001  
   - add: `sources/main.vbs`  001  
8. upd: `vbs`  
   - upd: `vbs.ver`           020  
   - add: `traits.vbs`        001  
9. upd: `project.root`        027  

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
4. add: `test/value/show_empty`  
   - add: `make.bat`          001  
   - add: `test-[vbs].bat`    001  
   - add: `test-[wsf].bat`    001  
   - add: `sources/main.vbs`  001  
   - add: `sources/test.wsf`  001  
5. add: `test/value/is_empty`  
   - add: `make.bat`          001  
   - add: `test-[vbs].bat`    001  
   - add: `test-[wsf].bat`    001  
   - add: `sources/test.wsf`  001  
   - add: `sources/main.vbs`  001  
7. add: `test/value/hide_empty`  
   - add: `make.bat`          001  
   - add: `test-[vbs].bat`    001  
   - add: `test-[wsf].bat`    001  
   - add: `sources/test.wsf`  001  
   - add: `sources/main.vbs`  001  
8. upd: `project.root`        026  

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
4. add: `test/mask/MaskExp.include`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/main.vbs`  001  
   - add: `sources/test.wsf`  001  
5. add: `test/mask/MaskExp.exclude`  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `make.bat`          001  
   - add: `sources/main.vbs`  001  
   - add: `sources/test.wsf`  001  
6. upd: `project.root`        024  

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
3. add: `test/mask/masksToRegexp-1`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/main.vbs`  001  
   - add: `sources/test.wsf`  001  
4. add: `test/mask/masksToRegexp-2`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/main.vbs`  001  
   - add: `sources/test.wsf`  001  
3. add: `test/mask/masksToRegexp-3`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/main.vbs`  001  
   - add: `sources/test.wsf`  001  
4. add: `test/mask/masksToRegexp-4`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/main.vbs`  001  
   - add: `sources/test.wsf`  001  
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
3. add: `test/mask/maskToRegexp-1`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/main.vbs`  001  
   - add: `sources/test.wsf`  001  
2. add: `test/mask/maskToRegexp-2`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/main.vbs`  001  
   - add: `sources/test.wsf`  001  
3. add: `test/mask/maskToRegexp-3`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/main.vbs`  001  
   - add: `sources/test.wsf`  001  
4. upd: `project.root`        018  

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
   - upd: `logo.png`          017  
   - upd: `changelog.md`      017  
   - upd: `history.md`        017  
   - upd: `chrono.md`         017  
   - upd: `docs.md`           017  
   - add: `docs/mask.md`      001  
2. upd: `vbs`  
   - upd: `vbs.ver`           014  
   - add: `mask.vbs`          001  
3. upd: `test`  
   - upd: `test.ver`          016  
4. add: `test/mask/MaskExp.toRegexp`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/main.vbs`  001  
   - add: `sources/test.wsf`  001  
5. add: `test/mask/MaskExp.match`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/main.vbs`  001  
   - add: `sources/test.wsf`  001  
6. add: `test/mask/MaskExp.countInclude`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/main.vbs`  001  
   - add: `sources/test.wsf`  001  
7. add: `test/mask/MaskExp.countExclude`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/main.vbs`  001  
   - add: `sources/test.wsf`  001  
8. upd: `project.root`        017  

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
   - upd: `logo.png`          013  
   - upd: `changelog.md`      013  
   - upd: `chrono.md`         013  
   - upd: `history.md`        013  
   - upd: `docs.md`           013  
   - add: `docs/path.md`      001  
2. upd: `vbs`  
   - upd: `vbs.ver`           010  
   - add: `path.vbs`          001  
3. upd: `test`  
   - upd: `test.ver`          012  
4. add: `test/path/relativePath`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/main.vbs`  001  
   - add: `sources/test.wsf`  001  
5. add: `test/path/isAbsolutePath`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/main.vbs`  002  
   - add: `sources/test.wsf`  001  
6. add: `test/path/canonicalPathList`  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/main.vbs`  001  
   - add: `sources/test.wsf`  001  
7. add: `test/path/canonicalPath  
   - add: `make.bat`          001  
   - add: `test-[wsf].bat`    001  
   - add: `test-[vbs].bat`    001  
   - add: `sources/main.vbs`  001  
   - add: `sources/test.wsf`  001  
8. upd: `project.root`        013  

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
   - add: `test.bat`        001  
   - add: `test-d.bat`  
   - add: `init.vbs`        001  
   - add: `glob.vbs`        001  
   - add: `echo.vbs`        002  
12. add: `factory/example/multiple`  
   - add: `make.bat`        001  
   - add: `test-[wsf].bat`  001  
   - add: `test-[vbs].bat`  001  
13. add: `factory/example/multiple/sources`  
   - add: `main.vbs`        001  
   - add: `assert-2.vbs`    001  
   - add: `assert-1.vbs`    001  
   - add: `struct.txt`      001  
14. add: `factory/example/multiple/sources/staff`  
   - add: `foo.vbs`         001  
15. upd: `.gitignore`       002  
16. upd: `project.root`     002  

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
