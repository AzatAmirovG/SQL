WITH MALE_CTE (pizzeria_name)
AS (SELECT DISTINCT(SELECT pizzeria.name
            FROM pizzeria
            WHERE pizzeria.id IN (
                SELECT person_visits.pizzeria_id
                FROM person_visits
                WHERE person_visits.person_id = person_order.person_id 
                AND person_visits.visit_date = person_order.order_date
            ))
FROM person_order
WHERE person_order.person_id IN (SELECT person.id
                            FROM person
                            WHERE person.gender = 'male')),

FEMALE_CTE (pizzeria_name)
AS (SELECT DISTINCT(SELECT pizzeria.name
            FROM pizzeria
            WHERE pizzeria.id IN (
                SELECT person_visits.pizzeria_id
                FROM person_visits
                WHERE person_visits.person_id = person_order.person_id 
                AND person_visits.visit_date = person_order.order_date
            ))
FROM person_order
WHERE person_order.person_id IN (SELECT person.id
                            FROM person
                            WHERE person.gender = 'female'))

SELECT FEMALE_CTE.pizzeria_name
FROM FEMALE_CTE
EXCEPT ALL
SELECT MALE_CTE.pizzeria_name
FROM MALE_CTE
ORDER BY 1
