--Session 1:
BEGIN;
set transaction isolation level repeatable read;
--Session 2:
BEGIN;
set transaction isolation level repeatable read;
--Session 1:
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
--Session 2:
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
--Session 1:
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
--Session 2:
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
--Session 1:
commit;
--Session 2:
commit;
--Session 1:
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
--Session 2:
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';