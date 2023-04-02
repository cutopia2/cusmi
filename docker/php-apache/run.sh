#!/bin/zsh
sudo rm -rf .env
sudo rm -rf backup
sudo rm -rf mysql
# sudo rm -rf php
sudo rm -rf app
mkdir php
cp index.php php/index.php
cp phpinfo.php php/phpinfo.php
cp style.css php/style.css
# cat > .env <<EOF
# APP_VERSION=1.0.6
# PHP_VERSION=php:5.6-apache
# APP_PORT=83
# APP_PATH=./app
# MYSQL_VERSION=mysql:5.5
# MYSQL_PATH=./mysql
# MYSQL_DATABASE=smi
# MYSQL_USER=wwwrun
# MYSQL_PASSWORD=root
# MYSQL_ROOT_PASSWORD=root
# PHPMYADMIN_VERSION=latest
# PHPMYADMIN_PORT=8080
# TZ=Africa/Algiers
# BACKUP_VERSION=latest
# BACKUP_PATH=./backup
# MYSQL_CONTAINER_NAME=db
# EOF
# cp .env app/env
# # Load environment variables
# source .env

# Build and start containers
#docker-compose up -d

# Check container status
if ! docker-compose ps | grep -q "Up"; then
    echo "Error: one or more containers failed to start."
    docker-compose down
    exit 1
fi

# Wait for MySQL to start
# echo "Waiting for MySQL to start..."
# while ! docker exec -it ${MYSQL_CONTAINER_NAME} root ping --host=${MYSQL_HOST} --user=${MYSQL_USER} --password=${MYSQL_PASSWORD} --silent; do
#     sleep 1
# done
echo "MySQL started!"

# Import database dump (if available)
# if [ -f ${DB_DUMP_FILE} ]; then
#     echo "Importing database dump..."
#     docker exec -i ${MYSQL_CONTAINER_NAME} mysql --host=${MYSQL_HOST} --user=${MYSQL_USER} --password=${MYSQL_PASSWORD} ${MYSQL_DATABASE} < ${DB_DUMP_FILE}
# fi

# Open phpMyAdmin in browser (if enabled)
# if [ ${ENABLE_PHPMYADMIN} = true ]; then
#     open http://localhost:${PHPMYADMIN_PORT}
# fi

# Stop and remove all containers, volumes, and networks related to the project
#wget http://smi.fdsi.fr/down/smi_1.0.6.zip
 mkdir php/smi/
 mkdir php/REP
cp smi_1.0.6.zip php/smi/
cd php/smi
unzip smi_1.0.6.zip
cd ../../
cp .
docker-compose down -v
docker volume rm $(docker volume ls -q)
docker network rm $(docker network ls -q)
docker-compose up -d
pwd 
pwd 
pwd
sleep 1
docker cp smi_1.0.6.sql samplex_db_1:/root/
sleep 6
docker exec -i samplex_db_1 bash < initsql.sh

sleep 1
pwd 
pwd 
pwd
docker logs samplex_db_1
docker logs samplex_php_1
docker ps
cp prm.inc.php php/smi/inc/prm.inc.php
mkdir php/lng/

pwd 
pwd 
pwd
sleep 1
docker cp initsmi.sh samplex_php_1:/root/
sleep 6
docker exec -i samplex_php_1 bash < initsmi.sh

sleep 1
pwd 
pwd 
pwd

brave-browser http://0.0.0.0:8083/smi/index.php
