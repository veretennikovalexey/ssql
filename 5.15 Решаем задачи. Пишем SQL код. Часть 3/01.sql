/*
Выведите пользователя (таблица users) номер 11 вместе со списком идентификаторов каналов (таблица channel_subscribers), на которые он подписан. Учитывайте также статус подписки (поле status = 'joined').

Отобразить необходимо только следующие поля:

users.firstname
users.lastname
channel_subscribers.channel_id
 

Используйте объединение таблиц (JOIN) для получение данных.

Отсортируйте результат по номеру канала.
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
	status ENUM('requested', 'joined', 'left'), # статус подписки
  	created_at DATETIME DEFAULT NOW(),
  	updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP,

  	FOREIGN KEY (user_id) REFERENCES users (id),
  	FOREIGN KEY (channel_id) REFERENCES channels (id)
);

SELECT users.firstname, users.lastname, channel_subscribers.channel_id
FROM users
JOIN channel_subscribers
ON users.id = channel_subscribers.user_id
WHERE users.id = 11 and channel_subscribers.status = 'joined'
ORDER BY channel_subscribers.channel_id;
