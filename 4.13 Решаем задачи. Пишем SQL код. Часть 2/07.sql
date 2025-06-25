/*
Теперь выведем следующие 10 пользователей, отсортированные в том же порядке.

Напишите запрос, выводящий 10 строк из таблицы users (все поля), отсортированные по фамилии (поле lastname), пропустив при этом первые 10 строк.

 

Вид таблицы users:
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

SELECT *
FROM users
ORDER BY lastname 
LIMIT 10 OFFSET 10;
