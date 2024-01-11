--Session 1:
BEGIN;
set transaction isolation level repeatable read;
--Session 2:
BEGIN;
set transaction isolation level repeatable read;
--Session 1:
SELECT SUM(rating) FROM pizzeria;
--Session 2:
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
commit;
--Session 1:
SELECT SUM(rating) FROM pizzeria;
commit;
SELECT SUM(rating) FROM pizzeria;
--Session 2:
SELECT SUM(rating) FROM pizzeria;