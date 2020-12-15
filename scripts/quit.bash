#!/bin/bash
# For changs to the database to persist use this script instead of calling `docker-compose down` directly

dump_db=slippers
dump_path=/mysqldump.sql
db_name=mariadb
container_id=$(docker ps | awk "/$db_name/{print \$1}")

if [ -n $continer_id ]; then
	# Dump the content of the database and copy it to the host
	docker exec $container_id bash -c "mysqldump --databases $dump_db > $dump_path"
	docker cp $container_id:$dump_path ${0%/*}/../db/mysqldump.sql && docker-compose down
else
	echo "Database container $db_name not found"; exit 1;
fi