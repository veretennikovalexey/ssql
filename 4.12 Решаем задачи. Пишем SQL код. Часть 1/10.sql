/*
Аналитики хотят знать среднестатистическую длину сообщения между пользователями.

Выведите среднюю длину поля body в таблице private_messages, используя агрегирующую функцию ___ и функцию LENGTH.

 

Общий вид таблицы сообщений:
*/

CREATE TABLE `private_messages`(
	`id` SERIAL,
	`sender_id` BIGINT UNSIGNED NOT NULL,
	`receiver_id` BIGINT UNSIGNED NOT NULL,
	`reply_to_id` BIGINT UNSIGNED NULL,
	`media_type` ENUM('text', 'image', 'audio', 'video'),
	`body` TEXT, # тело сообщения
	`filename` VARCHAR(200),
	`created_at` DATETIME DEFAULT NOW(),
	
	FOREIGN KEY (sender_id) REFERENCES users(id),
	FOREIGN KEY (receiver_id) REFERENCES users(id),
	FOREIGN KEY (reply_to_id) REFERENCES private_messages(id)
);

ELECT AVG( LENGTH( body ) )
FROM private_messages; 
