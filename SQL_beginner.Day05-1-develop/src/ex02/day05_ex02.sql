CREATE INDEX idx_person_name ON public.person (UPPER(name));
set enable_seqscan = off;

EXPLAIN SELECT *
FROM person
WHERE UPPER(name) = 'PETER'