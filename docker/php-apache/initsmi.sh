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
apt-get update
apt-get install php-mysql -y
service apache2 restart
