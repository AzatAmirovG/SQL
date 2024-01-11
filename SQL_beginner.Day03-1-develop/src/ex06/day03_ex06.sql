WITH TABLE_CTE(pizza_name, pizzeria_name, price)
AS (SELECT pizza_name,
        (SELECT name
        FROM pizzeria
        WHERE pizzeria.id = menu.pizzeria_id) AS pizzeria_name,
        price
FROM menu)

SELECT A.pizza_name,
        (SELECT name
        FROM pizzeria
        WHERE pizzeria.id = A.pizzeria_id) AS pizzeria_name_1,
        (SELECT name
        FROM pizzeria
        WHERE pizzeria.id = B.pizzeria_id) AS pizzeria_name_2,
        A.price
FROM menu A
JOIN menu B ON A.price = B.price AND A.pizza_name = B.pizza_name
WHERE A.pizzeria_id > B.pizzeria_id
ORDER BY 1
