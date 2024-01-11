COMMENT ON TABLE person_discounts IS 'Table that represents personal discounts for customers in each visited pizzeria';
COMMENT ON COLUMN person_discounts.id IS 'Discount ID number';
COMMENT ON COLUMN person_discounts.person_id IS 'Person(Customer) ID number';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Pizzeria ID number';
COMMENT ON COLUMN person_discounts.discount IS 'Discount value in percent';