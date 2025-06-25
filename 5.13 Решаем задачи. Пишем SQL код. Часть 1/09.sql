/*
Менеджеры сказали, что в предыдущей задаче номер отправителя сообщения (поле sender_id) - не информативно. Необходимо вместо него выводить имя и фамилию пользователя.

Перепишите запрос из предыдущего задания так, чтобы вместо поля sender_id было имя (поле firstname таблицы users) и фамилия (поле lastname таблицы users). Используйте вложенные запросы для получения полей таблицы users.

Вывести необходимо только следующие поля:

id
фамилия отправителя
имя отправителя
текст сообщения
дата сообщения
*/

CREATE TABLE `group_messages` (
	id SERIAL,
	group_id BIGINT UNSIGNED NOT NULL, # идентификатор группы
	sender_id BIGINT UNSIGNED NOT NULL, # отправитель сообщения
	reply_to_id BIGINT UNSIGNED NULL,
	media_type ENUM('text', 'image', 'audio', 'video'), # медиа тип сообщения
	body TEXT, # текст сообщения
	filename VARCHAR(100) NULL,
	created_at DATETIME DEFAULT NOW(), # дата написания сообщения

	FOREIGN KEY (sender_id) REFERENCES users (id),
	FOREIGN KEY (group_id) REFERENCES `groups` (id),
	FOREIGN KEY (reply_to_id) REFERENCES group_messages (id)	
);

CREATE TABLE users(
	id 			 BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	firstname VARCHAR(100), # имя
	lastname VARCHAR(100) COMMENT 'фамилия',
	login VARCHAR(100),
	email VARCHAR(100) UNIQUE,
	password_hash VARCHAR(256),
	phone BIGINT UNSIGNED UNIQUE,
	birthday date DEFAULT NULL # дата рождения
	
	INDEX idx_users_username(firstname, lastname)
) COMMENT 'пользователи';

SELECT
	`id`,
	(SELECT `firstname` FROM users WHERE gm.`sender_id` = users.`id`) AS 'firstname',
	(SELECT `lastname` FROM users WHERE gm.`sender_id` = users.`id`) AS 'lastname',
	LEFT( `body`, 30 ),
	`created_at`
FROM
	`group_messages` AS gm
WHERE
	`group_id` = 11 AND `media_type` = 'text'
ORDER BY
	`created_at`;
