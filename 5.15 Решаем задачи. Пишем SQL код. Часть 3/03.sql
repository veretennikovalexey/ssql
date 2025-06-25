/*
Менеджеры попросили сделать выборку из предыдущей задачи более информативной. А именно: вместо идентификатора канала необходимо отображать его название (поле title таблицы channels). 

Отобразить необходимо только следующие поля:

users.firstname
users.lastname
channels.title
 

Для получения данных используйте объединение трех таблиц (JOIN):

users,
channel_subscribers,
channels
 

Учитывайте также статус подписки (поле status = 'joined').

Отсортируйте результат по номеру канала.
*/

CREATE TABLE users(
	id 			 BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
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

CREATE TABLE channels (
	id SERIAL,
	title VARCHAR(45), # название канала
	icon VARCHAR(45),
	invite_link VARCHAR(100),
	settings JSON,
	owner_user_id BIGINT UNSIGNED NOT NULL,
	is_private BIT,
    created_at DATETIME DEFAULT NOW(), # дата создания канала
	
    FOREIGN KEY (owner_user_id) REFERENCES users (id)    
);

SELECT 
    u.firstname, 
    u.lastname,
    c.title 
FROM users AS u
JOIN channel_subscribers AS cs ON u.id = cs.user_id
JOIN channels AS c ON cs.channel_id = c.id
WHERE u.id = 11 and cs.status = 'joined' 
ORDER BY cs.channel_id;