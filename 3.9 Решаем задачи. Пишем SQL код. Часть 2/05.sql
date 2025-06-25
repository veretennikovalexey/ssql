/*
В какой-то момент владелец канала "Все про SQL" понял, что надо было создавать не канал, а группу. Он написал в техподдержку с просьбой поменять канал на группу и перенести всех пользователей и посты.

 

Мы начнем с того, чтобы скопировать командой INSERT-SELECT запись из таблицы channels в таблицу groups.

Решите задачу копирования данных.

 

Общий вид таблиц:

 

Скопировать необходимо следующие поля: title, owner_user_id, is_private.

Также мы знаем, что channels.id = 2 у целевого канала.

 

Важно! Не забудьте для таблицы `groups` использовать обратные кавычки, иначе запрос не будет исполняться по причине того, что само слово groups является зарезервированным в SQL.
*/

CREATE TABLE `groups` (
	id SERIAL,
	title VARCHAR(45),
	icon VARCHAR(45),
	invite_link VARCHAR(100),
	settings JSON,
	owner_user_id BIGINT UNSIGNED NOT NULL,
	is_private BIT,
	created_at DATETIME DEFAULT NOW(),
	
	FOREIGN KEY (owner_user_id) REFERENCES users (id)
);

DROP TABLE IF EXISTS channels;
CREATE TABLE channels (
	id SERIAL,
	title VARCHAR(45),
	icon VARCHAR(45),
	invite_link VARCHAR(100),
	settings JSON,
	owner_user_id BIGINT UNSIGNED NOT NULL,
	is_private BIT,
    created_at DATETIME DEFAULT NOW(),
	
    FOREIGN KEY (owner_user_id) REFERENCES users (id)    
);

INSERT INTO `groups` ( title, owner_user_id, is_private )
SELECT title, owner_user_id, is_private 
FROM channels
WHERE channels.id = 2;  
