#!/bin/bash

# Define the missing keys
# missing_keys=(04EE7237B7D453EC 648ACFD622F3D138 0E98404D386FA1D9 EF0F382A1A7B6500)
#
# # Add the missing keys to the keyring
# for key in "${missing_keys[@]}"; do
#     sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys "$key"
# done
#
# # Update the package lists
# sudo apt-get update
#
# # Check if the errors have been resolved
# if ! apt-get update 2>&1 >/dev/null | grep -q 'NO_PUBKEY'; then
#     echo "GPG errors have been resolved."
# else
#     echo "Failed to add all missing keys."
#     #!/bin/bash
#
#     # Define the missing keys
#     missing_keys=(04EE7237B7D453EC 648ACFD622F3D138 0E98404D386FA1D9 EF0F382A1A7B6500)
#
#     # Add the missing keys to the keyring
#     for key in "${missing_keys[@]}"; do
#                 sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys "$key"
#         done
#
#         # Update the package lists
#         sudo apt-get update
#
#         # Check if the errors have been resolved
#         if ! apt-get update 2>&1 >/dev/null | grep -q 'NO_PUBKEY'; then
#                     echo "GPG errors have been resolved."
#             else
#                         echo "Failed to add all missing keys."
#         fi
# fi





cd /var/www/html/
chmod 777 smi
cd smi
mkdir telechgt && mkdir telechgt/fictec && mkdir svg 
cp install/csv/dz_dep.csv telechgt/fictec/ && cp install/csv/dz_villes.csv telechgt/fictec/
chmod 777 logos
chmod 777 svg
chmod 777 telechgt
chmod 777 telechgt/fictec
chmod 644 inc/prm.inc.php
chmod 755 inc
# apt-get update
# apt-get install php-mysql -y
service apache2 restart
