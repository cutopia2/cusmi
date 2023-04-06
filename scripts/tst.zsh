# source scripts/cufunc.zsh
# docker-compose-build

# Function to run docker-compose up with pretty output
function docker-up() {
  local green='\033[0;32m'
  local yellow='\033[0;33m'
  local cyan='\033[0;36m'
  local red='\033[0;31m'
  local reset='\033[0m'
  local bold='\033[1m'
  local italic='\033[3m'
  local underline='\033[4m'
  
  echo -e "${yellow}┌──────────────────────────────────────────┐${reset}"
  echo -e "${cyan}        🚀 Starting docker-compose...${reset}"
  echo -e "${yellow}└──────────────────────────────────────────┘${reset}\n"


  docker-compose up -d | while read line; do
    case $line in
      *"Creating"* )
        container=$(echo "$line" | cut -d' ' -f2)
        service=$(echo "$container" | cut -d'_' -f1)
        echo -e "${green}✔ ${reset}${cyan}$service${reset} ${green}Creating${reset} ${yellow}$container${reset}"
        ;;
      *"Starting"* )
        container=$(echo "$line" | cut -d' ' -f2)
        service=$(echo "$container" | cut -d'_' -f1)
        echo -e "${green}✔ ${reset}${cyan}$service${reset} ${green}Starting${reset} ${yellow}$container${reset}"
        ;;
      *"Attaching to"* )
        container=$(echo "$line" | cut -d' ' -f3)
        service=$(echo "$container" | cut -d'_' -f1)
        echo -e "${cyan}🐳 ${reset}${cyan}$service${reset} ${yellow}Attached to${reset} ${yellow}$container${reset}"
        ;;
      *"exited with code"* )
        container=$(echo "$line" | cut -d' ' -f1 | tr -d ':')
        service=$(echo "$container" | cut -d'_' -f1)
        echo -e "${red}✘ ${reset}${cyan}$service${reset} ${red}Stopped${reset} ${yellow}$container${reset}"
        ;;
      *"ERROR"* )
        echo -e "${red}🛑 ${reset}$line"
        ;;
      *"Step"* )
        step=$(echo "$line" | sed -e 's/^.*Step/Step/' -e 's/:$//' -e 's/\.$//')
        echo -e "${cyan}👉 ${reset}${cyan}${step}${reset}"
        ;;
      # *"apt-get"* )
      #   echo -e "${italic}${yellow}➜ ${reset}${italic}${line}${reset}"
      #   ;;
      * )
        echo -e "${yellow}➜ ${reset}$line"
        ;;
    esac
  done

  echo -e "${yellow}┌──────────────────────────────────────────────────────┐${reset}"
  echo -e "          ${cyan}🎉 All containers are up and running!${reset}"
  echo -e "${yellow}└──────────────────────────────────────────────────────┘${reset}\n"
}

docker-up
