/*
Теперь к предыдущей выборке добавьте суммарное количество лайков, которое получила каждая история.

Используя вложенный запрос, добавьте поле с подсчитанным количеством лайков у каждой истории. Информацию можно взять из таблицы stories_likes.

 

Учитывайте порядок вывода полей, чтобы он соответствовал ожидаемому результату на скриншоте ниже. 
*/

CREATE TABLE stories_likes (
	id SERIAL,
	story_id BIGINT UNSIGNED NOT NULL, # ссылка на историю
	user_id BIGINT UNSIGNED NOT NULL, # ссылка на пользователя, поставившего лайк
	created_at DATETIME DEFAULT NOW(),

	FOREIGN KEY (user_id) REFERENCES users (id),		
	FOREIGN KEY (story_id) REFERENCES stories (id)		
);

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
	(SELECT lastname FROM users WHERE id = stories.user_id) AS 'lastname',
	(SELECT COUNT( * ) FROM stories_likes WHERE story_id = stories.id) AS 'count'
FROM
	stories
WHERE
	user_id = 2
ORDER BY 
	views_count DESC;
