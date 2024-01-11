-- ALTER TABLE person_discounts ALTER COLUMN person_id SET NOT NULL;
alter table person_discounts add constraint ch_nn_person_id check (person_id is not null);
alter table person_discounts add constraint ch_nn_pizzeria_id check (pizzeria_id is not null);
alter table person_discounts add constraint ch_nn_discount check (discount is not null);
alter table person_discounts alter column discount SET default 0;
-- ALTER TABLE products ALTER COLUMN price SET DEFAULT 7.77;
alter table person_discounts add constraint ch_range_discount check (discount between 0 and 100);