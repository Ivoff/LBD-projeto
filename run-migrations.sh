red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
OUTPUT=""

. ./env
for MIGRATIONS in $(ls ./migrations);  
    do echo "\n${green}Executando: ${MIGRATIONS}${reset}";
    OUTPUT=$(PGPASSWORD=$DB_PASSWORD psql -h $HOST -d $DB_DATABASE -U $DB_USERNAME -p $PORT -f "./migrations/${MIGRATIONS}")
    if [ -n $OUTPUT ]
    then
        echo "\n${red}Erro na migration ${MIGRATIONS}: ${reset}";
        echo $OUTPUT
        break;
    else
        echo "${green}Sucesso:${reset} ${MIGRATIONS}:";
    fi
done;