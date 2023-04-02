#!/usr/bin/env zsh

# Define some icons and colors
STOP_ICON="❌"
REMOVE_ICON="🗑️"
CHECK_ICON="✅"
YELLOW="\e[33m"
GREEN="\e[32m"
NC="\e[0m"

# Stop and remove all containers
echo "\n${STOP_ICON} ${YELLOW}Stopping all running containers...${NC}"
docker stop $(docker ps -a -q) > /dev/null 2>&1
echo "${CHECK_ICON} ${GREEN}All running containers stopped!${NC}"

echo "\n${REMOVE_ICON} ${YELLOW}Removing all containers...${NC}"
docker rm $(docker ps -a -q) > /dev/null 2>&1
echo "${CHECK_ICON} ${GREEN}All containers removed!${NC}"

# Remove all volumes
echo "\n${REMOVE_ICON} ${YELLOW}Removing all volumes...${NC}"
docker volume rm $(docker volume ls -q) > /dev/null 2>&1
echo "${CHECK_ICON} ${GREEN}All volumes removed!${NC}"

# Remove all networks
echo "\n${REMOVE_ICON} ${YELLOW}Removing all networks...${NC}"
docker network rm $(docker network ls -q) > /dev/null 2>&1
echo "${CHECK_ICON} ${GREEN}All networks removed!${NC}"

# Remove all Docker Compose builds
echo "\n${REMOVE_ICON} ${YELLOW}Removing all Docker Compose builds...${NC}"
docker-compose down --rmi all -v > /dev/null 2>&1
echo "${CHECK_ICON} ${GREEN}All Docker Compose builds removed!${NC}"

# Test Docker
echo "\n${CHECK_ICON} ${YELLOW}Testing Docker...${NC}"
docker run --rm hello-world > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "${CHECK_ICON} ${GREEN}Docker is working correctly!${NC}"
else
    echo "${STOP_ICON} ${YELLOW}Docker test failed!${NC}"
fi

# Test Docker Compose
echo "\n${CHECK_ICON} ${YELLOW}Testing Docker Compose...${NC}"
docker-compose --version > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "${CHECK_ICON} ${GREEN}Docker Compose is installed!${NC}"
else
    echo "${STOP_ICON} ${YELLOW}Docker Compose is not installed!${NC}"
fi

# Test Docker Compose up
echo "\n${CHECK_ICON} ${YELLOW}Testing Docker Compose up...${NC}"
docker-compose up -d > /dev/null 2>&1
sleep 5
if docker ps | grep -q 'webserver'; then
    echo "${CHECK_ICON} ${GREEN}Docker Compose up is working correctly!${NC}"
else
    echo "${STOP_ICON} ${YELLOW}Docker Compose up test failed!${NC}"
fi

# Clean up
echo "\n${REMOVE_ICON} ${YELLOW}Cleaning up...${NC}"
docker-compose down -v > /dev/null 2>&1
echo "${CHECK_ICON} ${GREEN}All Docker Compose builds removed!${NC}"

