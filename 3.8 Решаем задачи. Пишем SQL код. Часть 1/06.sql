/*
Работаем с БД telegram, созданной на уроках в этом курсе.

 

Пользователь номер 15 (таблица users) поменял название своего канала номер 35 (таблица channels) на "Все про SQL". Необходимо обновить поле title в соответствующей строке таблицы channels.

 

Вид таблицы channels:
*/

CREATE TABLE `channels` (
  `id` SERIAL,
  `title` varchar(45) DEFAULT NULL, # название канала
  `icon` varchar(45) DEFAULT NULL,
  `invite_link` varchar(100) DEFAULT NULL,
  `settings` JSON,
  `owner_user_id` BIGINT UNSIGNED NOT NULL, # владелец канала
  `is_private` BIT,
  `created_at` DATETIME DEFAULT NOW(),
	
   FOREIGN KEY (owner_user_id) REFERENCES users (id)
);

UPDATE channels 
SET title = 'Все про SQL'
WHERE owner_user_id = 15 and id = 35;

