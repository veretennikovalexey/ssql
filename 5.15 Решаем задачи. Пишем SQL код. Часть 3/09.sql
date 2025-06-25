/*
Необходимо узнать: кто из пользователей владеет наибольшим количеством пабликов (суммарно: группами и каналами). Вывести идентификаторы топ 5 таких пользователей (поле owner_user_id в соответствующих таблицах) и суммарное количество пабликов у каждого из них.

Не забывайте название таблицы `groups` обрамлять обратными кавычками. Слово входит в число зарезервированных.

Порядок полей важен для проверки (ниже скрин ожидаемого результата): сначала идентификатор пользователя, затем количество его пабликов.
*/

CREATE TABLE channels (
	id SERIAL,
	title VARCHAR(45),
	icon VARCHAR(45),
	invite_link VARCHAR(100),
	settings JSON,
	owner_user_id BIGINT UNSIGNED NOT NULL, # владелец канала
	is_private BIT,
    created_at DATETIME DEFAULT NOW(),
	
    FOREIGN KEY (owner_user_id) REFERENCES users (id)    
);

CREATE TABLE `groups` (
	id SERIAL,
	title VARCHAR(45),
	icon VARCHAR(45),
	invite_link VARCHAR(100),
	settings JSON,
	owner_user_id BIGINT UNSIGNED NOT NULL, # владелец канала
	is_private BIT,
	created_at DATETIME DEFAULT NOW(),
	
	FOREIGN KEY (owner_user_id) REFERENCES users (id)
);

SELECT owner_user_id, COUNT( * ) cnt
FROM

(
SELECT owner_user_id
FROM channels
    UNION ALL
SELECT owner_user_id
FROM `groups`
)
AS users

GROUP BY owner_user_id
ORDER BY cnt DESC
LIMIT 5
;

