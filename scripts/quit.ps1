# For changs to the database to persist use this script instead of calling `docker-compose down` directly
$dump_db = "slippers"
$dump_path = "/mysqldump.sql"
$db_name = "mariadb"
$container_id = (docker ps -aqf "ancestor=$db_name")

if ( $container_id )
{
    # Dump the content of the database and copy it to the host
    docker exec -it $container_id /bin/bash -c "mysqldump --databases $dump_db > $dump_path"
    docker cp "${container_id}:${dump_path}" ../db/mysqldump.sql
    docker-compose down
}
else
{
    echo "Database container $db_name not found"
}
