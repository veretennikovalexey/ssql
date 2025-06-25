/*
После получения результатов предыдущего набора данных начальство сказало, что там слишком много лишней информации. И определило четкий набор полей, который нужно вернуть в выборке.

Поэтому появилось дополнение к предыдущей задаче: вывести первые 5 записей в таблице channels, отсортированные по дате создания (поле created_at). 

В результате необходимо оставить только следующие поля:

идентификатор канала
название канала
ссылку на владельца канала (его идентификатор)
дата создания канала
 

Вид таблицы channels:
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

SELECT id, title, owner_user_id, created_at   
FROM channels 
ORDER BY created_at
LIMIT 5;