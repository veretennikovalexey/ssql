/*
Напишите запрос, создающий таблицу `contacts`.

В таблице должны присутствовать:

поле `id` - идентификатор строки, являющийся первичным ключом
поле `name` - имя контакта (строковый тип данных), должно быть проиндексировано, не может быть пустым
поле `email` - электронная почта, должна иметь уникальные значения
*/

CREATE TABLE contacts (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    
    INDEX idx_contacts_name (name)
) COMMENT 'Таблица контактов пользователей';