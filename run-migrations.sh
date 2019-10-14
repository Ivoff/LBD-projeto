. ./env
for MIGRATIONS in $(ls ./migrations);  
    do echo "Executando: ${MIGRATIONS}";
    OUTPUT=$(PGPASSWORD=$DB_PASSWORD psql -h $HOST -d $DB_DATABASE -U $DB_USERNAME -p $PORT -b -w -f "./migrations/${MIGRATIONS}")
    if [ -n $nome ]
    then
        echo nome;
        echo "\nErro na migration ${MIGRATIONS}";
        exit;
    fi
done;
echo "\nMigrations Executadas com sucesso!!!";