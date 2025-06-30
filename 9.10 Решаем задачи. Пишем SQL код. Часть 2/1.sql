/*
В логах проблемных запросов обнаружен следующий SELECT запрос:

SELECT *
FROM channels c
JOIN channel_messages cm ON c.id = cm.channel_id 
JOIN channel_message_reactions cmr ON cm.id = cmr.message_id 
JOIN reactions_list rl ON rl.id = cmr.reaction_id 
JOIN users u ON u.id = cm.sender_id
WHERE c.id = 1
 

Необходимо найти в нем узкое место (пробемную таблицу). Для этого получите план исполнения этого запроса.
*/

EXPLAIN (SELECT *
FROM channels c
JOIN channel_messages cm ON c.id = cm.channel_id 
JOIN channel_message_reactions cmr ON cm.id = cmr.message_id 
JOIN reactions_list rl ON rl.id = cmr.reaction_id 
JOIN users u ON u.id = cm.sender_id
WHERE c.id = 1)