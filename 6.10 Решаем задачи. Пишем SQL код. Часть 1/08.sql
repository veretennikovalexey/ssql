/*
В таблицах сообщений (saved_messages, private_messages,) появляются записи с пустым полем body (сообщения без текста). Решено удалять такие сообщения процедурой.

Напишите хранимую процедуру с названием remove_empty_messages (название важно для проверки!), которая удаляет все строки из указанных таблиц, у которых в поле body отсутствует значение (NULL).
*/

CREATE PROCEDURE remove_empty_messages()
BEGIN
    DELETE FROM saved_messages WHERE body IS NULL;
    DELETE FROM private_messages WHERE body IS NULL;    
END