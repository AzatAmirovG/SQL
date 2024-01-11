CREATE OR REPLACE FUNCTION fnc_persons_female() 
    RETURNS TABLE (
        id bigint,
        name varchar,
        age integer,
        gender varchar,
        address varchar
) 
AS $$
-- BEGIN
    -- RETURN QUERY
     SELECT *
        FROM person
        WHERE person.gender = 'female'
-- END; 
$$ 
LANGUAGE SQL;

CREATE OR REPLACE FUNCTION fnc_persons_male() 
    RETURNS TABLE (
        id bigint,
        name varchar,
        age integer,
        gender varchar,
        address varchar
) 
AS $$
-- BEGIN
    -- RETURN QUERY 
    SELECT *
        FROM person
        WHERE person.gender = 'male'
-- END; 
$$ 
LANGUAGE SQL;
