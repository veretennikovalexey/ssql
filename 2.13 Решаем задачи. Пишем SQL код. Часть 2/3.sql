/*
Теперь добавим новое поле language_id в таблицу user_settings.

На следующем шаге (не сейчас!) мы сделаем это поле внешним ключом, поэтому тип данных нового поля должен строго совпадать с полем id в таблице languages.
*/

ALTER TABLE `user_settings`
    ADD COLUMN `language_id` BIGINT UNSIGNED NOT NULL;
