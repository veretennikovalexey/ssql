/*
Добавляем логику к предыдущему заданию.

От прошлой выборки необходимо оставить топ 5 пользователей, которые набрали наибольшее количество суммарных просмотров.

 

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

WITH _ AS
(
SELECT DISTINCT
    SUM( views_count ) OVER
    (PARTITION BY user_id)
    AS views_per_user,
    user_id
FROM 
    stories
ORDER BY   
    views_per_user DESC
)
SELECT views_per_user, user_id
FROM _
LIMIT 5;