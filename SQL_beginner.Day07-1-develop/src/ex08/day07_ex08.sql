WITH TABLE_CTE (menu_id, pizzeria_id, person_id)
AS (SELECT menu_id,
            (SELECT pizzeria_id
            FROM menu
            WHERE person_order. menu_id = menu.id),
            person_id
    FROM person_order),

ORDER_CTE (name, counter, pizzeria_id, menu_id, person_id) 
AS (SELECT(SELECT name
        FROM pizzeria
        WHERE pizzeria.id = TABLE_CTE.pizzeria_id) AS name,
        COUNT (pizzeria_id) AS counter,
        TABLE_CTE.pizzeria_id AS pizzeria_id, 
        TABLE_CTE.menu_id AS menu_id,
        person_id
FROM TABLE_CTE
GROUP BY TABLE_CTE.pizzeria_id, TABLE_CTE.menu_id, person_id)

SELECT (SELECT address
        FROM person
        WHERE person.id = ORDER_CTE.person_id),
        name,
        SUM (counter) AS count_of_orders
FROM ORDER_CTE
GROUP BY address, name
ORDER BY 1, 2