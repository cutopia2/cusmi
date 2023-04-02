#!/usr/bin/env zsh
function chocoticenergy {

# Define color codes
blue="\e[34m"
green="\e[32m"
reset="\e[0m"

# Define ticenergy ASCII art
ticenergy_art="
${green}
 _____ _____ _____ _____ _____ _____ _____ _____ _____                           
|\   /|\   /|\   /|\   /|\   /|\   /|\   /|\   /|\   /|                                   
| +-+ | +-+ | +-+ | +-+ | +-+ | +-+ | +-+ | +-+ | +-+ |                                     
| |t| | |i| | |c| | |e| | |n| | |e| | |r| | |g| | |y| |                         
| +-+ | +-+ | +-+ | +-+ | +-+ | +-+ | +-+ | +-+ | +-+ |                         
|/___\|/___\|/___\|/___\|/___\|/___\|/___\|/___\|/___\|                              
${reset}
"

# Print the ticenergy ASCII art in color
echo "${green}${ticenergy_art}${reset}"
}

function chocutopia {

# Define color codes
blue="\e[34m"
green="\e[32m"
reset="\e[0m"

# Define ticenergy ASCII art
ticenergy_art="
${green}
	 _____ _____ _____ _____ _____ _____ _____                           
	|\   /|\   /|\   /|\   /|\   /|\   /|\   /|                                   
	| +-+ | +-+ | +-+ | +-+ | +-+ | +-+ | +-+ |                                     
	| |c| | |u| | |t| | |o| | |p| | |i| | |a| |                         
	| +-+ | +-+ | +-+ | +-+ | +-+ | +-+ | +-+ |                         
	|/___\|/___\|/___\|/___\|/___\|/___\|/___\|                              
${reset}
"

# Print the ticenergy ASCII art in color
echo "${green}${ticenergy_art}${reset}"
}
chocoticenergy
chocutopia
# Test Docker installation
if docker -v > /dev/null 2>&1; then
  echo "\033[32m[Docker]\033[0m installed ✔️"
else
  echo "\033[31m[Docker]\033[0m not installed ❌"
fi

# Test Docker Compose installation
if docker-compose -v > /dev/null 2>&1; then
  echo "\033[32m[Docker Compose]\033[0m installed ✔️"
else
  echo "\033[31m[Docker Compose]\033[0m not installed ❌"
fi

# Test Docker containers
if docker ps > /dev/null 2>&1; then
  echo "\033[32m[Docker Containers]\033[0m running ✔️"
else
  echo "\033[31m[Docker Containers]\033[0m not running ❌"
fi

# Test Docker volumes
if docker volume ls > /dev/null 2>&1; then
  echo "\033[32m[Docker Volumes]\033[0m present ✔️"
else
  echo "\033[31m[Docker Volumes]\033[0m not present ❌"
fi

# Test Docker networks
if docker network ls > /dev/null 2>&1; then
  echo "\033[32m[Docker Networks]\033[0m present ✔️"
else
  echo "\033[31m[Docker Networks]\033[0m not present ❌"
fi

chocutopia
chocoticenergy
