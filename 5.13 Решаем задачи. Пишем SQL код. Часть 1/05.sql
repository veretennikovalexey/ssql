/*
Простая задача (далее будем ее усложнять).

Выведите все истории (таблица stories) пользователя номер 2 и отсортируйте результат по количеству просмотров (поле views_count) по убыванию.

Отобразить нужно только следующие поля:

id
views_count
created_at
 

Таблица stories имеет вид:
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

SELECT
	id,
	views_count,
	created_at
FROM
	stories
WHERE
	user_id = 2
ORDER BY 
	views_count DESC;