/*
И для закрепления результата решим задачу в общем виде.

Выведите 7-ю страницу с пользователями. Количество строк, по-прежнему, 10 штук на каждой странице. Сортировка прежняя: по фамилии.

Используйте звездочку для вывода всех полей таблицы.

 

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
LIMIT 10 OFFSET 60;
