#!/bin/bash
sudo apt update
sudo apt install -y apache2 mysql-server php php-mysql libapache2-mod-php php-cli
sudo systemctl enable apache2
sudo systemctl start apache2
sudo chmod -R 775 /var/www/html/
echo "Apache2 restarting"
sudo service apache2 restart
echo "Apache2 restarted"
#setting the setgid bit on the directory for group
sudo find /var/www/html -type d -exec chmod g+s {} +
sudo su - <<EOF
sudo echo "<?php phpinfo(); ?>" > /var/www/html/info.php
EOF
echo "lamp installation completed"
echo "check http://localhost"
