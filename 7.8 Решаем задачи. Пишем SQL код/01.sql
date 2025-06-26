/*
Необходимо удалить канал номер 1 из таблицы channels:

Но его удаление напрямую вызывает ошибку при проверке внешних ключей:

Действительно, у канала есть подписчики (записи в таблице channel_subscribers):

И также в канале есть сообщения (записи в таблице channel_messages):

Таким образом, чтобы удалить канал номер 1, сначала необходимо удалить соответствующие записи в зависимых таблицах.

Также очевидно, что данная операция является одним элементом бизнес логики приложения. Соответственно, ее необходимо выполнить в транзакции.

 

Напишите SQL код, который в транзакции удаляет канал номер 1, все сообщения в нем и информацию о его подписчиках.

 

Подсказка
Порядок удаления строк в разных таблицах важен, иначе код не будет работать.
*/

CREATE TABLE channels (
	id SERIAL, # идентификатор канала
	title VARCHAR(45),
	icon VARCHAR(45),
	invite_link VARCHAR(100),
	settings JSON,
	owner_user_id BIGINT UNSIGNED NOT NULL,
	is_private BIT,
  	created_at DATETIME DEFAULT NOW(),
	
  	FOREIGN KEY (owner_user_id) REFERENCES users (id)    
);

CREATE TABLE channel_subscribers (
  	channel_id BIGINT UNSIGNED NOT NULL, # ссылка на номер канала
  	user_id BIGINT UNSIGNED NOT NULL,
  	status ENUM('requested', 'joined', 'left'),
  	created_at DATETIME DEFAULT NOW(),
  	updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,

  	FOREIGN KEY (user_id) REFERENCES users (id),
  	FOREIGN KEY (channel_id) REFERENCES channels (id)
);

CREATE TABLE channel_messages (
	id SERIAL,
	channel_id BIGINT UNSIGNED NOT NULL, # ссылка на номер канала
	sender_id BIGINT UNSIGNED NOT NULL,
	media_type ENUM('text', 'image', 'audio', 'video'),
	body text,
	filename VARCHAR(100) NULL,
	created_at DATETIME DEFAULT NOW(),

	FOREIGN KEY (sender_id) REFERENCES users (id),
	FOREIGN KEY (channel_id) REFERENCES `channels` (id)
);

BEGIN;
DELETE FROM channel_messages    WHERE channel_id = 1;
DELETE FROM channel_subscribers WHERE channel_id = 1;
DELETE FROM channels            WHERE id         = 1;
COMMIT;
