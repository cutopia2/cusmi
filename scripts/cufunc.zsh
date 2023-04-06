#!/usr/bin/env sh
#######################################################################
# @author      : AbdElHakim ZOUAI                                     #
# @email       : (abdelhakimzouai@gmail.com)                          #
# @ID          : (002147483647@comptez.dz)                            #
# @Project     : cutopia Script                                       #
# @Client      : ticenergy                                            #
# @License     : MIT                                                  #
# @file        : init                                                 #
# @created     : الاثنين أفريل 03, 2023 04:45:11 CET                   #
# @description :                                                      #
#######################################################################

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



#######################################################################
# @author      : AbdElHakim ZOUAI                                     #
# @email       : (abdelhakimzouai@gmail.com)                          #
# @ID          : (002147483647@comptez.dz)                            #
# @Project     : cutopia Script                                       #
# @Client      : ticenergy                                            #
# @License     : MIT                                                  #
# @file        : init                                                 #
# @function    : init cutopia tst folder                              #
# @created     : الاثنين أفريل 03, 2023 04:45:11 CET                   #
# @description :                                                      #
#######################################################################
function init_cutopia_tst_folder {
  local cutopia_tst="$HOME/.cutopia/tst"
  
  if [ -d "$cutopia_tst" ]; then
    echo $'\n\033[0;32m✔\033[0m Cutopia test folder already exists: \033[0;34m'"$cutopia_tst"$'\033[0m\n'
    return 0
  else
    echo $'\n\033[0;33m❓\033[0m Cutopia test folder not found.'
    echo "Do you want to create it? [Y/n]"
    read create_folder_response
    case "$create_folder_response" in
      [nN]* )
        echo $'\n\033[0;31m✖\033[0m Operation cancelled.\n'
        return 1;;
      * )
        if ! command -v cusmi &> /dev/null; then
          echo $'\n\033[0;33m👀\033[0m Cusmi not found.'
          echo "Please provide the locations of your Cusmi install folders:"
          read -p $'\033[0;33m🎨  Icons Folder Location: \033[0m' cusmi_icons_folder
          read -p $'\033[0;33m🌈  Colors Folder Location: \033[0m' cusmi_colors_folder
        fi
        
        echo $'\n\033[0;32m✔\033[0m Creating Cutopia test folder...'
        mkdir -p "$cutopia_tst/{icons,colors}"
        
        if [ -n "$cusmi_icons_folder" ]; then
          cp -r "$cusmi_icons_folder" "$cutopia_tst/icons"
          echo $'\033[0;32m✔\033[0m Copied icons folder to: \033[0;34m'"$cutopia_tst/icons"$'\033[0m'
        fi
        
        if [ -n "$cusmi_colors_folder" ]; then
          cp -r "$cusmi_colors_folder" "$cutopia_tst/colors"
          echo $'\033[0;32m✔\033[0m Copied colors folder to: \033[0;34m'"$cutopia_tst/colors"$'\033[0m'
        fi
        
        echo $'\n\033[0;32m✔\033[0m Cutopia test folder created: \033[0;34m'"$cutopia_tst"$'\033[0m\n'
        return 0;;
    esac
  fi
}


#######################################################################
# @author      : AbdElHakim ZOUAI                                     #
# @email       : (abdelhakimzouai@gmail.com)                          #
# @ID          : (002147483647@comptez.dz)                            #
# @Project     : cutopia Script                                       #
# @Client      : ticenergy                                            #
# @License     : MIT                                                  #
# @file        : init                                                 #
# @function    : init docker & docker compose                         #
# @created     : الاثنين أفريل 03, 2023 04:45:11 CET                   #
# @description :                                                      #
#######################################################################
# Define the function
cutopia0() {
  # Set up options
  local home=false login=false
  local init=false update=false upgrade=false
  local migrate=false backup=false recovery=false
  local cycles=false clean=false remove=false

  # Parse command line options
  while getopts ":hl:iuUm:brc" opt; do
    case $opt in
      h) home=true;;
      l) login=true;;
      i) init=true;;
      u) update=true;;
      U) upgrade=true;;
      m) migrate=true;;
      b) backup=true;;
      r) recovery=true;;
      c) cycles=true;;
      C) clean=true;;
      R) remove=true;;
      \?) echo "Invalid option -$OPTARG" >&2;;
    esac
  done

  # Interactive menus
  if $home; then
    select option in "About" "Products" "Services" "Get Started" "Contact Us"; do
      case $option in
        "About") echo "You selected About"; break;;
        "Products") echo "You selected Products"; break;;
        "Services") echo "You selected Services"; break;;
        "Get Started") echo "You selected Get Started"; break;;
        "Contact Us") echo "You selected Contact Us"; break;;
        *) echo "Invalid option $REPLY";;
      esac
    done
  fi

  if $login; then
    select option in "Initialize" "Update" "Upgrade" "Migrate" "Backup" "Recovery" "Cycles" "Clean" "Remove"; do
      case $option in
        "Initialize")
          select suboption in "Docker" "Folders" "Subpro" "Fromrepo"; do
            case $suboption in
              "Docker") echo "You selected Docker"; break;;
              "Folders") echo "You selected Folders"; break;;
              "Subpro") echo "You selected Subpro"; break;;
              "Fromrepo")
                select repooption in "Culampo" "Cusmi" "Codibarr" "Cocalabs"; do
                  case $repooption in
                    "Culampo") echo "You selected Culampo"; break;;
                    "Cusmi") echo "You selected Cusmi"; break;;
                    "Codibarr") echo "You selected Codibarr"; break;;
                    "Cocalabs") echo "You selected Cocalabs"; break;;
                    *) echo "Invalid option $REPLY";;
                  esac
                done
                break;;
              *) echo "Invalid option $REPLY";;
            esac
          done
          break;;
        "Update") echo "You selected Update"; break;;
        "Upgrade") echo "You selected Upgrade"; break;;
        "Migrate") echo "You selected Migrate"; break;;
        "Backup") echo "You selected Backup"; break;;
        "Recovery") echo "You selected Recovery"; break;;
        "Cycles") echo "You selected Cycles"; break;;
        "Clean") echo "You selected Clean"; break;;
        "Remove") echo "You selected Remove"; break;;
        *) echo "Invalid option $REPLY";;
      esac
    done
  fi
}

#######################################################################
# @author      : AbdElHakim ZOUAI                                     #
# @email       : (abdelhakimzouai@gmail.com)                          #
# @ID          : (002147483647@comptez.dz)                            #
# @Project     : cutopia Script                                       #
# @Client      : ticenergy                                            #
# @License     : MIT                                                  #
# @file        : init                                                 #
# @function    : init docker & docker compose                         #
# @created     : الاثنين أفريل 03, 2023 04:45:11 CET                   #
# @description :                                                      #
#######################################################################
#!/bin/bash

function cutopia {

    # Define colors and icons
    green='\e[32m'
    blue='\e[34m'
    cyan='\e[36m'
    yellow='\e[33m'
    red='\e[31m'
    reset='\e[0m'
    check='\xE2\x9C\x94'
    cross='\xE2\x9D\x8C'
    folder='\xF0\x9F\x93\x81'
    wrench='\xE2\x9B\xA0'
    hammer='\xF0\x9F\x94\xA8'
    computer='\xF0\x9F\x96\xA5'
    book='\xF0\x9F\x93\x9A'
    globe='\xF0\x9F\x8C\x8D'
    phone='\xF0\x9F\x93\xB1'
    key='\xF0\x9F\x94\x91'

    # Define options and default values
    while getopts ":b:o:a:" opt; do
        case $opt in
            b) branch="$OPTARG";;
            o) os="$OPTARG";;
            a) app="$OPTARG";;
            *) echo "Invalid option -$OPTARG" >&2
                echo "Usage: cutopia [-b branch] [-o os] [-a app]" >&2
                return 1;;
        esac
    done

    # Check if the user is logged in
    # logged_in=false
    logged_in=true
    # Put login logic here

    if [ "$logged_in" = false ]; then
        # Display the default screen
        echo -e "${yellow}$globe Default screen:${reset}"
        echo -e "${yellow}$book About:${reset}"
        echo -e "${yellow}$folder Products:${reset}"
        echo -e "${yellow}$hammer Services:${reset}"
        echo -e "${yellow}$folder Contracts:${reset}"
        echo -e "${yellow}$computer Get Started:${reset}"
        echo -e "${yellow}$phone Contact Us:${reset}"
    else
        # Perform the selected action
        case $1 in
            "check")
                echo -e "${green}$check Check performed successfully.${reset}";;
            "clean")
                echo -e "${green}$check Clean performed successfully.${reset}";;
            "install")
                echo -e "${green}$check Install performed successfully.${reset}";;
            "update")
                echo -e "${green}$check Update performed successfully.${reset}";;
            "upgrade")
                echo -e "${green}$check Upgrade performed successfully.${reset}";;
            *)
                echo -e "${red}$cross Invalid action.${reset}"
                echo "Available actions: check, clean, install, update, upgrade" >&2
                return 1;;
        esac
    fi
}
################# test for cutopia #################################################
#!/bin/bash

# Test the cutopia function with different options
# cutopia -b test -o debian -a docker check
# cutopia -b stable -o proxmox -a cutopia check
# cutopia -b internal -o android -a cron upgrade
# cutopia -b tmp -o termux -a codibarr clean
# cutopia -o proxmox install
# cutopia -b Docs -a cusmi update
# cutopia -o android -a nextclod upgrade
# cutopia -b pmp -o debian check
# cutopia -b pmc -o proxmox install
#

#######################################################################
# @author      : AbdElHakim ZOUAI                                             #
# @email       : (abdelhakimzouai@gmail.com)                                          #
# @ID          : (002147483647@comptez.dz)                            #
# @Project     : cutopia Script                                       #
# @Client      : ticenergy                                            #
# @License     : MIT                                          #
# @file        : init                                             #
# @created     : الاثنين أفريل 03, 2023 04:45:11 CET                                        #
# @description :                                            #
#######################################################################
function cumkdir() {
  if [[ -z "$1" ]]; then
    echo -e "\033[31m✖ ERROR:\033[0m no directory name provided" >&2
    return 1
  fi
  if [ ! -d "$1" ]; then
    mkdir -p "$1" && echo -e "\033[32m✔\033[0m Created directory \033[34m$1\033[0m"
  else
    echo -e "\033[33m⚠\033[0m Directory \033[34m$1\033[0m already exists"
  fi
}

#######################################################################
# @author      : AbdElHakim ZOUAI                                     #
# @email       : (abdelhakimzouai@gmail.com)                          #
# @ID          : (002147483647@comptez.dz)                            #
# @Project     : cutopia Script                                       #
# @Client      : ticenergy                                            #
# @License     : MIT                                                  #
# @file        : init                                                 #
# @function    : cushow (git status -u .)                             #
# @created     : الاثنين أفريل 03, 2023 04:45:11 CET                   #
# @description :                                                      #
#######################################################################
function gitstatus() {
    # Define colors for each status
    local added="${GREEN}${CHECK_ICON}${NC}"
    local modified="${YELLOW}${BROOM_ICON}${NC}"
    local deleted="${RED}${REMOVE_ICON}${NC}"
    local renamed="${CYAN}✚${NC}"
    local untracked="${CYAN}${TRASH_CAN_ICON}${NC}"
    local clean="${GREEN}${SUCCESS_ICON}${NC}"

    # Define colors for each line
    local heading="${CYAN}"
    local added_color="${GREEN}"
    local modified_color="${YELLOW}"
    local deleted_color="${RED}"
    local renamed_color="${CYAN}"
    local untracked_color="${CYAN}"
    local clean_color="${GREEN}"
    local reset_color="${NC}"

    # Run "git status -u .", store the output in a variable
    local status="$(git status -u .)"

    # Print out each line in the output with its status and color
    echo "${status}" | while read line; do
        case "${line}" in
            "Changes to be committed:"*)
                echo -e "\n${heading}${line}${reset_color}"
                ;;
            "Changes not staged for commit:"*)
                echo -e "\n${heading}${line}${reset_color}"
                ;;
            "Untracked files:"*)
                echo -e "\n${heading}${line}${reset_color}"
                ;;
            "no changes added to commit"*)
                echo -e "${clean_color}${clean}${reset_color} ${line}${reset_color}"
                ;;
            *"$added"*)
                echo -e "${added_color}${added}${reset_color} ${line/$added/}${renamed_color}${renamed}${reset_color}"
                ;;
            *"$modified"*)
                echo -e "${modified_color}${modified}${reset_color} ${line/$modified/}${modified_color}${modified}${reset_color}"
                ;;
            *"$deleted"*)
                echo -e "${deleted_color}${deleted}${reset_color} ${line/$deleted/}${modified_color}${modified}${reset_color}"
                ;;
            *"$renamed"*)
                echo -e "${renamed_color}${renamed}${reset_color} ${line/$renamed/}${renamed_color}${renamed}${reset_color}"
                ;;
            *"$untracked"*)
                echo -e "${untracked_color}${untracked}${reset_color} ${line/$untracked/}${modified_color}${modified}${reset_color}"
                ;;
            *)
                echo "${line}"
                ;;
        esac
    done
}
############################################################

cucp() {
  while getopts "s:d:" opt; do
    case $opt in
      s) sourceData=$OPTARG;;
      d) distinData=$OPTARG;;
      \?) echo "Invalid option -$OPTARG" >&2;;
    esac
  done
  
  echo "${BOLD}Copying ${sourceData} to ${distinData}...${NO_COLOR}"
  cp -r $sourceData $distinData && echo "${GREEN}${CHECK_ICON} Successfully copied ${sourceData} to ${distinData}.${NO_COLOR}" || { echo "${RED}${CROSS_ICON} Failed to copy ${sourceData} to ${distinData}.${NO_COLOR}"; exit 1; }
}
############################################################
cumpresd() {
  local OPTIND OPTARG
  local input_file output_file
  local red='\033[0;31m' green='\033[0;32m' yellow='\033[0;33m'
  local blue='\033[0;34m' magenta='\033[0;35m' cyan='\033[0;36m' reset='\033[0m'
  local tick='\u2713' cross='\u2717' warning='\u26A0'

  while getopts ":cd" opt; do
    case $opt in
      c) # Compress
        input_file=${OPTARG}
        output_file="${input_file}.tar.gz"
        if [ -f "${output_file}" ]; then
          printf "${magenta}${warning}${reset} File '%s' already exists. Overwrite? (y/N) " "${output_file}"
          read -r answer
          [[ "${answer}" != "y" && "${answer}" != "Y" ]] && printf "${red}${cross}${reset} Compression aborted.\n" && return 1
        fi
        tar czf "${output_file}" "${input_file}" >/dev/null 2>&1
        [[ $? -eq 0 ]] && printf "${green}${tick}${reset} File '%s' compressed to '%s'.\n" "${input_file}" "${output_file}" || { printf "${red}${cross}${reset} Failed to compress '%s'.\n" "${input_file}"; return 1; }
        ;;
      d) # Decompress
        input_file=${OPTARG}
        case "${input_file}" in
          *.tar.bz2|*.tbz2) tar xvjf "${input_file}"  ;;
          *.tar.gz|*.tgz)   tar xvzf "${input_file}"  ;;
          *.tar.xz)         tar xvJf "${input_file}"  ;;
          *.bz2)            bunzip2 "${input_file}"   ;;
          *.rar)            unrar x "${input_file}"   ;;
          *.gz)             gunzip "${input_file}"    ;;
          *.tar)            tar xvf "${input_file}"   ;;
          *.zip)            unzip "${input_file}"     ;;
          *.Z)              uncompress "${input_file}" ;;
          *.7z)             7z x "${input_file}"      ;;
          *.xz)             unxz "${input_file}"      ;;
          *)                printf "${red}${cross}${reset} '%s' is not a valid compressed file.\n" "${input_file}" && return 1 ;;
        esac
        [[ $? -eq 0 ]] && printf "${green}${tick}${reset} File '%s' decompressed.\n" "${input_file}" || { printf "${red}${cross}${reset} Failed to decompress '%s'.\n" "${input_file}"; return 1; }
        ;;
      \?) # Invalid option
        printf "${red}${cross}${reset} Invalid option: '-%s'.\n" "${OPTARG}" && return 1
        ;;
    esac
  done

  # No option specified
  if [ -z "${input_file}" ]; then
    printf "${blue}${warning}${reset} Please specify a file to compress or decompress.\n" && return 1
  fi
}
#########################################################################
function cucd() {
  builtin cd "$@" && echo -e "\033[32m\U2714\033[0m Changed directory to \033[1m$(pwd)\033[0m"
  if [ $? -ne 0 ]; then
    echo -e "\033[31m\U2718\033[0m Failed to change directory"
    return 1
  fi
}
#########################################################################
# Add colors and icons to docker-compose build
# Add colors and icons to docker-compose build
function docker-compose-build() {
  # Define colors and icons
  local red='\033[0;31m'
  local green='\033[0;32m'
  local yellow='\033[0;33m'
  local blue='\033[0;34m'
  local purple='\033[0;35m'
  local cyan='\033[0;36m'
  local gray='\033[0;37m'
  local reset='\033[0m'
  local checkmark='\xE2\x9C\x93'
  local warning='\xE2\x9A\xA0'
  local error='\xE2\x9D\x8C'
  local lightbulb='\xF0\x9F\x9A\xA8'
  local rocket='\xF0\x9F\x9A\x80'
  local hammer='\xF0\x9F\x94\xA8'
  local star='\xE2\xAD\x90'

  # Execute docker-compose build with colored output
  docker-compose build --progress=plain \
    | while read line; do
        case $line in
          *Building*)
            echo "${purple}${rocket} $line${reset}"
            ;;
          *Step*)
            echo "${cyan}${hammer} $line${reset}"
            ;;
          *Pulling*)
            echo "${gray}${lightbulb} $line${reset}"
            ;;
          *Successfully*)
            echo "${green}${checkmark} $line${reset}"
            ;;
          *Complete*)
            echo "${blue}${star} $line${reset}"
            ;;
          *Warning*)
            echo "${yellow}${warning} $line${reset}"
            ;;
          *ERROR*)
            echo "${red}${error} $line${reset}"
            ;;
          *)
            echo "${line}"
            ;;
        esac
      done

  # Print report of errors and warnings
  local error_count=$(docker-compose build --quiet-pull --no-cache | grep -c "^ERROR")
  local warning_count=$(docker-compose build --quiet-pull --no-cache | grep -c "^Warning")
  if [ $error_count -gt 0 ] || [ $warning_count -gt 0 ]; then
    echo "${red}${error_count} errors, ${yellow}${warning_count} warnings${reset}"
    docker-compose build --quiet-pull --no-cache \
      | while read line; do
          case $line in
            *ERROR*)
              echo "${red}${error} $line${reset}"
              ;;
            *Warning*)
              echo "${yellow}${warning} $line${reset}"
              ;;
            *)
              echo "${line}"
              ;;
          esac
        done
  else
    echo "${green}${checkmark} No errors or warnings${reset}"
  fi
}
#################################################################
function docker-compose-up() {
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
      *"apt-get"* )
        echo -e "${italic}${yellow}➜ ${reset}${italic}${line}${reset}"
        ;;
      * )
        echo -e "${yellow}➜ ${reset}$line"
        ;;
    esac
  done

  echo -e "${yellow}┌──────────────────────────────────────────────────────┐${reset}"
  echo -e "          ${cyan}🎉 All containers are up and running!${reset}"
  echo -e "${yellow}└──────────────────────────────────────────────────────┘${reset}\n"
}
#######################################################################
function create_startup_folder_structure() {
  mkdir -p \
    "Company information" \
    "Finance" \
    "Human resources" \
    "Marketing" \
    "Operations" \
    "Client projects" \
    "Internal projects" \
    "Administration" \
    "IT" \
    "Legal" \
    "Sales" \
    "Country folders"
}
######################################################################

