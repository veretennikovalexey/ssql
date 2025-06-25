/*
Теперь копируем подписчиков канала в подписчики группы. Соответствующие таблицы в нашей БД telegram называются channel_subscribers и group_members.

Скопируйте данные аналогично предыдущей задаче командой INSERT-SELECT из первой таблицы во вторую.

Требуемые данные имеют следующие известные значения (использовать для фильтрации в таблице channel_subscribers):

    channel_id = 2
 

Скопировать необходимо данные из следующих полей:

    channel_id -> group_id,
    user_id, -> user_id
    created_at -> created_at
 

 Вид таблицы channel_subscribers:

 

 Вид таблицы group_members:


*/

CREATE TABLE channel_subscribers (
  	channel_id BIGINT UNSIGNED NOT NULL,
  	user_id BIGINT UNSIGNED NOT NULL,
  	status ENUM('requested', 'joined', 'left'),
  	created_at DATETIME DEFAULT NOW(),
  	updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,

  	FOREIGN KEY (user_id) REFERENCES users (id),
  	FOREIGN KEY (channel_id) REFERENCES channels (id)
);

CREATE TABLE `group_members` (
	`id` SERIAL,
	`group_id` BIGINT UNSIGNED NOT NULL,
	`user_id` BIGINT UNSIGNED NOT NULL,
	`created_at` DATETIME DEFAULT NOW(),
  
	FOREIGN KEY (user_id) REFERENCES `users` (id),
	FOREIGN KEY (group_id) REFERENCES `groups` (id)
);

INSERT INTO group_members
    ( group_id, user_id, created_at )
SELECT channel_id, user_id, created_at FROM channel_subscribers
WHERE channel_id = 2 
;
