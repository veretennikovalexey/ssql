/*
В наш канал "Все про SQL" добавляются первые несколько подписчиков.

Вставьте произвольные несколько строк в таблицу channel_subscribers (можно пользоваться сервисами для генерации данных либо самостоятельно придумать значения для полей).

Общий вид таблицы channel_subscribers:

Требования к запросу:

Вставка выполняется одной командой - помним о производительности
Статус пользователей - joined
Номер канала - 2
user_id - произвольные
*/

CREATE TABLE channel_subscribers (
  	channel_id BIGINT UNSIGNED NOT NULL, # номер канала
  	user_id BIGINT UNSIGNED NOT NULL, # номер пользователя
	status ENUM('requested', 'joined', 'left'), # статус пользователя
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (channel_id) REFERENCES channels (id)
);

INSERT INTO channel_subscribers ( channel_id, status, user_id )
VALUES 
    ( 2, 'joined', 21 ),
    ( 2, 'joined', 22 ),
    ( 2, 'joined', 23 )   
;    