/*
Отлично, мы в одном шаге от того, чтобы закрыть тикет в Jira с этой задачей.

Другие люди заполнили таблицу languages нужными данными и проставили правильные значения в поле language_id.

Осталось удалить поле app_language из таблицы user_settings, потому что теперь оно лишь дублирует новый функционал.
*/

ALTER TABLE `user_settings`
    DROP COLUMN `app_language`;
