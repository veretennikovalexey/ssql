/*
Принято решение расширить возможности поиска по названиям каналов.

Добавьте полнотекстовый индекс на поле title таблицы channels.
*/

CREATE FULLTEXT INDEX full_title_idx ON channels(title);