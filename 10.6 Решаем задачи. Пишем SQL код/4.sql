/*
Напишите процедуру get_factorial_proc (название важно для проверки!), которая в цикле WHILE вычисляет факториал заданного числа.

Требования к процедуре:

название get_factorial_proc
принимает целое число в качестве параметра
использует именно цикл WHILE
выводит целое число, равное факториалу переданного числа в параметре
*/

DELIMITER //

CREATE PROCEDURE get_factorial_proc(n INT)
BEGIN
    DECLARE ii INT DEFAULT n;
    DECLARE res INT DEFAULT 1;
    WHILE ii > 0 DO
      SET res = res * ii;
      SET ii = ii - 1;
    END WHILE;
    SELECT res;
END//

DELIMITER ;