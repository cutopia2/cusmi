#!/bin/zsh

# Stop and remove all Docker containers
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

# Remove all unused Docker images
#docker image prune -a

# Remove all unused Docker networks
docker network prune

# Remove all unused Docker volumes
docker volume prune

# Remove all unused Docker build cache
docker builder prune

# Remove all docker system
#docker system prune -a

#docker-compose down

# Build the Docker image
#!/bin/zsh
# volume
mkdir smifiles
# Build the Docker image
docker build --tag smiphp .

# Create a named volume for the PHP application files
docker volume create smifile

# Run the Docker container, mounting the volume to /var/www/html
docker run -p 8080:80 \
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_USER=wwrun \
  -e MYSQL_PASSWORD=root \
  -e MYSQL_DATABASE=smi \
  --name smiphp \
  --mount type=volume,source=smifiles,target=/var/www/html \
  smiphp
