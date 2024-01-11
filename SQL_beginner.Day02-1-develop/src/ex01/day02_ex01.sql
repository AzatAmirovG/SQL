SELECT DISTINCT B.visit_date as missing_date
FROM (
    SELECT person_visits.visit_date
    FROM person_visits
    WHERE person_visits.person_id = 1 OR person_visits.person_id =2) AS person_visits_A
RIGHT JOIN (
    SELECT visit_date::date 
    FROM   generate_series(timestamp '2022-01-01',
                        timestamp '2022-01-10',
                        interval  '1 day') AS visit_date
) AS B ON person_visits_A.visit_date = B.visit_date
WHERE person_visits_A.visit_date IS NULL
ORDER BY B.visit_date


