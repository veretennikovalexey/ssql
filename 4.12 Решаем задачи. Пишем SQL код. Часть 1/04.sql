/*
У пользователя в сохраненных сообщениях был список покупок. Но само сообщение затерялось среди других. Он выполняет поиск по своим сохраненным сообщениям с фразой "список покупок". Нам необходимо вывести ему все сообщения, в которых встречается искомая строка.

Выведите из таблицы saved_messages все поля (*) тех записей, которые принадлежат к пользователю номер 5 и содержат строку "список покупок".

 

Вид таблицы saved_messages:
*/

CREATE TABLE saved_messages (
	id SERIAL, # идентификатор строки в таблице
	user_id BIGINT UNSIGNED NOT NULL, # идентификатор пользователя
	body TEXT, # тело сообщения
	created_at DATETIME DEFAULT NOW(),
	
	FOREIGN KEY (user_id) REFERENCES users (id)	
);

SELECT *
FROM saved_messages 
WHERE body LIKE '%список покупок%' AND user_id = 5; 
