#!/bin/bash

# Creates a website for a specific user.
function create_website() {
    echo "<VirtualHost *:80>" >> "/etc/apache2/sites-enabled/$username.lan.conf"
    echo -e "\tServerAdmin $username@$username.lan" >> "/etc/apache2/sites-enabled/$username.lan.conf"
    echo -e "\tServerName $username.lan" >> "/etc/apache2/sites-available/$username.lan.conf"
    echo -e "\tServerAlias www.$username.lan" >> "/etc/apache2/sites-available/$username.lan.conf"
    echo -e "\tDocumentRoot /srv/web/$username/www" >> "/etc/apache2/sites-enabled/$username.lan.conf"
    echo -e "\tErrorLog /srv/web/$username.lan/logs/error.log" >> "/etc/apache2/sites-enabled/$username.lan.conf"
    echo -e "\tCustomLog /srv/web/$username.lan/logs/access.log combined" >> "/etc/apache2/sites-enabled/$username.lan.conf"
    echo "</VirtualHost>" >> "/etc/apache2/sites-enabled/$username.conf"
}

#<Directory "srv/web/$1/www">
#</Directory>