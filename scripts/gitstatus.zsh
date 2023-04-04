#!/bin/zsh

# Define colors and icons
CHECKMARK=$'\u2713'
CROSS=$'\u274C'
DOCKER_ICON=$'\U1F40E'
GIT_ICON=$'\U1F5C3'
FILE_ICON=$'\U1F4C4'

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
VOLUME_ICON='💾'
NETWORK_ICON='🌐'
RUNNING_ICON='🟢'
STOPPED_ICON='🔴'
CREATED_ICON='🟡'

# Check git status
if ! status=$(git status --porcelain 2>/dev/null); then
  echo "${RED}${CROSS} Failed to retrieve git status.${NC}"
  exit 1
fi

# Display git status
if [ -n "$status" ]; then
  echo "${YELLOW}${GIT_ICON} Git status:${NC}"
  while IFS= read -r line; do
    case "$line" in
      \#\#*\ branch\ *) echo "${CYAN}$line${NC}" ;;
      *$'\t'*) echo "${RED}${FILE_ICON} $line${NC}" ;;
      *) echo "${GREEN}${FILE_ICON} $line${NC}" ;;
    esac
  done <<< "$status"
else
  echo "${GREEN}${CHECKMARK} Working directory clean.${NC}"
fi
################### other version ####################################
function gitstatus() {
    # Define colors for each status
    local added="\033[32m✔\033[0m"
    local modified="\033[33m✱\033[0m"
    local deleted="\033[31m✘\033[0m"
    local untracked="\033[34m?\033[0m"
    local clean="\033[32m✔\033[0m"

    # Define colors for each line
    local heading="\033[1m\033[34m"
    local added_color="\033[32m"
    local modified_color="\033[33m"
    local deleted_color="\033[31m"
    local untracked_color="\033[34m"
    local reset_color="\033[0m"

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
                echo -e "${clean}${line}${reset_color}"
                ;;
            *"$added"*)
                echo -e "${added_color}${added}${reset_color} ${line/$added/}${modified_color}${modified}${reset_color}"
                ;;
            *"$modified"*)
                echo -e "${modified_color}${modified}${reset_color} ${line/$modified/}${modified_color}${modified}${reset_color}"
                ;;
            *"$deleted"*)
                echo -e "${deleted_color}${deleted}${reset_color} ${line/$deleted/}${modified_color}${modified}${reset_color}"
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

