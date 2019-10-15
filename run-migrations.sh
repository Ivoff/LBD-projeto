red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

. ./env
for MIGRATION in migrations/*; do
    echo "${green}Executando${reset}: ${MIGRATION}";
    psql -h $HOST -d $DB_DATABASE -U $DB_USERNAME -p $PORT -f "${MIGRATION}"
    if [ $? -ne 0 ]
    then
        echo "${red}Encerrando devido a erro${reset}";
        break;
    else
        echo "${green}Sucesso!${reset}";
    fi
done;