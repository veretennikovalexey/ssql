/*
С помощью оконных функций решите одну из прошлых задачек.

Необходимо узнать: кто из пользователей добавился в максимальное количество каналов (если таковых несколько, то достаточно вывести одного из них).

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

SELECT DISTINCT
    user_id,
    COUNT( * ) OVER (PARTITION by user_id) AS channels_count
FROM channel_subscribers
WHERE status = 'joined'
ORDER BY channels_count DESC
LIMIT 1;