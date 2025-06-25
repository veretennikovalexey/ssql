/*
К предыдущей выборке добавьте язык приложения пользователя.

Необходимое поле app_language в таблице user_settings.

Задачу решите с помощью скоррелированного вложенного запроса.

Отобразить нужно только следующие поля:

lastname (фамилия)
firstname (имя)
birthday (дата рождения)
app_language (язык приложения)
 

Вид таблицы users:
Вид таблицы user_settings:
*/

CREATE TABLE users(
	id 			 BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	firstname VARCHAR(100), # имя
	lastname VARCHAR(100) COMMENT 'фамилия',
	login VARCHAR(100),
	email VARCHAR(100) UNIQUE,
	password_hash VARCHAR(256),
	phone BIGINT UNSIGNED UNIQUE,
	birthday date DEFAULT NULL # дата рождения
	
	INDEX idx_users_username(firstname, lastname)
) COMMENT 'пользователи';

CREATE TABLE user_settings(
	user_id BIGINT UNSIGNED NOT NULL PRIMARY KEY,
	is_premium_account BIT,
	is_night_mode_enabled BIT,
	color_scheme ENUM('classic', 'day', 'tinted', 'night'),
	app_language ENUM('english', 'french', 'russian', 'german', 'belorussian', 'croatian', 'dutch'), # язык приложения
	status_text VARCHAR(70),
	notifications_and_sounds JSON,
	created_at DATETIME DEFAULT NOW()
);

# Задачу решите с помощью скоррелированного вложенного запроса
SELECT 
    lastname,
    firstname, 
    birthday,
    (SELECT app_language FROM user_settings WHERE user_id = users.id) AS 'app_language'
FROM
    users 
WHERE 
    email = 'mgoyette@example.org';
