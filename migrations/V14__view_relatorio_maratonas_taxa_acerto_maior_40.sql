create or replace view media_medias_maratona as
select avg(maratona_media) as media_das_medias
from (
	select maratona.id, avg(equipemaratona.pontuacao_final) as maratona_media
	from maratona, equipemaratona
	where equipemaratona.id = maratona.id
	group by maratona.id
) as media_por_maratona;