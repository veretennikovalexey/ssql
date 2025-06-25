/*
Работаем с БД telegram, созданной на уроках в этом курсе.

 

Программисты решили переименовать в таблице private_messages колонку body в message_text.

Напишите соответствующий SQL запрос.
*/

ALTER TABLE private_messages
RENAME COLUMN body TO `message_text`;