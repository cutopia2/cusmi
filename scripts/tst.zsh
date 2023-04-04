#!/bin/zsh

# Define colors and icons
ZSH_COLOR_RED='%F{red}'
ZSH_COLOR_YELLOW='%F{yellow}'
ZSH_COLOR_GREEN='%F{green}'
ZSH_COLOR_BLUE='%F{blue}'
ZSH_COLOR_RESET='%f'

ZSH_ICON_MODIFIED='✹'
ZSH_ICON_ADDED='✚'
ZSH_ICON_DELETED='✖'
ZSH_ICON_RENAMED='➜'
ZSH_ICON_COPIED='➜'
ZSH_ICON_UNMERGED='═'

# Run git status and format the output
git_status=$(git status -u . | sed -e "s/^.*\([A-Z]\{2\}\).*$/\1/")
echo $git_status | while read line; do
  case $line in
    \#\#*\ branch\ *)
      echo "${ZSH_COLOR_BLUE}${line}${ZSH_COLOR_RESET}"
      ;;
    *modified:*)
      echo "${ZSH_ICON_MODIFIED} ${ZSH_COLOR_RED}${line}${ZSH_COLOR_RESET}"
      ;;
    *deleted:*)
      echo "${ZSH_ICON_DELETED} ${ZSH_COLOR_RED}${line}${ZSH_COLOR_RESET}"
      ;;
    *renamed:*)
      echo "${ZSH_ICON_RENAMED} ${ZSH_COLOR_YELLOW}${line}${ZSH_COLOR_RESET}"
      ;;
    *copied:*)
      echo "${ZSH_ICON_COPIED} ${ZSH_COLOR_YELLOW}${line}${ZSH_COLOR_RESET}"
      ;;
    *added:*)
      echo "${ZSH_ICON_ADDED} ${ZSH_COLOR_GREEN}${line}${ZSH_COLOR_RESET}"
      ;;
    *unmerged:*)
      echo "${ZSH_ICON_UNMERGED} ${ZSH_COLOR_RED}${line}${ZSH_COLOR_RESET}"
      ;;
    *)
      echo $line
      ;;
  esac
done

