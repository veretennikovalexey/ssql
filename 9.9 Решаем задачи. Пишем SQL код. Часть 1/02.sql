/*
Учитывая изменения в структуре данных, выполненные в предыдущей задаче, перепишите SELECT запрос:

SELECT 
	users.id,
	users.birthday,
	user_settings.is_premium_account
FROM users
JOIN user_settings ON users.id = user_settings.user_id 
WHERE id = 1;
 

так, чтобы он корректно исполнялся.

Вывести нужно только указанные 3 поля.
*/
SELECT 
	users.id,
	users.birthday,
	users.is_premium_account
FROM users
WHERE id = 1;