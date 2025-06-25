/*
В процессе миграции на новое железо возникла задача: проверить данные на отсутствие коллизий.

Проверьте: есть ли в таблице stories_likes строки, ссылающиеся значением в поле story_id на несуществующие stories.

Подсказка
Нужно убедиться, что таких строк нет.

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

SELECT stories_likes.story_id
FROM stories_likes
LEFT OUTER JOIN stories
ON stories_likes.story_id = stories.id
WHERE stories.id IS NULL;