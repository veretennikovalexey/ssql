/*
Пользователь номер 5 создает публичный канал и называет его "Все про SQL".

Добавьте новую запись в таблицу channels, заполнив поля: владелец, название, приватность.

Общий вид таблицы:
*/

CREATE TABLE channels (
	id SERIAL,
	title VARCHAR(45), # название канала
	icon VARCHAR(45),
	invite_link VARCHAR(100),
	settings JSON,
	owner_user_id BIGINT UNSIGNED NOT NULL, # владелец канала
	is_private BIT, # приватность
    created_at DATETIME DEFAULT NOW(),
	
    FOREIGN KEY (owner_user_id) REFERENCES users (id)    
);

INSERT INTO channels 
SET
    owner_user_id = 5,
    title = 'Все про SQL',
    is_private = False
;  
