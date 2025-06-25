/*
Обнаружена недоработка в БД telegram. А именно в таблице group_members нет статуса членства пользователя в группе.

Добавьте поле в эту таблицу аналогичное полю status, которое есть в таблице channel_subscribers.

 

Вид таблицы group_members на текущий момент:

Вид таблицы channel_subscribers:
*/

CREATE TABLE `group_members` (
	`id` SERIAL,
	`group_id` BIGINT UNSIGNED NOT NULL,
	`user_id` BIGINT UNSIGNED NOT NULL,
	`created_at` DATETIME DEFAULT NOW(),
  
	FOREIGN KEY (user_id) REFERENCES `users` (id),
	FOREIGN KEY (group_id) REFERENCES `groups` (id)
);

CREATE TABLE channel_subscribers (
  	channel_id BIGINT UNSIGNED NOT NULL,
  	user_id BIGINT UNSIGNED NOT NULL,
	status ENUM('requested', 'joined', 'left'),
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (channel_id) REFERENCES channels (id)
);

ALTER TABLE `group_members`
ADD COLUMN `status`
ENUM (
    'requested',
    'joined',
    'left'    
);