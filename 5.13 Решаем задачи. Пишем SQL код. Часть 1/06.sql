/*
К предыдущей выборке необходимо добавить фамилию и имя пользователя

Используя вложенные запросы, добавьте следующие поля (из таблицы users) к результатам выборки:

firstname
lastname
*/

CREATE TABLE stories (
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL, # номер пользователя, запостившего историю
	caption VARCHAR(140),
	filename VARCHAR(100),
	views_count INT UNSIGNED, # количество просмотров
	created_at DATETIME DEFAULT NOW(), # дата создания истории
	
	FOREIGN KEY (user_id) REFERENCES users (id)		
);

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
	id,
	views_count,
	created_at,
	(SELECT firstname FROM users WHERE id = stories.user_id) AS 'name',
	(SELECT lastname FROM users WHERE id = stories.user_id) AS 'lastname'
FROM
	stories
WHERE
	user_id = 2
ORDER BY 
	views_count DESC;