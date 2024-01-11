WITH TABLE_CTE (name, id)
AS (SELECT person.name,
        person.id
FROM person
WHERE (address = 'Moscow' 
OR address = 'Samara')
AND gender = 'male')

SELECT TABLE_CTE.name
FROM TABLE_CTE
JOIN person_order ON TABLE_CTE.id = person_order.person_id
WHERE person_order.menu_id IN (
    SELECT menu.id
    FROM menu
    WHERE menu.pizza_name = 'pepperoni pizza')
OR person_order.menu_id IN (
    SELECT menu.id
    FROM menu
    WHERE menu.pizza_name = 'mushroom pizza')
ORDER BY TABLE_CTE.name DESC
