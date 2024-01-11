CREATE OR REPLACE FUNCTION func_minimum(VARIADIC arr numeric[])
RETURNS int
AS 
$$
SELECT MIN(el)
FROM unnest(VARIADIC arr) AS el
$$
LANGUAGE sql;

-- SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);