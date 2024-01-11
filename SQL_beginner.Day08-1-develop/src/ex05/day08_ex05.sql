--Session 1:
BEGIN;
--Session 2:
BEGIN;
--Session 1:
SELECT SUM(rating) FROM pizzeria;
--Session 2:
UPDATE pizzeria SET rating = 1 WHERE name = 'Pizza Hut';
commit;
--Session 1:
SELECT SUM(rating) FROM pizzeria;
commit;
SELECT SUM(rating) FROM pizzeria;
--Session 2:
SELECT SUM(rating) FROM pizzeria;