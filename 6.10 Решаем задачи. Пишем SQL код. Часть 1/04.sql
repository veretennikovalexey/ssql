/*
Создайте представление v_users_without_phone (название важно для проверки!), которое выводит все поля таблицы users и содержит только те строки, в которых не указан телефон (поле phone пустое).

Таблица users имеет вид:

Спойлер
Напишите только 1 команду создания нужного представления
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

CREATE VIEW v_users_without_phone AS
    SELECT id, firstname, lastname, login, email, password_hash, phone
    FROM users
    WHERE phone IS NULL;

