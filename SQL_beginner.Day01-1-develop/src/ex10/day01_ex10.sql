SELECT (
    SELECT person.name
    FROM person
    WHERE person.id = person_order.person_id) AS person_name,
    (SELECT menu.pizza_name
    FROM menu
    WHERE menu.id = person_order.menu_id) AS pizza_name,
    (SElECT pizzeria.name
    FROM pizzeria
    WHERE pizzeria.id = 
            (SELECT person_visits.pizzeria_id
            FROM person_visits
            WHERE person_order.person_id = person_visits.person_id 
            AND person_order.order_date = person_visits.visit_date)) AS pizzeria_name
FROM person_order
ORDER BY person_name, pizza_name, pizzeria_name