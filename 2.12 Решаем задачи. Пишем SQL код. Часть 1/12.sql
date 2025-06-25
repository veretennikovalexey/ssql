/*
Работаем с БД telegram, созданной на уроках в этом курсе.

 

В приложение добавлена возможность выбирать новый язык (клингонский). Необходимо обеспечить поддержку этого языка в БД. В таблице user_settings есть соответстующее поле app_language.

Измените поле app_language таким образом, чтобы оно поддерживало новое значение 'klingon'.

 

Текущее определение таблицы:
*/

CREATE TABLE user_settings(
	user_id BIGINT UNSIGNED NOT NULL PRIMARY KEY,
	is_premium_account BIT,
	is_night_mode_enabled BIT,
	color_scheme ENUM('classic', 'day', 'tinted', 'night'),
	app_language ENUM('english', 'french', 'russian', 'german', 'belarusian', 'croatian', 'dutch'),
	status_text VARCHAR(70),
	notifications_and_sounds JSON,
	created_at DATETIME DEFAULT NOW()
);

ALTER TABLE `user_settings`
MODIFY COLUMN `app_language`
ENUM('english', 'french', 'russian', 'german', 'belarusian', 'croatian', 'dutch', 'klingon');
