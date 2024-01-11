SELECT menu.id AS menu_id
FROM menu
LEFT JOIN person_order ON menu.id = person_order.menu_id
WHERE menu_id IS NULL
ORDER BY menu_id