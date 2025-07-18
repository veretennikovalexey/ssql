/*
Необходимо узнать фамилию и имя всех пользователей, у которых приложение на русском языке.

Используйте вложенный запрос для фильтрации.

Выведите поля firstname и lastname таблицы users, но только для тех пользователей, у кого в поле app_language таблицы user_settings установлено значение 'russian'. Дополнительно отсортируйте результаты по фамилии.

 

 Отобразить нужно только следующие поля:

имя
фамилия
 
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

# Используйте вложенный запрос для фильтрации
SELECT 
    firstname,
    lastname
FROM 
    users
WHERE id in ( SELECT user_id FROM user_settings WHERE app_language = 'russian' )
ORDER BY lastname ;
