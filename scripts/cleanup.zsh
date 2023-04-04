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
FAILED_ICON='❌'
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

#Remove .env file
echo "\n${TRASH_ICON} ${YELLOW}Removing .env file...${NC}"
if sudo rm -rf .env > /dev/null 2>&1; then
echo "${SUCCESS_ICON} ${GREEN}.env file removed!${NC}"
else
echo "${FAILED_ICON} ${RED}Failed to remove .env file!${NC}"
fi

#Remove backup directory
echo "\n${TRASH_ICON} ${YELLOW}Removing backup directory...${NC}"
if sudo rm -rf app/build/backup > /dev/null 2>&1; then
echo "${SUCCESS_ICON} ${GREEN}Backup directory removed!${NC}"
else
echo "${FAILED_ICON} ${RED}Failed to remove backup directory!${NC}"
fi

#Remove mysql directory
echo "\n${TRASH_ICON} ${YELLOW}Removing mysql directory...${NC}"
if sudo rm -rf app/build/mysql > /dev/null 2>&1; then
echo "${SUCCESS_ICON} ${GREEN}Mysql directory removed!${NC}"
else
echo "${FAILED_ICON} ${RED}Failed to remove mysql directory!${NC}"
fi

#Remove php directory
echo "\n${TRASH_ICON} ${YELLOW}Removing php directory...${NC}"
if sudo rm -rf app/build/php > /dev/null 2>&1; then
echo "${SUCCESS_ICON} ${GREEN}PHP directory removed!${NC}"
else
echo "${FAILED_ICON} ${RED}Failed to remove php directory!${NC}"
fi

#Remove app directory
echo "\n${TRASH_ICON} ${YELLOW}Removing app/build/* directory...${NC}"
if sudo rm -rf app/build/ > /dev/null 2>&1; then
echo "${SUCCESS_ICON} ${GREEN}App directory removed!${NC}"
else
echo "${FAILED_ICON} ${RED}Failed to remove app/build directory!${NC}"
fi

#Test report
echo "\n${BROOM_ICON} ${CYAN}[Clean Up]${NC} ${GREEN}Completed!${NC} ${TRASH_CAN_ICON}\n"

echo "-----------------------"
echo " Clean Up Test Report "
echo "-----------------------"
echo "- .env file: $(if [ -f .env ]; then echo "${FAILED_ICON} ${RED}Not removed!${NC}"; else echo "${SUCCESS_ICON} ${GREEN}Removed!${NC}"; fi)"
echo "- backup directory: $(if [ -d backup ]; then echo "${FAILED_ICON} ${RED}Not removed!${NC}"; else echo "${SUCCESS_ICON} ${GREEN}Removed!${NC}"; fi)"
echo "- mysql directory: $(if [ -d mysql ]; then echo "${FAILED_ICON} ${RED}Not removed!${NC}"; else echo "${SUCCESS_ICON} ${GREEN}Removed!${NC}"; fi)"
echo "- php directory: $(if [ -d php ]; then echo "${FAILED_ICON} ${RED}Not removed!${NC}"; else echo "${SUCCESS_ICON} ${GREEN}Removed!${NC}"; fi)"
echo "- app/build directory: $(if [ -d app/build ]; then echo "${FAILED_ICON} ${RED}Not removed!${NC}"; else echo "${SUCCESS_ICON} ${GREEN}Removed!${NC}"; fi)"
