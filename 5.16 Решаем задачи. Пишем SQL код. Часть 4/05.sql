/*
Теперь от предыдущей выборки нужно оставить только те строки, в которых значение в поле count > 80 (верхние 5 строк от предыдущей выборки).

Допишите соответствующим образом предыдущий запрос.

 

Используйте общее табличное выражение (CTE) для фильтрации результатов оконной функции
*/


-- тут временная табличка number_of_reactions

WITH number_of_reactions AS
(
SELECT DISTINCT                        -- SELECT 1
    COUNT( * ) OVER 
        (PARTITION BY reaction_id)
    AS `count`,    
    reaction_id
FROM private_message_reactions
ORDER BY count DESC
)                                      -- SELECT 2
SELECT `count`, reaction_id 
FROM number_of_reactions
WHERE `count` > 80;