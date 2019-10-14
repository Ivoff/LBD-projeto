. ./env
for MIGRATIONS in $(ls ./migrations);  
    do echo ${MIGRATIONS};
    psql postgres -c "cat ${MIGRATIONS}" --host=$HOST --port=$PORT -d $DB_DATABASE -U $DB_USERNAME --password=$DB_PASSWORD;
done;