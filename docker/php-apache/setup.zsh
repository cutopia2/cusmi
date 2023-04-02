#!/bin/zsh

#Define color codes and icons
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'
STOP_ICON='🛑'
REMOVE_ICON='🗑️'
CHECK_ICON='✔️'
BROOM_ICON='🧹'
TRASH_CAN_ICON='🚮'
TRASH_ICON='🗑️'
SUCCESS_ICON='✅'
# FAILED_ICON='❌'
# ERROR_ICON='❌'
# WARNING_ICON='❌'
# Define colors and icons
FAILED_ICON='\xE2\x9D\x8C'  # red cross mark
ERROR_ICON='\xE2\x9D\x8C'  # red cross mark
WARNING_ICON='\xE2\x9A\xA0' # yellow warning sign
# Stop and remove all Docker containers
printf "${YELLOW}Stopping and removing all Docker containers...${NC}\n"
docker stop $(docker ps -a -q) && \
docker rm $(docker ps -a -q) && \
printf "${GREEN}${SUCCESS_ICON} Successfully stopped and removed all Docker containers.${NC}\n\n"

# Remove all unused Docker networks
printf "${YELLOW}Removing all unused Docker networks...${NC}\n"
docker network prune && \
printf "${GREEN}${SUCCESS_ICON} Successfully removed all unused Docker networks.${NC}\n\n"

# Remove all unused Docker volumes
printf "${YELLOW}Removing all unused Docker volumes...${NC}\n"
docker volume prune && \
printf "${GREEN}${SUCCESS_ICON} Successfully removed all unused Docker volumes.${NC}\n\n"

# Remove all unused Docker build cache
printf "${YELLOW}Removing all unused Docker build cache...${NC}\n"
docker builder prune && \
printf "${GREEN}${SUCCESS_ICON} Successfully removed all unused Docker build cache.${NC}\n\n"

# Remove application files
printf "${YELLOW}Removing application files...${NC}\n"
rm -rf smifiles && \
printf "${GREEN}${SUCCESS_ICON} Successfully removed application files.${NC}\n\n"

# Build the Docker image
printf "${YELLOW}Building the Docker image...${NC}\n"
docker build --tag smiphp . && \
printf "${GREEN}${SUCCESS_ICON} Successfully built the Docker image.${NC}\n\n"

# Create a named volume for the PHP application files
printf "${YELLOW}Creating a named volume for the PHP application files...${NC}\n"
docker volume create smifile && \
printf "${GREEN}${SUCCESS_ICON} Successfully created a named volume for the PHP application files.${NC}\n\n"

# Run the Docker container, mounting the volume to /var/www/html
printf "${YELLOW}Running the Docker container...${NC}\n"
docker run -p 8080:80 \
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_USER=wwrun \
  -e MYSQL_PASSWORD=root \
  -e MYSQL_DATABASE=smi \
  --name smiphp \
  --mount type=volume,source=smifiles,target=/var/www/html \
  smiphp && \
printf "${GREEN}${SUCCESS_ICON} Successfully ran the Docker container.${NC}\n"

