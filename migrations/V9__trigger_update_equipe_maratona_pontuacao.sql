-- Valida as adições de quesoes para uma maratona
CREATE OR REPLACE FUNCTION update_equipe_maratona_pontuacao_check() returns trigger as
$$
begin                
    IF(EXISTS(
            SELECT 1
            FROM Maratona
            WHERE 
            maratona.id = new.maratona_id
            AND
	    NOW() >= maratona.horario_termino 
        )
    )
    THEN
        raise exception 'Pontuação só pode ser incerida durante a maratona';
    END IF;
    
    RETURN new;
end;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_equipe_maratona_pontuacao_trigger
BEFORE UPDATE
ON EquipeMaratona
FOR EACH ROW
execute procedure update_equipe_maratona_pontuacao_check();
