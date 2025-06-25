/*
В таблицу users добавили булево поле is_active (с типом bit). Это флажок, который обозначает: активен аккаунт пользователя или заблокирован.

Теперь таблица имеет вид:

 

Поступила задача: сделать неактивными (is_active = false) всех несовершеннолетних пользователей. Решить ее необходимо с помощью функции.

 

Требования к функции:

Название: deactivate_infants
Возвращаемый тип данных: INT
Функция должна вернуть количество записей, которые она обновила (системная фунция ROW_COUNT() в помощь)
Достаточно написать одну команду, создающую функцию
 

Подсказка
Для определения несовершеннолетних можно использовать год от даты рождения: YEAR(birthday) и год сейчас: YEAR(NOW())
Тип фунции: MODIFIES SQL DATA
*/

CREATE TABLE users(
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	firstname VARCHAR(100),
	lastname VARCHAR(100),
	login VARCHAR(100),
	email VARCHAR(100) UNIQUE,
	password_hash VARCHAR(256),
	phone BIGINT UNSIGNED UNIQUE,
	birthday date DEFAULT NULL,  # дата рождения
	is_active BIT,               # активный/заблокированный
	
	INDEX idx_users_username(firstname, lastname)
) COMMENT 'пользователи';

CREATE FUNCTION deactivate_infants()
RETURNS INT MODIFIES SQL DATA
BEGIN
    DECLARE res INT;
    UPDATE users
    SET is_active = false
    WHERE YEAR(now()) - YEAR(birthday) < 18;
    SELECT ROW_COUNT() INTO res;
    RETURN res;
END;