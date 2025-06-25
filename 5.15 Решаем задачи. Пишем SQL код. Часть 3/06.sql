/*
Выведите список историй, которые не получили ни одного лайка.

Вывести необходимо только идентификаторы (поле id) записей в таблице stories.

Ипользуйте LEFT / RIGHT OUTER JOIN объединение таблиц с проверкой на NULL
*/

CREATE TABLE stories (
	id SERIAL,
	user_id BIGINT UNSIGNED NOT NULL,
	caption VARCHAR(140),
	filename VARCHAR(100),
	views_count INT UNSIGNED,
	created_at DATETIME DEFAULT NOW(),
	
	FOREIGN KEY (user_id) REFERENCES users (id)		
);

CREATE TABLE stories_likes (
	id SERIAL,
	story_id BIGINT UNSIGNED NOT NULL, # ссылка на историю
	user_id BIGINT UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT NOW(),
	
	# Foreign keys...
	FOREIGN KEY (user_id) REFERENCES users (id),		
	FOREIGN KEY (story_id) REFERENCES stories (id)		
);

SELECT stories.id
FROM stories 
LEFT OUTER JOIN stories_likes ON stories.id = stories_likes.story_id 
WHERE stories_likes.story_id IS NULL;