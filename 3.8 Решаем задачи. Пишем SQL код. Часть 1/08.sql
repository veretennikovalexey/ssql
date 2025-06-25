/*
Пользователь номер 11 удалился из канала номер 2. Необходимо обновить статус его участия в канале.

Обновите поле status в таблице channel_subscribers на значение left для записи, у которой пользователь номер 11 и канал номер 2.

 Вид таблицы channel_subscribers:
*/

CREATE TABLE channel_subscribers (
    channel_id BIGINT UNSIGNED NOT NULL, # номер канала
    user_id BIGINT UNSIGNED NOT NULL, # номер пользователя
    status ENUM('requested', 'joined', 'left'), # статус пользователя
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,

    PRIMARY KEY (user_id, channel_id),
    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (channel_id) REFERENCES channels (id)
);

UPDATE channel_subscribers 
SET status = 'left'
WHERE channel_id = 2 and user_id = 11;   