/*
Добавим немного вычислений к прошлой выборке. Аналитики хотят знать: сколько записей достигли или перешагнули порог популярности в 1000 просмотров, а сколько - нет.

Напишите запрос, выводящий количество популярных и количество не популярных записей в соответствии с указанными критериями (1000 просмотров).

Используйте оператор IF для обозначения условия.

Подсказка
Воспользуйтесь группировкой 

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

SELECT count( * ), IF( views_count > 1000, 'popular', 'not popular' ) is_popular
FROM stories 
GROUP BY is_popular;