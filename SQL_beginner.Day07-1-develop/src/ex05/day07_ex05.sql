SELECT (SELECT name
        FROM person
        WHERE A.person_id = person.id) AS name
FROM person_order A
GROUP BY name