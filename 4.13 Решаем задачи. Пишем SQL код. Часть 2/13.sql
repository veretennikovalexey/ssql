/*
Теперь решите эту же задачу с помощью конструкции ветвлений CASE-WHEN-THEN.

Вид таблицы stories:
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

SELECT count( * ),
    CASE
        WHEN views_count > 1000 THEN 'popular'
        WHEN views_count < 1000 THEN 'not popular'
    END AS is_popular
FROM stories 
GROUP BY is_popular;
