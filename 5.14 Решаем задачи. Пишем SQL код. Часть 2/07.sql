/*
Необходимо вывести все текстовые сообщения в группе номер 11 в хронологическом порядке.

Напишите запрос, который возвращает из таблицы group_messages все строки, у которых тип сообщения (поле media_type) является текстом (значение text) и которые относятся к группе (поле group_id) номер 11.

Вывести необходимо только следующие поля:

id сообщения
имя отправителя
фамилия отправителя
текст сообщения
дата сообщения
 

Важно. Используйте встроенную функцию SUBSTRING, чтобы вывести только первые 30 символов текста сообщения (поле body).

 

В задаче используйте объединение таблиц (JOIN).

Отсортируйте результаты по дате сообщения (поле created_at).
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

SELECT group_messages.id, firstname, lastname, LEFT( body, 30 ) AS body, created_at
FROM group_messages
LEFT OUTER JOIN users
ON sender_id = users.id 
WHERE media_type = 'text' AND group_id = 11
ORDER BY created_at;