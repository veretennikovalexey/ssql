/*
У пользователя номер 1 есть в контактах пользователи номер 22, 33, 44, 55, 66. Наш пользователь (номер 1) просматривает сториз своих контактов.

Напишите запрос, выводящий сториз пользователей номер 22, 33, 44, 55, 66 в хронологическом порядке.

Для задания номеров используйте конструкцию WHERE ... IN.

 

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

SELECT * 
FROM stories 
WHERE user_id IN ( 22, 33, 44, 55, 66 )
ORDER BY created_at ;