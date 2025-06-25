/*
Владелец канала "Все про SQL" выложил 2 поста.

Первый пост - текстовый с приветствием "Наш канал запустился. Ура!"

Второй пост - видео с прикрепленным файлом "greetings.mp4".

 

Вид таблицы channel_messages:


Добавьте, соответственно, 2 новых записи в таблицу channel_messages.

Требования к записям:

идентификатор канала: 2
идентификатор владельца канала: 5
первый пост с медиатипом text и с текстом "Наш канал запустился. Ура!"
второй пост с медиатипом video и прикрепленным файлом greetings.mp4
 

Каждый пост выкладывался отдельно, поэтому необходимо написать 2 отдельных запроса.
*/

CREATE TABLE channel_messages (
	id SERIAL,
	channel_id BIGINT UNSIGNED NOT NULL, # номер канала
	sender_id BIGINT UNSIGNED NOT NULL, # владелец канала
	media_type ENUM('text', 'image', 'audio', 'video'), # тип сообщения
	body text, # текст сообщения
	filename VARCHAR(100) NULL, # имя файла (если есть)
	created_at DATETIME DEFAULT NOW(),

	FOREIGN KEY (sender_id) REFERENCES users (id),
	FOREIGN KEY (channel_id) REFERENCES `channels` (id)
);
 
INSERT INTO channel_messages
SET
    channel_id = 2,
    sender_id = 5,
    media_type = 'text',
    body = 'Наш канал запустился. Ураааааааааааааааааааааааааа!'
;
INSERT INTO channel_messages
SET
    channel_id = 2,
    sender_id = 5,
    media_type = 'video',
    filename = 'greetings.mp4'
;
