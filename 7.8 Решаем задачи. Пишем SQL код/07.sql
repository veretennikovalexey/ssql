/*
Установите для своей сессии уровень изоляции транзакций, устраняющий проблему фантомного чтения.
*/

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;