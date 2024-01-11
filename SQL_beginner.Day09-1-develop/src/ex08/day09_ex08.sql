CREATE or REPLACE FUNCTION fnc_fibonacci(pstop integer default 10)
RETURNS TABLE (
    Fibonacci_numbers integer
)
AS
$$
WITH RECURSIVE Fibonacci (id, first, second, result)
AS (
    SELECT 0, 0, 1, 0
    UNION ALL
    SELECT Fibonacci.id + 1,
            Fibonacci.second,
            Fibonacci.result,
            Fibonacci.second + Fibonacci.result
    FROM Fibonacci WHERE Fibonacci.result < pstop)

SELECT result AS Fibonacci_numbers
FROM Fibonacci
WHERE result < pstop
$$
LANGUAGE sql;

SELECT *
FROM fnc_fibonacci(100);