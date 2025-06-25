/*
Работаем с БД telegram, созданной на уроках в этом курсе.

 

Обнаружен баг. В таблице каналов (channels) появляются записи с пустыми названиями (поле title).

Для решения проблемы необходимо запретить отсутствие значений в поле title.

Напишите 1 запрос, добавляющий свойство NOT NULL для данного поля. Размерность поля - 45 символов (менять не нужно).

 

Текущее определение таблицы channels:
*/

CREATE TABLE channels (
    id SERIAL,
    title VARCHAR(45),
    icon VARCHAR(45),
    invite_link VARCHAR(100),
    settings JSON,
    owner_user_id BIGINT UNSIGNED NOT NULL,
    is_private BIT,
    created_at DATETIME DEFAULT NOW(),
    
    FOREIGN KEY (owner_user_id) REFERENCES users (id)
);

ALTER TABLE `channels`
MODIFY COLUMN `title` VARCHAR(45) NOT NULL;
