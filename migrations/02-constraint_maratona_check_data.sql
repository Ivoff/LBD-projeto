ALTER TABLE Maratona ADD CONSTRAINT maratona_check_data CHECK (
   inscricao_comeco > NOW()
   AND inscricao_termino >  inscricao_comeco 
   AND horario_comeco > inscricao_termino
   AND horario_termino > horario_comeco
);