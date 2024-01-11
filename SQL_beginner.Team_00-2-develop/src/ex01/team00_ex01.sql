-- CREATE TABLE TSP (
--     point1 char(1),
--     point2 char(1),
--     cost int
-- );
-- INSERT INTO TSP (point1, point2, cost) 
-- VALUES ('A', 'B', 10),
--  ('A', 'C', 15),
--  ('A', 'D', 20),
--  ('B', 'A', 10),
--  ('B', 'C', 35),
--  ('B', 'D', 25),
--  ('C', 'A', 15),
--  ('C', 'B', 35),
--  ('C', 'D', 30),
--  ('D', 'A', 20),
--  ('D', 'B', 25),
--  ('D', 'C', 30)


-- WITH A_CTE (point1, point2, cost)
-- AS 
-- (SELECT *
-- FROM TSP
-- WHERE point1 = 'A'),

-- B_CTE AS (SELECT A_CTE.*,
--       TSP.point2 AS point3,
--       A_CTE.cost + TSP.cost AS total_cost,
--       CONCAT(A_CTE.point1, ',', A_CTE.point2, ',', TSP.point2) AS tour
-- FROM A_CTE
-- JOIN TSP ON TSP.point1 = A_CTE.point2 and TSP.point2 != 'A'),

-- C_CTE AS (SELECT B_CTE.point1,
--       B_CTE.point2,
--       TSP.point2 AS point4,
--       B_CTE.total_cost + TSP.cost AS total_cost,
--       CONCAT(B_CTE.tour, ',', TSP.point2) AS tour
-- FROM B_CTE
-- JOIN TSP ON TSP.point1 = B_CTE.point3 and TSP.point2 != B_CTE.point1 and TSP.point2 != B_CTE.point2 and TSP.point2 != B_CTE.point3),

-- FINAL_CTE AS (SELECT C_CTE.total_cost + TSP.cost AS total_cost,
--       CONCAT('{', C_CTE.tour, ',', 'A', '}') AS tour
-- FROM C_CTE
-- JOIN TSP ON TSP.point1 = C_CTE.point4 and TSP.point2 = 'A'),

-- MIN_CTE AS (SELECT MIN(total_cost) AS MINIMUM
-- FROM FINAL_CTE)

-- SELECT FINAL_CTE.*
-- FROM FINAL_CTE
-- JOIN MIN_CTE ON FINAL_CTE.total_cost = MIN_CTE.MINIMUM
-- ORDER BY 1,2


WITH RECURSIVE BASE (point1, point2, total_cost, tour, iteration)
AS 
(SELECT 
            TSP.point1,
            TSP.point2,
            TSP.cost,
      CONCAT('{', TSP.point1, ',', TSP.point2),
      0 
FROM TSP
WHERE point1 = 'A'
UNION ALL

SELECT BASE.point2 AS point1,
      TSP.point2 AS point2,
      BASE.total_cost + TSP.cost AS total_cost,
      (CASE 
            WHEN BASE.iteration = 2
            THEN CONCAT(BASE.tour, ',', TSP.point2, '}')
            WHEN BASE.iteration <=1
            THEN CONCAT(BASE.tour, ',', TSP.point2) 
      END) AS tour,
      BASE.iteration + 1
FROM BASE
JOIN TSP ON TSP.point1 = BASE.point2 

WHERE
BASE.iteration < 3 AND  
                        (CASE 
                              WHEN BASE.iteration = 2
                              THEN TSP.point2 = 'A'
                              WHEN BASE.iteration <=1
                              THEN BASE.tour NOT LIKE CONCAT('%', TSP.point2, '%')
                        END)),

MINIMUM 
AS (SELECT MIN (BASE.total_cost)
FROM BASE
WHERE iteration = 3)

SELECT BASE.total_cost,
      BASE.tour
FROM BASE
WHERE BASE.iteration = 3
ORDER BY 1,2  