SELECT DISTINCT person_id
FROM person_visits
WHERE pizzeria_id = 2 OR 
EXTRACT(DAY FROM visit_date) BETWEEN 5 AND 10
ORDER BY person_id DESC;
