--Session 1: update and select
BEGIN;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
--Session 2: select
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
--Session 1: commit

--Session 2: select
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';