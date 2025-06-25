/*
Мы тестируем личные диалоги между пользователями. Сообщения хранятся в таблице private_messages.

Напишите запрос, который считает количество сообщений в диалоге между пользователем 1 и пользователем 2.

Отправитель сообщения хранится в поле sender_id.

Получатель сообщения хранится в поле receiver_id.

 

Общий вид таблицы сообщений:
*/

CREATE TABLE `private_messages`(
	`id` SERIAL,
	`sender_id` BIGINT UNSIGNED NOT NULL,
	`receiver_id` BIGINT UNSIGNED NOT NULL,
	`reply_to_id` BIGINT UNSIGNED NULL,
	`media_type` ENUM('text', 'image', 'audio', 'video'),
	`body` TEXT,
	`filename` VARCHAR(200),
	`created_at` DATETIME DEFAULT NOW(),
	
	FOREIGN KEY (sender_id) REFERENCES users(id),
	FOREIGN KEY (receiver_id) REFERENCES users(id),
	FOREIGN KEY (reply_to_id) REFERENCES private_messages(id)
);

SELECT COUNT( * )
FROM private_messages
WHERE sender_id = 1 AND receiver_id = 2 OR
      sender_id = 2 AND receiver_id = 1 ;