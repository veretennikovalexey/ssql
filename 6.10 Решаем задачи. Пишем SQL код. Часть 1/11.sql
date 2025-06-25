/*
Решено снова изменить логику работы процедуры remove_empty_messages. Теперь она должна удалять "пустые сообщения"  конкретного пользователя (отправителя сообщения). Идентификатор пользователя (user_number) должен передаваться в процедуру в качестве параметра с типом данных BIGINT UNSIGNED.

Перепишите соответствующим образом хранимую процедуру, чтобы она принимала параметр user_number и удаляла из всех таблиц сообщений (saved_messages, private_messages, channel_messages, group_messages) записи указанного пользователя, у которых  в поле body отсутствует значение (NULL).

отправитель: user_id	отправитель: sender_id	отправитель: sender_id	отправитель: sender_id

Подсказка
Код должен содержать несколько команд.
Предварительно удалите существующую процедуру с проверкой
Удаляйте строки с пустым полем body (NULL) и переданным номером пользователя
*/

DROP PROCEDURE IF EXISTS remove_empty_messages;

CREATE PROCEDURE remove_empty_messages(user_number BIGINT UNSIGNED)
BEGIN
    DELETE FROM saved_messages WHERE user_id = user_number AND body IS NULL;
    DELETE FROM private_messages WHERE sender_id = user_number AND body IS NULL;  
    DELETE FROM channel_messages WHERE sender_id = user_number AND body IS NULL;
    DELETE FROM group_messages WHERE sender_id = user_number AND body IS NULL;      
END



