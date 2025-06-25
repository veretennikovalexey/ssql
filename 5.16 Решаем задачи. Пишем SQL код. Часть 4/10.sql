/*
Необходимо узнать: кто из пользователей владеет наибольшим количеством пабликов (суммарно: группами и каналами). Вывести идентификаторы топ 5 таких пользователей (поле owner_user_id в соответствующих таблицах) и суммарное количество пабликов у каждого из них.
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

WITH _ AS
(
SELECT owner_user_id
FROM channels
    UNION ALL
SELECT owner_user_id
FROM `groups`
)

SELECT DISTINCT
    owner_user_id,
    COUNT( * ) OVER (PARTITION BY owner_user_id) AS cnt
FROM _
ORDER BY cnt DESC
LIMIT 5;
