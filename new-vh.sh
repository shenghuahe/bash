#!/bin/bash
echo "First parameter is host domain name"
echo "Second parameter is host path name"
echo "Third parameter is the export file name"
sudo echo "
<VirtualHost *:80>
    ServerName $1
    DocumentRoot $2
    SetEnv APPLICATION_ENV \"development\"
    <Directory $2>
        AllowOverride All
        Order allow,deny
        Allow from all
    </Directory>
</VirtualHost>
" | sudo tee -a /etc/apache2/sites-available/$3
cd /etc/apache2/sites-available/$3
sudo a2ensite $3
sudo service apache2 reload
