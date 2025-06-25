/*
Продолжаем собирать аналитику по нашему мессенджеру.

С помощью группировки и агрегирующих функций необходимо узнать: кто из пользователей подписан на максимальное количество каналов. В случае, если таких пользователей несколько, вывести только одного.

Информация о членстве пользователей в каналах хранится в таблице channel_subscribers.

 

Ориентировочный вид таблицы channel_subscribers:


Необходимо вывести номер пользователя и количество каналов, на которые он подписался.

Важно: учитывайте статус подписки пользователя:

requested - подписка запрошена
joined - пользователь подписан
left - пользователь покинул канал
*/

CREATE TABLE channel_subscribers (
    channel_id BIGINT UNSIGNED NOT NULL,
    user_id BIGINT UNSIGNED NOT NULL,
    status ENUM('requested', 'joined', 'left'), # статус подписки
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (channel_id) REFERENCES channels (id)
);

SELECT user_id, count( * ) as channels_count
FROM channel_subscribers
WHERE status = 'joined'
GROUP BY user_id
ORDER BY channels_count DESC 
LIMIT 1;