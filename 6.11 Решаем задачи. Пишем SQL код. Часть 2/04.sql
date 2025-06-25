/*
Принято решение внедрить параметры в написанную ранее функцию deactivate_infants и изменить логику ее работы.

Новые принимаемые параметры:

deact_infants (тип BIT) - деактивировать несовершеннолетних
deact_free_accounts (тип BIT) - деактивировать бесплатные аккаунты
 

Перепишите функцию в соответствии с новой логикой и новыми параметрами.

Деактивировать несовершеннолетних только если параметр deact_infants = 1.

Деактивировать бесплатные аккаунты только если параметр deact_free_accounts = 1.

 

Функция должна возвращать суммарное количество удаленных записей.

 

Подсказка
Код должен содержать несколько команд.
Предварительно удалите существующую функцию с проверкой
Удобнее всего сделать несколько отдельных UPDATE запросов в функции
Заведите переменную, в которую будете суммировать удаленные записи из отдельных запросов
*/

DROP FUNCTION IF EXISTS deactivate_infants; -- DROP FUNCTION

DELIMITER //

CREATE FUNCTION deactivate_infants(
    deact_infants BIT,
    deact_free_accounts BIT
)
RETURNS INT READS SQL DATA
BEGIN                                      
    DECLARE affected_rows INT DEFAULT 0;

    IF deact_infants = 1 THEN
        UPDATE users
        SET is_active = false
        WHERE YEAR(now()) - YEAR(birthday) < 18;
        
        SET affected_rows = affected_rows + ROW_COUNT();
    END IF;
    
    IF deact_free_accounts = 1 THEN
        UPDATE users
        JOIN user_settings ON users.id = user_settings.user_id 
        SET is_active = false
        WHERE NOT is_premium_account;
        
        SET affected_rows = affected_rows + ROW_COUNT();
    END IF;
    
    RETURN affected_rows;
END//

DELIMITER ;