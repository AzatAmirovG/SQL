SELECT (SELECT name FROM person WHERE pv.person_id = id) AS person_name,  -- this is an internal query in a main SELECT clause
        (SELECT name FROM pizzeria WHERE pv.pizzeria_id = id) AS pizzeria_name  -- this is an internal query in a main SELECT clause
FROM (SELECT * FROM person_visits WHERE EXTRACT (DAY FROM visit_date) BETWEEN 6 AND 10) AS pv -- this is an internal query in a main FROM clause
ORDER BY person_name, pizzeria_name DESC