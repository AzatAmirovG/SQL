SELECT name
FROM pizzeria
WHERE name IN (
        SELECT name
        FROM pizzeria
        except
        SELECT (SELECT name
        FROM pizzeria
        WHERE pizzeria.id = person_visits.pizzeria_id)
        FROM person_visits);


SELECT name
FROM pizzeria
except
SELECT (SELECT name
FROM pizzeria
WHERE pizzeria.id = person_visits.pizzeria_id)
FROM person_visits

WHERE EXISTS (
    SELECT name
    FROM pizzeria
)