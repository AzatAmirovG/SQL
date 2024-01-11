SELECT (SELECT name
        FROM person
        WHERE person_visits.person_id= person.id) AS name,
       COUNT (person_id) AS count_of_visits
FROM person_visits
GROUP BY person_id
ORDER BY 2 DESC, 1
LIMIT 4