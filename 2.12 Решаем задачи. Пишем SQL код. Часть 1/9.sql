/*
Работаем с БД telegram, созданной на уроках в этом курсе.

 

В таблице users обнаружены записи с одинаковыми email. Админы удалят дубликаты. Но чтобы это не повторилось в будущем, необходимо сделать поле уникальным.

Напишите 1 запрос, добавляющий ограничение UNIQUE на поле email в таблице users.

 

Текущее определение таблицы users:
*/

CREATE TABLE users(
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    firstname VARCHAR(100),
    lastname VARCHAR(100) COMMENT 'фамилия',
    email VARCHAR(100),
    password_hash VARCHAR(256),
    phone BIGINT UNSIGNED UNIQUE, 
    
    INDEX idx_users_username(firstname, lastname)
) COMMENT 'пользователи';

ALTER TABLE `users`
MODIFY COLUMN `email` VARCHAR(100) UNIQUE;
