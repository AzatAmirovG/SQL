WITH TABLE_CTE (menu_id, pizzeria_id)
AS (SELECT menu_id,
            (SELECT pizzeria_id
            FROM menu
            WHERE person_order. menu_id = menu.id)
    FROM person_order),

ORDER_CTE (name, counter, pizzeria_id, menu_id) 
AS (SELECT(SELECT name
        FROM pizzeria
        WHERE pizzeria.id = TABLE_CTE.pizzeria_id) AS name,
        COUNT (pizzeria_id) AS counter,
        TABLE_CTE.pizzeria_id AS pizzeria_id, 
        TABLE_CTE.menu_id AS menu_id
FROM TABLE_CTE
GROUP BY TABLE_CTE.pizzeria_id, TABLE_CTE.menu_id)

SELECT name,
        SUM (counter) AS count_of_orders,
        ROUND (AVG ((SELECT price
            FROM menu
            WHERE A.menu_id = menu.id)), 2) AS average_price,
        MAX ((SELECT price
            FROM menu
            WHERE A.menu_id = menu.id)) AS max_price,
        MIN ((SELECT price
            FROM menu
            WHERE A.menu_id = menu.id)) AS min_price
FROM ORDER_CTE A
GROUP BY name
ORDER BY name