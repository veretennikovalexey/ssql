/*
Аналитики хотят проанализировать частоту использования каждого эмодзи (реакции).

Напишите запрос, выводящий количество использования каждой реакции в личных сообщениях. Сколько раз встречается каждый reaction_id в таблице private_message_reactions?

Выборку отсортировать по убыванию количества строк.

 

Вид таблицы private_message_reactions:
*/

CREATE TABLE private_message_reactions (
	reaction_id BIGINT UNSIGNED NOT NULL, # ссылка на реакцию
	message_id BIGINT UNSIGNED NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(),

	FOREIGN KEY (reaction_id) REFERENCES reactions_list (id),
	FOREIGN KEY (message_id) REFERENCES private_messages (id),	
	FOREIGN KEY (user_id) REFERENCES users (id)		
);

SELECT DISTINCT
    COUNT( * ) OVER 
        (PARTITION BY reaction_id)
    AS count,    
    reaction_id
FROM private_message_reactions
ORDER BY count DESC;