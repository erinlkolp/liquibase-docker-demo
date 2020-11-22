#!/bin/bash
set -e

ACTION=$1

docker pull ekolp/liquibase:latest

if [[ ${ACTION} == 'dbtargetone' ]]; then
    TARGET_DBS="demodb"
elif [[ ${ACTION} == 'dbtargettwo' ]]; then
    TARGET_DBS="demodb"
elif [[ ${ACTION} == 'dbtargetthree' ]]; then
    TARGET_DBS="demodb"
elif [[ ${ACTION} == 'local' ]]; then
    TARGET_DBS="demodb"
else
    echo "this isnt a valid option"
    exit 1
fi

migrate() {
    TARGET=$1
    DB=$2

    case $TARGET in
        dbtargetone)
            docker exec liquibase liquibase --url="jdbc:mysql://127.0.0.1:3306/${DB}" update
            ;;
        dbtargettwo)
            docker exec liquibase liquibase --url="jdbc:mysql://127.0.0.1:3306/${DB}" update
            ;;
        dbtargetthree)
            docker exec liquibase liquibase --url="jdbc:mysql://127.0.0.1:3306/${DB}" update
            ;;
        local)
            docker exec liquibase liquibase --url="jdbc:mysql://db:3306/${DB}" update
            ;;
    esac
}

setupsvcs() {
    echo ""
    docker-compose build
    echo ""
    docker-compose up -d
    echo ""
}


# Start up our dependent services.
setupsvcs

# Do migrations!
for SINGLE_DB in ${TARGET_DBS}
  do
    DATE=`date`

    echo ""
    echo "Schema change running for ${SINGLE_DB} on ${DATE}"
    sleep 5
    migrate ${ACTION} ${SINGLE_DB}
    echo ""
done
