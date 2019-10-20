create or replace function equipemaratona_insert_check() returns trigger as
$$
        declare
                cursor_membros cursor for select * from membro where equipe_id = new.equipe_id;
                cursor_equipes refcursor;
				stmt varchar;				
                membro record;
                aux record;
        begin
                open cursor_membros;
                loop
                        fetch cursor_membros into membro;
                        exit when not found;
						
						raise notice 'membro: %', membro;
						
						stmt := 'select * from (select * from equipe inner join membro on equipe.id = membro.equipe_id and membro.perfil_id = ' || membro.perfil_id || ')
						as aux inner join equipemaratona on equipemaratona.equipe_id = aux.equipe_id and equipemaratona.maratona_id = $1';												
												
						execute stmt using new.maratona_id into aux;
						
						raise notice 'aux: %', aux;
						
                        if aux is not null then
							raise exception 'a equipe participando da maratona contem um membro vinculado a outra equipe participando na mesma maratona.';
						end if;                    
                end loop;

                return new;
        end;
$$ language plpgsql;

create trigger equipemaratona_insert_validate
before insert
on equipemaratona
for each row
execute procedure equipemaratona_insert_check();