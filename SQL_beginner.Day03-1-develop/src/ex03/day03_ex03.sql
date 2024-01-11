WITH FEMALE_CTE (pizzeria_name, visits)
AS (SELECT (SELECT pizzeria.name
        FROM pizzeria
        WHERE pizzeria.id = person_visits.pizzeria_id) AS p_name,
        COUNT(*)
FROM person_visits 
WHERE person_visits.person_id IN (SELECT person.id
                            FROM person
                            WHERE person.gender = 'female')
GROUP BY p_name),

MALE_CTE (pizzeria_name, visits)
AS (SELECT (SELECT pizzeria.name
        FROM pizzeria
        WHERE pizzeria.id = person_visits.pizzeria_id) AS p_name,
        COUNT(*)
FROM person_visits 
WHERE person_visits.person_id IN (SELECT person.id
                            FROM person
                            WHERE person.gender = 'male')
GROUP BY p_name)

SELECT FEMALE_CTE.pizzeria_name
FROM FEMALE_CTE
JOIN MALE_CTE ON FEMALE_CTE.pizzeria_name = MALE_CTE.pizzeria_name
WHERE FEMALE_CTE.visits != MALE_CTE.visits
ORDER BY 1


