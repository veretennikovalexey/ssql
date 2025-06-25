/*
Выведите все истории (таблица stories) пользователя номер 2 и отсортируйте результат по количеству просмотров (поле views_count) по убыванию.

К выборке необходимо добавить фамилию и имя пользователя из таблицы users.

Отобразить нужно только следующие поля:

users.id
stories.id
views_count
created_at
firstname
lastname
 

В задаче используйте объединение таблиц (JOIN).
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
    u.id AS user_id,
    s.id AS story_id,
    s.views_count,
    s.created_at,
    u.firstname,
    u.lastname
FROM stories AS s
LEFT OUTER JOIN users AS u
ON s.user_id = u.id
WHERE s.user_id = 2
ORDER BY s.views_count DESC 