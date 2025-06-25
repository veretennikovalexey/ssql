/*
Теперь необходимо сделать поле language_id в таблице user_settings внешним ключом, ссылающимся на идентификатор строки в таблице languages.

Напишите соответствующий запрос.
*/

ALTER TABLE `user_settings`
    ADD FOREIGN KEY (`language_id`) REFERENCES `languages`(`id`);
