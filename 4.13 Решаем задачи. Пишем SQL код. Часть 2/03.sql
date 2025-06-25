/*
Теперь от предыдущей выборки нужно оставить только те строки, в которых значение в поле count > 80 (верхние 5 строк от предыдущей выборки).

Допишите соответствующим образом предыдущий запрос.
*/

SELECT
    COUNT( * ) count,
    reaction_id 
FROM private_message_reactions
GROUP BY reaction_id
HAVING COUNT( * ) > 80
ORDER BY count desc;