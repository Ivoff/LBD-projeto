create or replace function maratona_insert_check() returns trigger as
$$
	declare
	begin
		if (select nome from maratona where nome = new.nome) is not null then
			new.nome := new.nome || '##' || (select currval('maratona_id_seq')+1);
		end if;
		return new;
	end;
$$ language plpgsql;

create trigger maratona_insert_validation
before insert or update
on equipe
for each row -- para cada tupla modificada
execute procedure maratona_insert_check();
