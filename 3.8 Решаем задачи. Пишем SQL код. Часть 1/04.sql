/*
Работаем с БД telegram, созданной на уроках в этом курсе.

Пользователь номер 7 включил двухфакторную аутентификацию. Он правильно ввел свой пароль. Следующий шаг - ввод кода из СМС. На текущем шаге мы должны узнать его номер телефона, чтобы отправить сообщение.

Напишите запрос, возвращающий номер телефона (поле phone) пользователя номер 7 (таблица users). Ничего другого, кроме номера телефона, запрос не должен возвращать.
*/

SELECT phone
FROM users
WHERE id = 7;
