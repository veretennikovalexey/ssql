/*
Аналитики хотят знать: какая реакция (эмодзи) самая популярная вне зависимости от того, где она использовалась (сообщения в каналах, в группах, в личных сообщениях).

Подсчитайте суммарное количество реакций каждого типа, которые использовались во всех сообщениях (во всех таблицах).

Отсортируйте результат по идентификатору реакции (поле reaction_id).

Порядок полей важен для проверки (ниже скрин ожидаемого результата): сначала идентификатор реакции, затем количество его использований.

Подсказка
Используйте соединение UNION ALL всех трех таблиц с реакциями
*/

CREATE TABLE reactions_list (
	id SERIAL,
	code VARCHAR(1) # тип реакции, ее код
)DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE private_message_reactions (
	reaction_id BIGINT UNSIGNED NOT NULL, # ссылка на реакцию (эмодзи)
	message_id BIGINT UNSIGNED NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(),

	FOREIGN KEY (reaction_id) REFERENCES reactions_list (id),
	FOREIGN KEY (message_id) REFERENCES private_messages (id),	
	FOREIGN KEY (user_id) REFERENCES users (id)		
);

CREATE TABLE channel_message_reactions (
	reaction_id BIGINT UNSIGNED NOT NULL, # ссылка на реакцию (эмодзи)
	message_id BIGINT UNSIGNED NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(),

	FOREIGN KEY (reaction_id) REFERENCES reactions_list (id),
	FOREIGN KEY (message_id) REFERENCES channel_messages (id),	
	FOREIGN KEY (user_id) REFERENCES users (id)	
);

CREATE TABLE group_message_reactions (
	reaction_id BIGINT UNSIGNED NOT NULL, # ссылка на реакцию (эмодзи)
	message_id BIGINT UNSIGNED NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(),

	FOREIGN KEY (reaction_id) REFERENCES reactions_list (id),
	FOREIGN KEY (message_id) REFERENCES group_messages (id),	
	FOREIGN KEY (user_id) REFERENCES users (id)	
);

SELECT reaction_id, count( * )
FROM

( SELECT reaction_id, 1
FROM private_message_reactions 
    UNION ALL
SELECT reaction_id, 1
FROM channel_message_reactions 
    UNION ALL
SELECT reaction_id, 1
FROM group_message_reactions
) AS reactions    

GROUP BY reaction_id
ORDER BY reaction_id;
