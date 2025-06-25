/*
Аналитики хотят разделять истории (таблица stories) на популярные и не популярные. Популярными считаются истории, набравшие более 1000 просмотров.

Получите необходимые данные из таблицы stories и добавьте к выводу с помощью условия IF поле is_popular, в котором может быть только 2 варианта значений: "popular" или "not popular" в зависимости от количества просмотров, указанного в поле views_count.

 

Выводить нужно только указанные поля:

id
views_count
is_popular

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

SELECT id, views_count, IF( views_count > 1000, 'popular', 'not popular' ) AS is_popular
FROM stories;
