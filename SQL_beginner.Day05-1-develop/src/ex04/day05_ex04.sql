CREATE UNIQUE INDEX idx_menu_unique
ON public.menu (pizzeria_id, pizza_name)
INCLUDE (id);

set enable_seqscan = off;

EXPLAIN SELECT *
FROM menu
WHERE pizzeria_id = 1 AND pizza_name = 'cheese pizza'
