create or replace view maratonas_acima_media as
select
	maratona.id as maratona_id, avg(equipemaratona.pontuacao_final) as media
from 
	(
		select count(membro.id) as qnt_membros_por_maratona
		from equipemaratona, maratona, membro
		where membro.equipe_id = equipemaratona.equipe_id and equipemaratona.maratona_id = maratona.id
		group by maratona.id
	) as total_membros,
	(
		select count(equipe.id) as qnt_equipes_por_equipe
		from equipemaratona, maratona, equipe
		where equipe.id = equipemaratona.id and equipemaratona.id = maratona.id
		group by maratona.id
	) as total_equipes,
	(
		select avg(questoes.dificuldade)
		from questoes, maratona, equipemaratona
		where questoes.id = 
		
	) as media_dificuldade_questao_por_maratona,
	maratona, equipemaratona, participante
where 
	maratona.id = equipemaratona.maratona_id	
group by maratona.id;