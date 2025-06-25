/*
Отлично, у нас есть работающее представление v_users_without_phone.

Теперь нужно с его помощью получить список пользователей, у которых в приложении установлен русский язык (поле app_language в соответствующем значении).

 

Вывести необходимо только следующие поля:

идентификатор пользователя
email пользователя
 

Отсортировать выборку по полю email.
 

Подсказка
 Таблица user_settings имеет вид (интересующее нас поле - app_language):
*/

CREATE TABLE user_settings(
	user_id BIGINT UNSIGNED NOT NULL PRIMARY KEY,
	is_premium_account BIT,
	is_night_mode_enabled BIT,
	color_scheme ENUM('classic', 'day', 'tinted', 'night'),
	app_language ENUM('english', 'french', 'russian', 'german', 'belorussian', 'croatian', 'dutch'),
	status_text VARCHAR(70),
	notifications_and_sounds JSON,
	created_at DATETIME DEFAULT NOW(),

	FOREIGN KEY (user_id) REFERENCES users(id) # внешний ключ
);

SELECT id, email
FROM v_users_without_phone
WHERE app_language = 'russian'
ORDER BY email;
