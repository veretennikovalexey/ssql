/*
Работаем с БД telegram, созданной на уроках в этом курсе.

 

Вернемся к ситуации в конце урока "2.8 Таблицы-справочники", когда мы забыли указать в таблице stories_likes внешние ключи.

Напишите код, который добавляет внешний ключ в таблицу stories_likes. Поле user_id должно ссылаться на users(id).

Имеются  таблицы: users, stories, stories_likes
*/
CREATE TABLE users(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(100),
    lastname VARCHAR(100) COMMENT 'фамилия',
    login VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password_hash VARCHAR(256),
    phone BIGINT UNSIGNED UNIQUE, 
    INDEX idx_users_username(firstname, lastname)
) COMMENT 'пользователи';

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
    story_id BIGINT UNSIGNED NOT NULL,
    user_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME DEFAULT NOW()
);

ALTER TABLE `stories_likes`
ADD CONSTRAINT fk_stories_likes_user_id
FOREIGN KEY (user_id) REFERENCES users(id);


