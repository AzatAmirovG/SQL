WITH TABLE_CTE (menu_id, pizzeria_id)
AS (SELECT menu_id,
            (SELECT pizzeria_id
            FROM menu
            WHERE person_order. menu_id = menu.id)
    FROM person_order),

AGR_CTE (name, counter, action_type)
AS (SELECT (SELECT name
    FROM pizzeria
    WHERE pizzeria.id = person_visits.pizzeria_id) AS name,
    COUNT (pizzeria_id),
    'visit' AS action_type
FROM person_visits
GROUP BY pizzeria_id
UNION
SELECT (SELECT name
        FROM pizzeria
        WHERE pizzeria.id = TABLE_CTE.pizzeria_id) AS name,
        COUNT (pizzeria_id),
        'order' AS action_type
FROM TABLE_CTE
GROUP BY pizzeria_id
ORDER BY 3, 2 DESC)

SELECT name,
        SUM(counter) AS total_count
FROM AGR_CTE
GROUP BY name
ORDER BY 2 DESC, 1