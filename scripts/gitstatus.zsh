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

