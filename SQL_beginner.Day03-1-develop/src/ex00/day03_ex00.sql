WITH TABLE_CTE (pizza_name, price, pizzeria_id, pizzeria_name)
AS (SELECT menu.pizza_name,
            menu.price,
            menu.pizzeria_id,
            (SELECT pizzeria.name
            FROM pizzeria
            WHERE pizzeria.id = menu.pizzeria_id) AS pizzeria_name
FROM menu
WHERE price <= 1000 AND price >= 800)

SELECT TABLE_CTE.pizza_name,
       TABLE_CTE.price,
       TABLE_CTE.pizzeria_name,
        person_visits.visit_date
FROM TABLE_CTE
JOIN person_visits ON person_visits.pizzeria_id = TABLE_CTE.pizzeria_id
WHERE person_visits.person_id = (SELECT person.id
                                FROM person
                                WHERE person.name = 'Kate')
ORDER BY 1,2,3
