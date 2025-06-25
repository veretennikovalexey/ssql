/*
Необходимо вывести все текстовые сообщения в группе номер 11 в хронологическом порядке.

Напишите запрос, который возвращает из таблицы group_messages все строки, у которых тип сообщения (поле media_type) является текстом (значение text) и которые относятся к группе (поле group_id) номер 11.

Вывести необходимо только следующие поля:

id
отправитель
текст
дата
 

Важно. Используйте встроенную функцию SUBSTRING, чтобы вывести только первые 30 символов текста сообщения (поле body).

Вид таблицы group_messages:
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

SELECT
	id,
	sender_id,
	LEFT( body, 30 ),
	created_at
FROM
	group_messages
WHERE
	group_id = 11 AND media_type = 'text'
ORDER BY
	created_at;