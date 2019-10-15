create or replace function questao_maratona_horario_validation() returns trigger as
$$
begin                
    IF(EXISTS(
            SELECT 1 
            FROM Maratona
            WHERE 
            maratona.id = new.maratona_id
            AND
            NOW() >= maratona.horario_comeco 
        )
    )
    THEN
        raise exception 'Não é possível mudar questão de uma maratona após o inicio da mesma';
    END IF;
    
    return new;
end;
$$ language plpgsql;

create trigger insert_questao_maratora_horario_validation
before insert or update
on equipe
for each row
execute procedure questao_maratona_horario_validation();