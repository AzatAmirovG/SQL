SELECT pizzeria.name,
       pizzeria.rating
FROM person_visits
RIGHT JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id
WHERE person_visits.pizzeria_id IS NULL