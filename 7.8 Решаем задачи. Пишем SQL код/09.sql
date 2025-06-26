/*
Заблокируйте таблицу пользователей на чтение, затем выведите количество строк в ней и после этого разблокируйте таблицу.
*/

LOCK TABLE users READ;
SELECT COUNT( * ) FROM users;
UNLOCK TABLES;
