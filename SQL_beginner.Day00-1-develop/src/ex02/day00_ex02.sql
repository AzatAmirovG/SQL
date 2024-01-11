SELECT name, rating
FROM pizzeria
WHERE rating <= 5 AND rating >=3.5
ORDER BY rating;

SELECT name, rating
FROM pizzeria
WHERE rating BETWEEN 3.4 AND 5.1
ORDER BY rating;