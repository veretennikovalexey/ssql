/*
Начальство хочет поощрить "пионеров" в создании каналов. И просит предоставить список из 5 самых первых (по дате создания) каналов.

Выведите первые 5 записей (все поля) в таблице channels , отсортированные по дате создания (поле created_at).

 

Вид таблицы channels:
*/

CREATE TABLE channels (
	id SERIAL,
	title VARCHAR(45), # название канала
	icon VARCHAR(45),
	invite_link VARCHAR(100),
	settings JSON,
	owner_user_id BIGINT UNSIGNED NOT NULL,
	is_private BIT,
    created_at DATETIME DEFAULT NOW(), # дата создания канала
	
    FOREIGN KEY (owner_user_id) REFERENCES users (id)    
);

SELECT *
FROM channels 
ORDER BY created_at
LIMIT 5;

