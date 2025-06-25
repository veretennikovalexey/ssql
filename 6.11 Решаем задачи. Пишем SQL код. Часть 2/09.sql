/*
В базе данных есть следующие таблицы:

Необходимо написать триггер, который при удалении строки из таблицы users, создает запись об этом событии в таблице logs.
*/

CREATE TABLE users(
	id SERIAL,
	firstname VARCHAR(100),
	lastname VARCHAR(100),
	login VARCHAR(100),
	email VARCHAR(100) UNIQUE,
	password_hash VARCHAR(256),
	phone BIGINT UNSIGNED UNIQUE,
	birthday date DEFAULT NULL,
	is_active BIT,
	
	INDEX idx_users_username(firstname, lastname)
) COMMENT 'пользователи';

CREATE TABLE logs(
	id SERIAL,
	value VARCHAR(10000),
	created_at DATETIME DEFAULT NOW()
) COMMENT 'журнал событий';

DELIMITER __

CREATE TRIGGER after_user_delete
AFTER DELETE ON users FOR EACH ROW
BEGIN
    INSERT INTO logs (value) VALUES('The user has been deleted.');
END__ 

