CREATE SEQUENCE public.seq_person_discounts
INCREMENT BY 1
START WITH 1
NO MINVALUE
NO MAXVALUE
CACHE 1;


SELECT setval('seq_person_discounts', (SELECT COUNT (id)
                                       FROM person_discounts));

ALTER TABLE public.person_discounts 
ALTER COLUMN id 
SET DEFAULT nextval('public.seq_person_discounts'::regclass);
