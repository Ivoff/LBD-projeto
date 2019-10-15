-- Valida as adições de quesoes para uma maratona
CREATE OR REPLACE FUNCTION questao_maratona_horario_validation_check() returns trigger as
$$
begin                
    IF(EXISTS(
            SELECT 1
            FROM Maratona
            WHERE 
            maratona.id = new.maratona_id
            AND
            NOW() > maratona.inscricao_termino 
        )
    )
    THEN
        raise exception 'Não é possível editar questão de uma maratona após do fim do periodo de inscrição';
    END IF;
    
    RETURN new;
end;
$$ LANGUAGE plpgsql;

CREATE TRIGGER insert_questao_maratora_horario_validation
BEFORE INSERT OR UPDATE
ON MaratonaQuestoes
FOR EACH ROW
execute procedure questao_maratona_horario_validation_check();