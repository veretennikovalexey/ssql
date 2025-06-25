/*
К хранимой процедуре из предыдущего задания необходимо добавить очистку еще 2 таблиц: channel_messages, group_messages.

В итоге очищать нужно "пустые сообщения" из 4 таблиц: saved_messages, private_messages, channel_messages, group_messages.

Перепишите хранимую процедуру с названием remove_empty_messages, которая удаляет все строки из указанных таблиц, у которых в поле body отсутствует значение (NULL).

Подсказка
Код должен содержать несколько команд.
Предварительно удалите существующую процедуру с проверкой
Удаляйте строки с пустым полем body (NULL)
*/

DROP PROCEDURE IF EXISTS remove_empty_messages;

CREATE PROCEDURE remove_empty_messages()
BEGIN
    DELETE FROM saved_messages WHERE body IS NULL;
    DELETE FROM private_messages WHERE body IS NULL;  
    DELETE FROM channel_messages WHERE body IS NULL;
    DELETE FROM group_messages WHERE body IS NULL;      
END

# saved_messages, private_messages, channel_messages, group_messages
