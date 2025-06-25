/*
Теперь узнайте: сколько каналов установили какую-либо иконку.

Напишите запрос к таблице channels., возвращающий количество строк, у которых в поле icon присутствует любое значение.

 

Вид таблицы channels:
*/

CREATE TABLE channels (
	id SERIAL,
	title VARCHAR(45),
	icon VARCHAR(45), # иконка канала
	invite_link VARCHAR(100),
	settings JSON,
	owner_user_id BIGINT UNSIGNED NOT NULL,
	is_private BIT,
    created_at DATETIME DEFAULT NOW(), # дата создания канала
	
    FOREIGN KEY (owner_user_id) REFERENCES users (id)    
);

SELECT COUNT(*)
FROM channels
WHERE icon IS NOT NULL;
