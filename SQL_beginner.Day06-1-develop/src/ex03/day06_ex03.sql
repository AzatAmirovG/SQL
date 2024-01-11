CREATE INDEX idx_person_discounts_unique ON public.person_discounts(person_id, pizzeria_id);
SET enable_seqscan = off;

EXPLAIN SELECT person_id,
               pizzeria_id
FROM person_discounts
WHERE person_id = 3