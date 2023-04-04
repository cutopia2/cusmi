#!/bin/zsh

# Define colors and icons
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
ERROR_ICON='❌'
DOCKER_ICON='🐳'
VOLUME_ICON='💾'
NETWORK_ICON='🌐'
RUNNING_ICON='🟢'
STOPPED_ICON='🔴'
CREATED_ICON='🟡'
CPU_ICON='💻'
MEMORY_ICON='🧠'
IO_ICON='📈'

# Display information about Docker containers
echo "${YELLOW}=== Docker Containers ===${NC}"
docker ps --format "table \
{{if eq .State \"running\"}}${GREEN}${RUNNING_ICON}{{else}}${RED}${STOPPED_ICON}{{end}}\t \
{{.Names}}\t \
{{.Status}}\t \
{{.Image}}\t \
{{.Ports}}\t \
{{.ID}} \
" \
| sed '1s/^/STATE\tNAME\tSTATUS\tIMAGE\tPORTS\tCONTAINER ID\n/'

# Display information about Docker Compose containers
echo "${YELLOW}=== Docker Compose Containers ===${NC}"
docker-compose ps --services | while read service; do
  status="$(docker-compose ps -q "${service}" | xargs docker inspect --format='{{.State.Status}}' 2>/dev/null)"
  if [[ -n "$status" ]]; then
    echo -e "${GREEN}${CHECK_ICON}${NC} ${CYAN}${service}${NC} (${status})"
  else
    echo -e "${RED}${REMOVE_ICON}${NC} ${CYAN}${service}${NC}"
  fi
done

# Display information about Docker volumes
echo "${YELLOW}=== Docker Volumes ===${NC}"
docker volume ls --format "table \
${VOLUME_ICON}\t \
{{.Name}}\t \
{{.Driver}}\t \
{{.Mountpoint}} \
" \
| sed '1s/^/VOLUME\tNAME\tDRIVER\tMOUNTPOINT\n/'

# Display information about Docker networks
echo "${YELLOW}=== Docker Networks ===${NC}"
docker network ls --format "table \
${NETWORK_ICON}\t \
{{.Name}}\t \
{{.Driver}} \
" \
| sed '1s/^/NETWORK\tNAME\tDRIVER\n/'

# Display IP routes for Docker networks
echo "${YELLOW}=== Docker Network IP Routes ===${NC}"
for network in $(docker network ls --format "{{.Name}}"); do
  echo "${CYAN}${network}:${NC}"
  docker network inspect "${network}" --format "{{range .IPAM.Config}}{{.Subnet}}{{end}}" | while read subnet; do
    echo "  ${subnet}"
    docker run --rm --net "${network}" alpine ip route | sed 's/^/    /'
  done
done

# Display network relations for Docker containers
echo "${YELLOW}=== Docker Container Network Relations ===${NC}"
docker ps --

