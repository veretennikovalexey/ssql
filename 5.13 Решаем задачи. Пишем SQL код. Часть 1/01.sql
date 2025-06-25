/*
Начнем с простого.

Известен почтовый адрес пользователя (email). Нужно показать его фамилию, имя и дату рождения.

Выведите из таблицы users строку, у которой email = 'mgoyette@example.org'.

Отобразить нужно только следующие поля:

фамилия
имя
дата рождения
 

Вид таблицы users:
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

SELECT 
    lastname,
    firstname, 
    birthday
FROM
    users AS u
WHERE 
    email = 'mgoyette@example.org';