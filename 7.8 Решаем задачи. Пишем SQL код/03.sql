/*
Теперь оберните код написанной транзакции (с коммитом) в процедуру.

Напишите процедуру с названием remove_channel (название важно для проверки!), которая будет выполнять код из первого задания.

 

Подсказка
Код должен содержать несколько команд.
Предварительно удалите существующую процедуру с проверкой
После этого добавьте имеющийся код в процедуру
Внимательно читайте текст ошибок
*/

DROP PROCEDURE IF EXISTS remove_channel;

DELIMITER //

CREATE PROCEDURE remove_channel()
BEGIN
    START TRANSACTION;
        DELETE FROM channel_messages    WHERE channel_id = 1;
        DELETE FROM channel_subscribers WHERE channel_id = 1;
        DELETE FROM channels            WHERE id         = 1;
    COMMIT;     
END//
