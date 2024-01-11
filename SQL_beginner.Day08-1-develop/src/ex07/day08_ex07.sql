--Session 1:
BEGIN;
--Session 2:
BEGIN;
--Session 1:
UPDATE pizzeria SET rating = 3 WHERE id = 1;
--Session 2:
UPDATE pizzeria SET rating = 4.1 WHERE id = 2;
--Session 1:
UPDATE pizzeria SET rating = 2 WHERE id = 2;
--Session 2:
UPDATE pizzeria SET rating = 4.9 WHERE id = 1;
--Session 1:
commit;
--Session 2:
commit;