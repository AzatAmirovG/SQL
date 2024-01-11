WITH VISITS_CTE (pizzeria_id)
AS (SELECT DISTINCT person_visits.pizzeria_id
    FROM person_visits
    WHERE person_visits.person_id = (SELECT id
                                    FROM person
                                    WHERE name = 'Andrey')),
ORDERS_CTE (pizzeria_id)
AS (SELECT DISTINCT (SELECT person_visits.pizzeria_id
            FROM person_visits
            WHERE person_order.person_id = person_visits.person_id
            AND person_order.order_date = person_visits.visit_date)
    FROM person_order
    WHERE person_order.person_id = (SELECT id
                                    FROM person
                                    WHERE name = 'Andrey'))

SELECT (SELECT name
        FROM pizzeria
        WHERE pizzeria.id = VISITS_CTE.pizzeria_id)
FROM VISITS_CTE
-- LEFT JOIN ORDERS_CTE ON VISITS_CTE.pizzeria_id = ORDERS_CTE.pizzeria_id
-- WHERE VISITS_CTE IS NULL
EXCEPT
SELECT (SELECT name
        FROM pizzeria
        WHERE pizzeria.id = ORDERS_CTE.pizzeria_id)
FROM ORDERS_CTE
