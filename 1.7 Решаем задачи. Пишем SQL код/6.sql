/*
В предыдущей задаче мы увидели, что в БД Information_schema есть таблица keywords.

 

Выведите все содержимое таблицы keywords.

 

Подсказка:

Первой командой сначала переключитесь на БД information_schema
Второй командой выводите таблицу keywords
*/

use Information_schema;
select * from keywords;