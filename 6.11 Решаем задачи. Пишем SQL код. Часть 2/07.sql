/*
Мы восстанавливаем БД из дампа в тестовой среде. По всей видимости, дамп содержит несогласованные данные по внешним ключам. Но  для нас это не принципиально, потому что это не продакшн среда.

Мы принимаем решение воспользоваться "грязным хаком", а именно: выполнить нужную операцию с временным отключением проверки внешних ключей в нашей сессии.

Есть часть дампа (код вызывает ошибку):

Вам необходимо:

Предварительно отключить проверку внешних ключей
Исполнить приведенный фрагмент дампа (чтобы он смог успешно создать обе таблицы и добавить 5 записей в таблицу user_settings)
Включить проверку внешних ключей
*/

CREATE TABLE users(
	id serial,
	firstname VARCHAR(100),
	lastname VARCHAR(100) COMMENT 'фамилия',
	login VARCHAR(100),
	email VARCHAR(100) UNIQUE,
	password_hash VARCHAR(256),
	phone BIGINT UNSIGNED UNIQUE
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

	FOREIGN KEY (user_id) REFERENCES users(id) # внешний ключ, причина ошибки
);

INSERT INTO `user_settings` VALUES
(1,'','','tinted','belorussian','Explicabo quod la sit non tem',NULL,'1987-12-07 21:42:18'),
(2,'','','day','english','Perspiciatis iarchitecto co',NULL,'2022-05-26 20:28:59'),
(3,'','','classic','german','Voluptates facilis dolores a',NULL,'1970-02-13 11:19:50'),
(4,'','','classic','russian','Aut autunt hic illo. Est',NULL,'1972-12-12 09:25:45'),
(5,'','','classic','russian','Est est c. Quia labo',NULL,'2008-01-15 04:10:44');


-- ниже моё решение

SET foreign_key_checks = 0;

CREATE TABLE users(
	id serial,
	firstname VARCHAR(100),
	lastname VARCHAR(100) COMMENT 'фамилия',
	login VARCHAR(100),
	email VARCHAR(100) UNIQUE,
	password_hash VARCHAR(256),
	phone BIGINT UNSIGNED UNIQUE
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

	FOREIGN KEY (user_id) REFERENCES users(id) # внешний ключ, причина ошибки
);

INSERT INTO `user_settings` VALUES
(1,'','','tinted','belorussian','Explicabo quod la sit non tem',NULL,'1987-12-07 21:42:18'),
(2,'','','day','english','Perspiciatis iarchitecto co',NULL,'2022-05-26 20:28:59'),
(3,'','','classic','german','Voluptates facilis dolores a',NULL,'1970-02-13 11:19:50'),
(4,'','','classic','russian','Aut autunt hic illo. Est',NULL,'1972-12-12 09:25:45'),
(5,'','','classic','russian','Est est c. Quia labo',NULL,'2008-01-15 04:10:44');

SET foreign_key_checks = 1;





