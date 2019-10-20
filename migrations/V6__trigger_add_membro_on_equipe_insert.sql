create or replace function add_membro_equipe_on_insert() returns trigger as
$$
	declare
	begin
		insert into membro(perfil_id, equipe_id) values(new.criador_perfil_id, new.id);
		return new;
	end;
$$ language plpgsql;

create trigger add_membro_after_insert_on_equipe
after insert
on equipe
for each row
execute procedure add_membro_equipe_on_insert();