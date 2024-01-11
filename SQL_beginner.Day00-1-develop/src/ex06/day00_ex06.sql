SELECT (SELECT name
        FROM person
        WHERE id = person_order.person_id) AS NAME,
        (CASE WHEN EXISTS (
        SELECT name
        FROM person
        WHERE id = person_order.person_id AND name = 'Denis')
        THEN true
        ELSE false
        END) AS check_name
FROM person_order
WHERE (menu_id = 13 OR menu_id = 14 OR menu_id = 18) AND EXTRACT(DAY FROM order_date) = 7;
    