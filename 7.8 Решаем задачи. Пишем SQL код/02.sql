/*
По аналогии с предыдущим заданием напишите SQL код, который в транзакции удаляет канал номер 1, все сообщения в нем и информацию о его подписчиках.

Но в этот раз транзакцию необходимо откатить назад (не фиксировать).

 

Спойлер
Задание простое, но закрепить на практике все конструкции при работе с транзакциями, всё же, надо =)
*/

BEGIN;
DELETE FROM channel_messages    WHERE channel_id = 1;
DELETE FROM channel_subscribers WHERE channel_id = 1;
DELETE FROM channels            WHERE id         = 1;
ROLLBACK;
