WITH TABLE_CTE (name, id)
AS (SELECT person.name,
           person.id
    FROM person
    WHERE gender = 'female'),

pepperoni_CTE (id)
AS (SELECT person_order.person_id
    FROM person_order
    WHERE person_order.menu_id IN (
        SELECT menu.id
        FROM menu
        WHERE menu.pizza_name = 'pepperoni pizza')),

cheeze_CTE (id)
AS (SELECT person_order.person_id
    FROM person_order
    WHERE person_order.menu_id IN (
        SELECT menu.id
        FROM menu
        WHERE menu.pizza_name = 'cheese pizza'))

SELECT TABLE_CTE.name
FROM TABLE_CTE
JOIN pepperoni_CTE ON TABLE_CTE.id = pepperoni_CTE.id
JOIN cheeze_CTE ON TABLE_CTE.id = cheeze_CTE.id


-- SELECT TABLE_CTE.name
-- FROM TABLE_CTE
-- JOIN person_order ON TABLE_CTE.id = person_order.person_id
-- WHERE person_order.menu_id IN (
--     SELECT menu.id
--     FROM menu
--     WHERE menu.pizza_name = 'pepperoni pizza')
-- OR person_order.menu_id IN (
--     SELECT menu.id
--     FROM menu
--     WHERE menu.pizza_name = 'cheese pizza')
-- ORDER BY TABLE_CTE.name
