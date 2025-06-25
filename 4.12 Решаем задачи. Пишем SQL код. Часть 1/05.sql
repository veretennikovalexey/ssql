/*
Решено ввести ограничение на минимальную длину в имени каналов (3 символа). Для начала необходимо провести аналитику и узнать: сколько каналов в БД с именами в 1 или 2 символа.

Напишите запрос, выводящий количество записей в таблице channels, у которых в имени (поле title) менее 3 символов.

 

Вид таблицы channels:


Подсказка
        Можно использовать оператор LIKE в фильтрации WHERE либо встроенную функцию LENGTH
*/

CREATE TABLE channels (
	id SERIAL, # идентификатор канала
	title VARCHAR(45), # название канала
	icon VARCHAR(45),
	invite_link VARCHAR(100),
	settings JSON,
	owner_user_id BIGINT UNSIGNED NOT NULL, # ссылка на владельца канала
	is_private BIT,
    created_at DATETIME DEFAULT NOW(), # дата создания канала
	
    FOREIGN KEY (owner_user_id) REFERENCES users (id)    
);

SELECT count( * )
FROM channels 
WHERE title like '_' OR
      title like '__'; 
 
