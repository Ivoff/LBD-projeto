-- verifica se uma o cadastro de uma equipe em uma maratona nao gera conflito de horario
create or replace function check_maratona_horario() returns trigger as
$$
	declare
		current_maratona record;
	begin
		select * into current_maratona from maratona where maratona.id = new.maratona_id;		
		perform * from maratona where maratona.horario_comeco > current_maratona.horario_comeco and maratona.horario_comeco < current_maratona.horario_termino 
			and maratona.horario_termino > current_maratona.horario_comeco and maratona.horario_termino < current_maratona.horario_termino;
		
		if found then
			raise exception 'inscricao na maratona selecionada gera conflito com outra maratona';
		end if;
		return new;
	end;
$$ language plpgsql;

create trigger trigger_maratona_horario
before insert
on equipemaratona
for each row
execute procedure check_maratona_horario();