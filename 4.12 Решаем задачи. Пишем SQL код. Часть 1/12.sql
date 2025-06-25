/*
Выведите список публичных (поле is_private = 0) групп (таблица groups), отсортированных по алфавиту.

Отобразить необходимо только следующие поля таблицы:

id
title (первые 30 символов - см. подсказку ниже)
is_private
 

Важно. При обращении к таблице `groups` используйте обратные кавычки, иначе будут ошибки при исполнении кода. Это связано с тем, что само слово groups является зарезервированным в SQL.

Подсказка
Для ограничения количества символо в поле title используйте функцию SUBSTRING или LEFT. 

Вид таблицы groups:
*/

CREATE TABLE `groups` (
	id SERIAL, # идентификатор
	title VARCHAR(45), # название канала
	icon VARCHAR(45),
	invite_link VARCHAR(100),
	settings JSON,
	owner_user_id BIGINT UNSIGNED NOT NULL,
	is_private BIT, # флаг приватности
    created_at DATETIME DEFAULT NOW(), # дата создания канала
	
    FOREIGN KEY (owner_user_id) REFERENCES users (id)    
);

SELECT id, LEFT( title, 30 ), is_private
FROM `groups`
WHERE NOT is_private 
ORDER BY title;
