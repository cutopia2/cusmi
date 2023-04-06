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

cucp -s scripts/tst.zsh -d tsttttt.zsh
