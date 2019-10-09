create function participante_validation() returns trigger as
$$
	begin
		if(select id from participante where perfil_id = new.perfil_id and maratona_id = new.maratona_id) is not null then
			raise exception 'perfil já vinculado na atual maratona';
		end if;
		return new;
	end;
$$ language plpgsql;

create trigger participante_insertion before insert on participante 
for each row execute procedure participante_validation();