-- funcao para alterar o valor de pontuacao na tabela equipe maratona assim que a questao submitada de uma questao seja avaliada
create or replace function update_pontuacao_final_equipe_maratona() returns trigger as
$$
	declare		
		current_pontuacao double precision;
		update_query varchar;
	begin
		select pontuacao_final into current_pontuacao from equipemaratona where equipemaratona.equipe_id = new.equipe_id and equipemaratona.maratona_id = new.maratona_id;		
		update equipemaratona set pontuacao_final = (current_pontuacao + new.pontuacao) where equipemaratona.equipe_id = new.equipe_id and equipemaratona.maratona_id = new.maratona_id;
		return new;
	end;
$$ language plpgsql;

create trigger update_pontuacao_final_equipe
before insert
on EquipeMaratonaQuestao
for each row
execute procedure update_pontuacao_final_equipe_maratona();