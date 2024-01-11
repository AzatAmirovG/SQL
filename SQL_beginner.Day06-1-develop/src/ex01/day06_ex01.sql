WITH TABLE_CTE (id, person_id, pizzeria_id, amount)
AS (SELECT ROW_NUMBER() over(ORDER BY person_id) id,
        person_id,
       (SELECT menu.pizzeria_id
              FROM menu
              WHERE person_order.menu_id = menu.id) AS pizzeria_id,
       COUNT ((SELECT menu.pizzeria_id
              FROM menu
              WHERE person_order.menu_id = menu.id)
              )
FROM person_order
GROUP BY person_id, pizzeria_id),

INPUT_TABLE (id, person_id, pizzeria_id, amount)
AS (SELECT id,
       person_id,
       pizzeria_id,
       CASE
        WHEN amount = 1 THEN 10.5
        WHEN amount = 2 THEN 22
        ELSE 30
       END AS discount
FROM TABLE_CTE)

INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
    SELECT *
    FROM INPUT_TABLE

-- if “amount of orders” = 1 then “discount” = 10.5 else if “amount of orders” = 2 then “discount” = 22 else “discount” = 30