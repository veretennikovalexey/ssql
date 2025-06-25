/*
Аналитики хотят знать: насколько популярен у пользователей премиум аккаунт.

Напишите запрос, выводящий оба значения в поле is_premium_account таблицы user_settings и количество пользователей напротив него.

 

Вид таблицы user_settings:
*/

CREATE TABLE user_settings(
	user_id BIGINT UNSIGNED NOT NULL PRIMARY KEY,
	is_premium_account BIT,
	is_night_mode_enabled BIT,
	color_scheme ENUM('classic', 'day', 'tinted', 'night'),
	app_language ENUM('english', 'french', 'russian', 'german', 'belorussian', 'croatian', 'dutch'),
	status_text VARCHAR(70),
	notifications_and_sounds JSON,
	created_at DATETIME DEFAULT NOW()
);

select is_premium_account, count( user_id )
from user_settings
group by is_premium_account;