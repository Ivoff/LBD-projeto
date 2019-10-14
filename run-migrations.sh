. ./env
sudo
for MIGRATIONS in $(ls ./migrations);  
    do echo "Executando: ${MIGRATIONS}";
    # $(cat ./migrations/${MIGRATIONS})
    PGPASSWORD=$DB_PASSWORD psql -h $HOST -d $DB_DATABASE -U $DB_USERNAME -p $PORT -a -w -f "./migrations/${MIGRATIONS}"
done;
echo "";
echo "Migrations Executadas com sucesso!!!";