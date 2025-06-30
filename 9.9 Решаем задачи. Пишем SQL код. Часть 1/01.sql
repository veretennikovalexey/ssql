/*
Создать дублирующее поле is_premium_account в таблице users
Скопировать UPDATE запросом данные этого поля из таблицы user_settings в таблицу users
Удалить поле is_premium_account из таблицы user_settings
*/


ALTER TABLE users ADD COLUMN is_premium_account BIT;

UPDATE users u
JOIN user_settings us ON u.id = us.user_id 
SET u.is_premium_account = us.is_premium_account;

ALTER TABLE user_settings DROP COLUMN is_premium_account;

-- ниже до изменения

CREATE TABLE users(
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	firstname VARCHAR(100),
	lastname VARCHAR(100),
	login VARCHAR(100),
	email VARCHAR(100) UNIQUE,
	password_hash VARCHAR(256),
	phone BIGINT UNSIGNED UNIQUE,
	birthday date DEFAULT NULL,  # дата рождения
	is_active BIT,
	
	INDEX idx_users_username(firstname, lastname)
) COMMENT 'пользователи';


​CREATE TABLE user_settings(
	user_id BIGINT UNSIGNED NOT NULL PRIMARY KEY, # внешний ключ, ссылающийся на users.id
	is_premium_account BIT, # флаг премиум аккаунта
	is_night_mode_enabled BIT,
	color_scheme ENUM('classic', 'day', 'tinted', 'night'),
	app_language ENUM('english', 'french', 'russian', 'german', 'belorussian', 'croatian', 'dutch'),
	status_text VARCHAR(70),
	notifications_and_sounds JSON,
	created_at DATETIME DEFAULT NOW()
);


-- Было обнаружено, что на сервере часто исполняется запрос следующего вида:

SET @user_number = 11;

SELECT 
	users.id,
	users.birthday,
	user_settings.is_premium_account
FROM users
JOIN user_settings ON users.id = user_settings.user_id 
WHERE id = @user_number;


/*
Чтобы избежать постоянно выполняющегося объединения таблиц (JOIN) в таких запросах, было решено перенести поле is_premium_account в таблицу users.

 

Требование о переносе поля реализуется в несколько шагов:



Напишите соответствующий SQL код.

*/