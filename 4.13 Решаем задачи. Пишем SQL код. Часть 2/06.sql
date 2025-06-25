/*
Аналитики где-то в своем интерфейсе выводят список пользователей, отсортированный по алфавиту. Показывать будем по 10 строк.

Напишите запрос, выводящий первые 10 строк из таблицы users, отсортированные по фамилии (поле lastname).

Выводить необходимо только следующие поля (именно в указанном порядке):

id
firstname
lastname
 

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

SELECT id, firstname, lastname 
FROM users
ORDER BY lastname 
LIMIT 10;
