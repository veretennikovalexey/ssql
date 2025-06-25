/*
Объявите пользовательскую переменную user_stories_count, сохраните в нее количество записей в таблице stories, которые относятся к пользователю номер 1 (поле user_id определяет автора истории). После этого выведите значение переменной с помощью SELECT запроса.

 

Определение таблицы stories:

 

Подсказка
Придется исполнить несколько команд:
Сначала объявите пользовательскую переменную
Затем присвойте ей значение из запроса
И верните значение переменной на экран
*/

CREATE TABLE `stories` (
  `id` SERIAL,
  `user_id` bigint(20) unsigned NOT NULL, # автор истории
  `caption` varchar(140) DEFAULT NULL,
  `filename` varchar(100) DEFAULT NULL,
  `views_count` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  
  FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
);

SELECT
    COUNT( * )
INTO
    @user_stories_count
FROM
    stories
WHERE
    user_id = 1;

SELECT
    @user_stories_count;

