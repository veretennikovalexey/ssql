/*
Пользователь с логином temporary_account написал в поддержку и попросил удалить его учетную запись.

Напишите запрос, удаляющий запись из таблицы users, у которой в поле login значение 'temporary_account'.
*/

DELETE FROM users 
WHERE login = 'temporary_account'; 
