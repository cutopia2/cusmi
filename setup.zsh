#!/usr/bin/env sh
#######################################################################
# @author      : AbdElHakim ZOUAI                                     #
# @email       : (abdelhakimzouai@gmail.com)                          #
# @ID          : (002147483647@compte.dz)                             #
# @Project     : cutopia Script                                       #
# @Client      : ticenergy                                            #
# @License     : MIT                                                  #
# @file        : setup                                                #
# @created     : السبت أفريل 01, 2023 04:52:43 CET                    #
# @description :                                                      #
#######################################################################
#!/usr/bin/env zsh
source ./scripts/init.zsh
# Define the function
# Define the function
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

# sudo rm -r app/build
# tstmkcd "app/build"
# cp -r app/src/php app/build
# tstmkcd "app/build/smi"
# cp app/src/smi_1.0.6.zip app/build/smi/
# cd app/build/smi/
# unzip smi_1.0.6.zip

#!/bin/zsh

# Define color and icon variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NO_COLOR='\033[0m'
CHECK_ICON='\xE2\x9C\x94'
CROSS_ICON='\xE2\x9D\x8C'

source scripts/cleanup.zsh

# Create app/build directory
echo "${BOLD}Creating app/build directory...${NO_COLOR}"
mkdir -p app/build && echo "${GREEN}${CHECK_ICON} Successfully created app/build directory.${NO_COLOR}" || { echo "${RED}${CROSS_ICON} Failed to create app/build directory.${NO_COLOR}"; exit 1; }



# Create app/build/backup directory
echo "${BOLD}Creating app/build/backup directory...${NO_COLOR}"
mkdir -p app/build/backup && echo "${GREEN}${CHECK_ICON} Successfully created app/build/backup directory.${NO_COLOR}" || { echo "${RED}${CROSS_ICON} Failed to create app/build directory.${NO_COLOR}"; exit 1; }


# Create app/build/backup directory
echo "${BOLD}Creating app/build/mysql directory...${NO_COLOR}"
mkdir -p app/build/mysql && echo "${GREEN}${CHECK_ICON} Successfully created app/build/mysql directory.${NO_COLOR}" || { echo "${RED}${CROSS_ICON} Failed to create app/build directory.${NO_COLOR}"; exit 1; }


# Copy app/src/php to app/build
echo "${BOLD}Copying app/src/php to app/build...${NO_COLOR}"
cp -r app/src/php app/build && echo "${GREEN}${CHECK_ICON} Successfully copied app/src/php to app/build.${NO_COLOR}" || { echo "${RED}${CROSS_ICON} Failed to copy app/src/php to app/build.${NO_COLOR}"; exit 1; }

# Create app/build/smi directory
echo "${BOLD}Creating app/build/smi directory...${NO_COLOR}"
mkdir -p app/build/smi && echo "${GREEN}${CHECK_ICON} Successfully created app/build/smi directory.${NO_COLOR}" || { echo "${RED}${CROSS_ICON} Failed to create app/build/smi directory.${NO_COLOR}"; exit 1; }

# Copy app/src/smi_1.0.6.zip to app/build/smi
echo "${BOLD}Copying app/src/smi_1.0.6.zip to app/build/smi...${NO_COLOR}"
cp app/src/smi_1.0.6.zip app/build/smi/ && echo "${GREEN}${CHECK_ICON} Successfully copied app/src/smi_1.0.6.zip to app/build/smi.${NO_COLOR}" || { echo "${RED}${CROSS_ICON} Failed to copy app/src/smi_1.0.6.zip to app/build/smi.${NO_COLOR}"; exit 1; }

# Unzip smi_1.0.6.zip in app/build/smi directory
echo "${BOLD}Unzipping smi_1.0.6.zip in app/build/smi directory...${NO_COLOR}"
cd app/build/smi/ && unzip -q smi_1.0.6.zip && echo "${GREEN}${CHECK_ICON} Successfully unzipped smi_1.0.6.zip.${NO_COLOR}" || { echo "${RED}${CROSS_ICON} Failed to unzip smi_1.0.6.zip.${NO_COLOR}"; exit 1; }

########################################################################################
########################################################################################
cd ../../../
source scripts/checks.zsh
pwd
pwd
########################################################################################
########################################################################################

echo "${BOLD}${GREEN}${CHECK_ICON} All commands executed successfully.${NO_COLOR}"
# source scripts/checks.zsh
