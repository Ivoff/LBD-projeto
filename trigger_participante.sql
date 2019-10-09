create function participante_validation() returns trigger as
$$
	begin
		if(select id from participante where perfil_id = new.perfil_id, and maratona_id = new.maratona_id) is not null
			raise excpetion 'perfil já vinculado na atual maratona';
		end if;
		return new;
	end;
$$ laguage pgpsql;

create trigger participante_insertion before insert on participate 
for each row execute procedure participate_validate();
