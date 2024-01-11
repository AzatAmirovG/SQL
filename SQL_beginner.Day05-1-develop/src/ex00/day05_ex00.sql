CREATE INDEX idx_person_visits_person_id ON public.person_visits (person_id);
CREATE INDEX idx_person_visits_pizzeria_id ON public.person_visits (pizzeria_id);
CREATE INDEX idx_menu_pizzeria_id ON public.menu (pizzeria_id);
CREATE INDEX idx_person_order_person_id ON public.person_order (person_id);
CREATE INDEX idx_person_order_menu_id ON public.person_order (menu_id);