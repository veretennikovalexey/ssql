/*
Таблица users имеет вид:

CREATE TABLE users(
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	firstname VARCHAR(100),
	lastname VARCHAR(100),
	login VARCHAR(100),
	email VARCHAR(100), # электронная почта пользователя
	password_hash VARCHAR(256),
	phone BIGINT UNSIGNED UNIQUE,
	birthday date DEFAULT NULL,
	is_active BIT,
	
	INDEX idx_users_username(firstname, lastname)
) COMMENT 'пользователи';
 

В логи для запросов, не использующих индексы, регулярно попадают запросы вида:

SELECT *
FROM users
WHERE email = 'some_email@mail.ru';
 

Необходимо решить данную проблему, т.к. такие запросы исполняются медленно и создают нагрузку на сервер.

 

Напишите код, который устранит появление указанных SELECT запросов в логах.

 

Подсказка
Добавьте соответствующий индекс
Введите SQL запрос
*/

ALTER TABLE users ADD INDEX idx_users_email( email );