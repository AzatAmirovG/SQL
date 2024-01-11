SELECT (SELECT name
        FROM person
        WHERE person.id = B.person_id) AS name,
        COUNT(B.person_id) AS count_of_visits
FROM person_visits B
WHERE (SELECT  COUNT(A.person_id)
        FROM person_visits A
        WHERE A.person_id = B.person_id) >3
GROUP BY B.person_id
