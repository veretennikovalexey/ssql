/*
Аналитики хотят знать дату (и время) самой последней сториз.

Выведите наибольшую дату (только поле created_at) из таблицы stories.

Используйте агрегирующую функцию для вычисления наибольшей даты создания записи в таблице историй

 

Таблица stories имеет вид:
*/

CREATE TABLE stories (
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL, # номер пользователя, запостившего историю
	caption VARCHAR(140),
	filename VARCHAR(100),
	views_count INT UNSIGNED,
	created_at DATETIME DEFAULT NOW(), # дата создания истории
	
	FOREIGN KEY (user_id) REFERENCES users (id)		
);

SELECT MAX( created_at )
FROM stories;

