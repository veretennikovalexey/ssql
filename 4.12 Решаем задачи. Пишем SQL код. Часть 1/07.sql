/*
Аналитики хотят знать самую первую дату регистрации пользователя с премиум аккаунтом.

Выведите из таблицы user_settings наименьшую дату (поле created_at) среди всех пользователей, у кого поднят флаг is_premium_account.

Для решения используйте агрегирующую функцию.

 

Вид таблицы :
*/

CREATE TABLE user_settings(
	user_id BIGINT UNSIGNED NOT NULL PRIMARY KEY, # идентификатор пользователя
	is_premium_account BIT, # флаг премиум аккаунта
	is_night_mode_enabled BIT,
	color_scheme ENUM('classic', 'day', 'tinted', 'night'),
	app_language ENUM('english', 'french', 'russian', 'german', 'belorussian', 'croatian', 'dutch'),
	status_text VARCHAR(70),
	notifications_and_sounds JSON,
	created_at DATETIME DEFAULT NOW() # дата создания профиля
);

SELECT MIN( created_at )
FROM user_settings
WHERE is_premium_account

