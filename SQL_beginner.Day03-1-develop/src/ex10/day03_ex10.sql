INSERT INTO person_order (id, person_id, menu_id, order_date)
VALUES 
        (
            ((SELECT MAX(id) FROM person_order) + 1),
            (SELECT id FROM person WHERE name = 'Denis'),
            (SELECT menu.id FROM menu WHERE menu.pizza_name = 'sicilian pizza'),
            '2022-02-24'
        );
INSERT INTO person_order (id, person_id, menu_id, order_date)
VALUES 
        (
            ((SELECT MAX(id) FROM person_order) + 1),
            (SELECT id FROM person WHERE name = 'Irina'),
            (SELECT menu.id FROM menu WHERE menu.pizza_name = 'sicilian pizza'),
            '2022-02-24'
        );
