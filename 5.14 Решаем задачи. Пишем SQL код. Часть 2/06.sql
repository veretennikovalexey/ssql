/*
Узнайте: сколько лайков собрала каждая история пользователя номер 2. Информацию можно взять из таблицы stories_likes.

Результат отсортируйте по убыванию количества лайков.

Важное упрощение: в данной задаче мы не учитываем истории, которые не получили ни одного лайка.

 

Отобразить нужно только следующие поля:

id в таблице stories
количество лайков
 

В задаче используйте объединение таблиц (JOIN).
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

SELECT stories.id, COUNT( stories_likes.id ) AS likes_count
FROM stories
LEFT OUTER JOIN stories_likes
ON stories.id = stories_likes.story_id
WHERE stories.user_id = 2 AND stories_likes.id IS NOT NULL
GROUP BY stories.id
ORDER BY likes_count DESC; 