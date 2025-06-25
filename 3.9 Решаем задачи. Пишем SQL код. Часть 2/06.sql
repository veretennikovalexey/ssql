/*
Теперь нужно скопировать посты канала в посты группы. Соответствующие таблицы в нашей БД telegram называются channel_messages и group_messages.

Скопируйте данные аналогично предыдущей задаче командой INSERT-SELECT из первой таблицы во вторую.

Требуемые данные имеют следующие известные значения (использовать для фильтрации в таблице channel_messages):

    channel_id = 2,
    sender_id = 5
 

Скопировать необходимо данные из следующих полей:

    channel_id -> group_id,
    sender_id, -> sender_id
    media_type -> media_type,
    body - > body ,
    filename -> filename
    created_at -> created_at
 

 Вид таблицы channel_messages:



 Вид таблицы group_messages:

*/

CREATE TABLE channel_messages (
	id SERIAL,
	channel_id BIGINT UNSIGNED NOT NULL, # номер канала
	sender_id BIGINT UNSIGNED NOT NULL, # отправитель сообщения
	media_type ENUM('text', 'image', 'audio', 'video'), # тип сообщения
	body text, # текст сообщения
	filename VARCHAR(100) NULL, # имя файла (если есть)
	created_at DATETIME DEFAULT NOW(),

	FOREIGN KEY (sender_id) REFERENCES users (id),
	FOREIGN KEY (channel_id) REFERENCES `channels` (id)
);

CREATE TABLE `group_messages` (
	id SERIAL,
	group_id BIGINT UNSIGNED NOT NULL,
	sender_id BIGINT UNSIGNED NOT NULL,
	reply_to_id BIGINT UNSIGNED NULL,
	media_type ENUM('text', 'image', 'audio', 'video'),
	body TEXT,
	filename VARCHAR(100) NULL,
	created_at DATETIME DEFAULT NOW(),

	FOREIGN KEY (sender_id) REFERENCES users (id),
	FOREIGN KEY (group_id) REFERENCES `groups` (id),
	FOREIGN KEY (reply_to_id) REFERENCES group_messages (id)	
);

INSERT INTO group_messages
       ( group_id, sender_id, media_type, body, filename, created_at )
SELECT channel_id, sender_id, media_type, body, filename, created_at
FROM channel_messages
WHERE channel_id = 2 AND sender_id = 5 
;