--Session 1:
BEGIN;
set transaction isolation level serializable;
--Session 2:
BEGIN;
set transaction isolation level serializable;
--Session 1:
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
--Session 2:
UPDATE pizzeria SET rating = 3 WHERE name = 'Pizza Hut';
commit;
--Session 1:
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
commit;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
--Session 2:
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';