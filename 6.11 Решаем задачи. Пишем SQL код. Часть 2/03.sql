/*
Нашу функцию deactivate_infants необходимо доработать. А именно: деактивировать несовершеннолетние аккаунты только в случае, если они бесплатные.

В таблице user_settings:

есть битовое поле is_premium_account. Если его значение = 1, то деактивировать аккаунт не нужно.

 

Связь между таблицами:


Подсказка
Код должен содержать несколько команд.
Предварительно удалите существующую функцию с проверкой
Деактивируйте учетные записи только если возраст < 18 и is_premium_account = false
Для получения нужных строк используйте конструкцию UPDATE-JOIN
Функция должна вернуть количество записей, которые она обновила (системная фунция ROW_COUNT() в помощь)
Используйте смену разделителя команд с помощью ключевого слова DELIMITER
*/

CREATE TABLE user_settings(
	user_id BIGINT UNSIGNED NOT NULL PRIMARY KEY, # внешний ключ, ссылающийся на users.id
	is_premium_account BIT, # флаг премиум аккаунта
	is_night_mode_enabled BIT,
	color_scheme ENUM('classic', 'day', 'tinted', 'night'),
	app_language ENUM('english', 'french', 'russian', 'german', 'belorussian', 'croatian', 'dutch'),
	status_text VARCHAR(70),
	notifications_and_sounds JSON,
	created_at DATETIME DEFAULT NOW()
);

DROP FUNCTION IF EXISTS deactivate_infants;

DELIMITER //

CREATE FUNCTION deactivate_infants()
RETURNS INT MODIFIES SQL DATA
BEGIN
    UPDATE users
    JOIN user_settings ON users.id = user_settings.user_id 
    SET is_active = false
    WHERE YEAR(now()) - YEAR(birthday) < 18 and NOT is_premium_account;
    RETURN ROW_COUNT();
END//

DELIMITER ;
