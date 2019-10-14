create or replace function equipe_insert_check() returns trigger as
$$
        declare                
                nextval integer;
        begin                
                if (select nome from equipe where nome = new.nome) is not null then                                                
                        new.nome := new.nome || (select currval('equipe_id_seq') + 1);
                end if;
                return new;
        end;
$$ language plpgsql;

create trigger equipe_insert_validation
before insert or update
on equipe
for each row
execute procedure equipe_insert_check();
