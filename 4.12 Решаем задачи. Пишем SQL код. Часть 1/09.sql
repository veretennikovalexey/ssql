/*
Собираем аналитику по историям. Нужно вычислить суммарное количество просмотров всех сториз.

Напишите запрос, выводящий сумму всех значений в поле views_count таблицы stories.

 

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

SELECT SUM( views_count )
FROM stories; 
