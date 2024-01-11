CREATE TABLE person_audit
( created TIMESTAMPTZ default CURRENT_TIMESTAMP not null,
type_event char(1) default 'I' not null,
    row_id bigint,
  name varchar not null,
  age integer not null default 10,
  gender varchar default 'female' not null ,
  address varchar,
  constraint ch_type_event check (type_event in ('I','U', 'D') )
);

CREATE or REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER AS $my_table$
   BEGIN
      INSERT INTO person_audit(created, type_event, row_id, name, age, gender, address) 
      VALUES (current_timestamp, 'I', NEW."id", NEW."name", NEW."age", NEW."gender", NEW."address");
      RETURN NEW;
   END;
$my_table$ LANGUAGE plpgsql;

CREATE or REPLACE TRIGGER trg_person_insert_audit
AFTER INSERT ON person
FOR EACH ROW 
EXECUTE PROCEDURE fnc_trg_person_insert_audit();

INSERT INTO person(id, name, age, gender, address) 
VALUES (10,'Damir', 22, 'male', 'Irkutsk');