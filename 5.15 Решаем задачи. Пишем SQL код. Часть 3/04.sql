/*
Выведите список пользователей, которые не подписались ни на какие каналы.

Отобразить необходимо только следующие поля:

firstname
lastname
email
 

Для решения задачи используйте LEFT OUTER JOIN объединение таблиц
*/

CREATE TABLE users(
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	firstname VARCHAR(100),
	lastname VARCHAR(100) COMMENT 'фамилия',
	login VARCHAR(100),
	email VARCHAR(100) UNIQUE,
	password_hash VARCHAR(256),
	phone BIGINT UNSIGNED UNIQUE,
	
	INDEX idx_users_username(firstname, lastname)
) COMMENT 'пользователи';

CREATE TABLE channel_subscribers (
  	channel_id BIGINT UNSIGNED NOT NULL,
  	user_id BIGINT UNSIGNED NOT NULL,
	status ENUM('requested', 'joined', 'left'),
    created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,

    FOREIGN KEY (user_id) REFERENCES users (id),
    FOREIGN KEY (channel_id) REFERENCES channels (id)
);

SELECT 
    u.firstname,
    u.lastname,
    u.email
FROM 
    users AS u
LEFT OUTER JOIN
    channel_subscribers cs
ON
    u.id = cs.user_id 
WHERE
    cs.user_id IS NULL
;
