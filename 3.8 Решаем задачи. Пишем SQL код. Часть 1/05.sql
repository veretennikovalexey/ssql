/*
Начальство думает о расширении списка возможных реакций (эмодзи). И для начала им нужно предоставить список поддерживаемых на текущий момент реакций. Они хранятся в таблице reactions_list.

Выведите список всех эмодзи (вместе с их идентификаторами) в таблице reactions_list.

 

Вид таблицы reactions_list:
*/

CREATE TABLE reactions_list (
	id SERIAL, # идентификатор
	code VARCHAR(1)
)DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_unicode_ci;

SELECT id, code
FROM reactions_list ;