SELECT (SELECT person.name
        FROM person
        WHERE person.id = person_order.person_id) AS name,
        (SELECT menu.pizza_name
        FROM menu
        WHERE menu.id = person_order.menu_id) AS pizza_name,
        (SELECT menu.price
        FROM menu
        WHERE menu.id = person_order.menu_id) AS price,
        ROUND ((SELECT menu.price * (1 - (SELECT discount
                            FROM person_discounts
                            WHERE person_discounts.person_id = person_order.person_id 
                            AND person_discounts.pizzeria_id = (SELECT menu.pizzeria_id
                                                                FROM menu
                                                                WHERE menu.id = person_order.menu_id)) /100)
        FROM menu
        WHERE menu.id = person_order.menu_id), 0) AS discount_price,
        (SELECT (SELECT pizzeria.name
                FROM pizzeria
                WHERE menu.pizzeria_id = pizzeria.id)
        FROM menu
        WHERE menu.id = person_order.menu_id) AS pizzeria_name
FROM person_order
ORDER BY name, pizza_name
