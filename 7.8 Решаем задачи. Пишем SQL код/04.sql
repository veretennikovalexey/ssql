/*
Развиваем нашу процедуру remove_channel дальше. Теперь она должна принимать в качестве параметра номер канала, который должен удаляться.

Перепишите соответствующим образом код создания процедуры remove_channel, чтобы она принимала параметр channel_number и удаляла записи из таблиц channel_subscribers, channel_messages, channels, учитывая номер переданного канала.

 

Важно! Подумайте над типом данных передаваемого параметра (номер канала) с учетом определения таблицы 

 channels:
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

DROP PROCEDURE IF EXISTS remove_channel;

DELIMITER //

CREATE PROCEDURE remove_channel(
	channel_number BIGINT UNSIGNED
)
BEGIN
    START TRANSACTION;
        DELETE FROM channel_messages    WHERE channel_id = channel_number ;
        DELETE FROM channel_subscribers WHERE channel_id = channel_number ;
        DELETE FROM channels            WHERE id         = channel_number ;
    COMMIT;     
END//