/*
Необходимо узнать: какое количество просмотров историй (суммарно) набрал каждый пользователь.

Результат отсортируйте по номеру пользователя (поле user_id).

 

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

SELECT user_id, SUM( views_count ) views_per_user
FROM stories 
GROUP BY user_id
ORDER BY user_id;