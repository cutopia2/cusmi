# cusmi
---

## Files Names & Folders folderstructure for smi
- app/
  - src/                      # Contains PHP source code
  - public/                   # Contains web assets that will be publicly accessible
  - config/                   # Contains configuration files
    - php.ini                 # PHP configuration file
    - httpd.conf              # Apache configuration file
  - db/                       # Contains database files
- docker/
  - mysql/
    - Dockerfile              # Dockerfile for MySQL 5.5
  - php-apache/
    - Dockerfile              # Dockerfile for PHP 5.6 with Apache
  - backup/
    - Dockerfile              # Dockerfile for backing up the database
  - scripts/
    - start.sh                # Script for starting the containers
    - install.sh              # Script for installing dependencies
    - clean.sh                # Script for cleaning up unused containers and images
    - update.sh               # Script for updating the dependencies
    - upgrade.sh              # Script for upgrading the system packages
  - docker-compose.yml        # Docker Compose configuration file.
