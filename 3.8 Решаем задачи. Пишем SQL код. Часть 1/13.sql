/*
Вспомним команду INSERT в вариации со словом SET, где мы можем вставить только 1 строку за команду.

Добавьте именно этим способом в таблицу private_messages новое сообщение от пользователя 1 к пользователю 2 с текстом "Мой дядя самых честных правил".

Ориентировочный вид таблицы личных сообщений:

Подсказка
Команду обсуждали в уроке Команда INSERT
*/

CREATE TABLE `private_messages`(
	`id` SERIAL,
	`sender_id` BIGINT UNSIGNED NOT NULL, # отправитель сообщения
	`receiver_id` BIGINT UNSIGNED NOT NULL, # получатель сообщения
	`reply_to_id` BIGINT UNSIGNED NULL,
	`media_type` ENUM('text', 'image', 'audio', 'video'),
	`body` TEXT, # текст сообщения
	`filename` VARCHAR(200),
	`created_at` DATETIME DEFAULT NOW()
);

INSERT `private_messages`
    SET 
    sender_id = 1,
    receiver_id = 2,
    body = 'Мой дядя самых честных Грабил';
