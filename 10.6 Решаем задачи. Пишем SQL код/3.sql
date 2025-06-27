/*
Напишите функцию get_factorial_func (название важно для проверки!), которая в цикле REPEAT - UNTIL вычисляет факториал заданного числа.

Требования к функции:

название get_factorial_func 
принимает целое число в качестве параметра
использует именно цикл REPEAT - UNTIL 
возвращает целое число, равное факториалу переданного числа в параметре
 

Подсказка
Код должен содержать несколько команд.
Предварительно удалите существующую функцию с проверкой
После этого добавьте имеющийся код в функцию
Внимательно читайте текст ошибок
Тип функции: DETERMINISTIC
*/

# deepseek
DELIMITER //

DROP FUNCTION IF EXISTS get_factorial_func//

CREATE FUNCTION get_factorial_func(n INT) RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE result INT DEFAULT 1;
    DECLARE counter INT DEFAULT 1;
    
    IF n <=1 THEN
        RETURN 1;
    END IF;
    
    REPEAT
        SET result = result * counter;
        SET counter = counter + 1;
    UNTIL counter > n END REPEAT;
    
    RETURN result;
END//

DELIMITER ;