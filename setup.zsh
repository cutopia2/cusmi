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
source ./scripts/cufunc.zsh
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



source scripts/checks.zsh
source scripts/cleanup.zsh



########################################################################################
########################################################################################
# cd ../../../
# Create app/build directory
cumkdir app/build
# Create app/build/backup directory
cumkdir app/build/backup 
# Copy app/src/php to app/build
cucp -s app/src/php -d app/build
# Change directory to root smi app directory
cumkdir app/build/smi
# mkdir app/build/smi
ls -lahr app/build/smi

pwd
pwd
pwd
pwd
# Copy app/src/smi_1.0.6.zip to app/build/smi
cucp -s app/src/smi_1.0.6.zip -d app/build/smi/
pwd
cucd app/build/smi/
# unzip smi_1.0.6.zip
# cumpresd -d smi_1.0.6.zip
unzip smi_1.0.6.zip
cd ../../../
cucp -s app/src/prm.inc.php -d app/build/smi/inc/
docker-compose-build
docker-compose-up

brave-browser http://0.0.0.0:8083/smi/index.php







pwd
pwd
########################################################################################
########################################################################################

echo "${BOLD}${GREEN}${CHECK_ICON} All commands executed successfully.${NO_COLOR}"
# source scripts/checks.zsh
