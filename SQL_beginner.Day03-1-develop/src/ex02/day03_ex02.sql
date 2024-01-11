WITH TABLE_CTE (menu_id)
AS (SELECT menu.id AS menu_id
FROM menu
LEFT JOIN person_order ON menu.id = person_order.menu_id
WHERE menu_id IS NULL
ORDER BY menu_id)

SELECT menu.pizza_name,
       menu.price,
       (SELECT pizzeria.name
       FROM pizzeria
       WHERE pizzeria.id = menu.pizzeria_id)
FROM menu
JOIN TABLE_CTE ON menu.id = TABLE_CTE.menu_id
ORDER BY 1,2