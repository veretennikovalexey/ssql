/*
Оказалось, что данных из таблицы users недостаточно в нашем представлении. Остальные данные о пользователях находятся в таблице user_settings. Необходимо ее присоединить (операцией INNER JOIN) к общей выборке.

Одной командой (!) пересоздайте представление v_users_without_phone из прошлого задания, присоединив по внешнему ключу к общей выборке таблицу user_settings.

 

Выводить необходимо также все поля общей выборки (можно звездочкой).

Также необходимо поменять условие фильтрации: теперь нас интересуют пользователи, у которых указана дата рождения (в поле birthday есть какое-то значение).
*/

CREATE TABLE users(
	id 			 BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	firstname VARCHAR(100),
	lastname VARCHAR(100) COMMENT 'фамилия',
	login VARCHAR(100),
	birthday DATE DEFAULT NULL,
	email VARCHAR(100) UNIQUE,
	password_hash VARCHAR(256),
	phone BIGINT UNSIGNED UNIQUE, 
	
	INDEX idx_users_username(firstname, lastname)
) COMMENT 'пользователи';

CREATE TABLE user_settings(
	user_id BIGINT UNSIGNED NOT NULL PRIMARY KEY,
	is_premium_account BIT,
	is_night_mode_enabled BIT,
	color_scheme ENUM('classic', 'day', 'tinted', 'night'),
	app_language ENUM('english', 'french', 'russian', 'german', 'belorussian', 'croatian', 'dutch'),
	status_text VARCHAR(70),
	notifications_and_sounds JSON,
	created_at DATETIME DEFAULT NOW(),

	FOREIGN KEY (user_id) REFERENCES users(id) # внешний ключ
);

CREATE OR REPLACE VIEW v_users_without_phone AS
    SELECT *
    FROM users
	    INNER JOIN user_settings
	    ON users.id = user_settings.user_id
    WHERE birthday IS NOT NULL;
