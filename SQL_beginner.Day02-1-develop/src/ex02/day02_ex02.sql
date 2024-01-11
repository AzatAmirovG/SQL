SELECT COALESCE (person.name, '-') AS person_name,
       person_visits.visit_date,
        COALESCE (pizzeria.name, '-') AS pizzeria_name
FROM person
LEFT JOIN person_visits ON person.id = person_visits.person_id
AND EXTRACT (DAY FROM person_visits.visit_date) < 4
FULL JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
AND EXTRACT (DAY FROM person_visits.visit_date) < 4
ORDER BY person_name, person_visits.visit_date, pizzeria_name