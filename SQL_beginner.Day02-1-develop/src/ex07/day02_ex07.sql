WITH TABLE_CTE (pizzeria_name, pizzeria_id)
AS (SELECT pizzeria.name,
            pizzeria.id
FROM pizzeria
JOIN  person_visits ON pizzeria.id = person_visits.pizzeria_id
WHERE person_visits.visit_date = '2022-01-08' 
AND person_visits.person_id = (SELECT person.id
                                FROM person
                                WHERE person.name = 'Dmitriy'))

SELECT pizzeria_name
FROM TABLE_CTE
JOIN menu ON menu.pizzeria_id = TABLE_CTE.pizzeria_id
WHERE menu.price < 800