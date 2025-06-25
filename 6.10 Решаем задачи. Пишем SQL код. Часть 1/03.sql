/*
Теперь в таблице channels

есть  полнотекстовый индекс на поле title.

Значит, можно выполнять более сложные варианты поиска.

 

Используя полнотекстовый поиск, выведите все записи из таблицы channels, у которых в поле title встречается слово 'sql', но не встречается 'server'.

Отсортируйте выборку по полю title.

 

В результате необходимо оставить только следующие поля:

идентификатор канала
название канала
*/

CREATE TABLE channels (
	id SERIAL, # идентификатор канала
	title VARCHAR(45), # название канала
	icon VARCHAR(45),
	invite_link VARCHAR(100),
	settings JSON,
	owner_user_id BIGINT UNSIGNED NOT NULL,
	is_private BIT,
	created_at DATETIME DEFAULT NOW(), # дата создания канала
	
    FOREIGN KEY (owner_user_id) REFERENCES users (id)    
);

SELECT id, title 
FROM channels
WHERE match(title) AGAINST ('+sql -server' IN BOOLEAN MODE)
ORDER BY title;
