/*
Вспомним простые фильтрации.

В таблице channels:

есть каналы о языке SQL.

Выведите все записи из таблицы channels, у которых в поле title встречается слово 'sql'.

Отсортируйте выборку по полю title.

 

В результате необходимо оставить только следующие поля:

идентификатор канала
название канала
 

Ожидаемый результат:



 

Подсказка
Полнотекстового индекса на текущий момент ни на одном из полей таблицы нет.
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
WHERE title like '%sql%'
ORDER BY title;
