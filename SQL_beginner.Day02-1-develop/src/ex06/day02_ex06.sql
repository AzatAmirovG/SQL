WITH TABLE_CTE(pizza_name, pizzeria_name, id)
AS (SELECT menu.pizza_name,
       pizzeria.name AS pizzeria_name,
       menu.id AS id
FROM menu
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id)

SELECT pizza_name,
       pizzeria_name
FROM TABLE_CTE
JOIN person_order ON person_order.menu_id = TABLE_CTE.id
WHERE person_order.person_id = (SELECT person.id
                                FROM person
                                WHERE person.name = 'Denis') 
OR person_order.person_id = (SELECT person.id
                                FROM person
                                WHERE person.name = 'Anna') 
ORDER BY pizza_name, pizzeria_name