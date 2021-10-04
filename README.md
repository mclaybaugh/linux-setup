# linux-setup

Tools and scripts to setup and configure a linux desktop, and to sync files with a remote location.

## Adding local wordpress site

This process uses Apache2, PHP, MySQL on the host linux environment.

1. create database
    - sudo mysql -u root (no password)
    - create database MYDATABASE
    - grant all privileges on MYDATABASE.* to 'wordpress'@'localhost';
2. update apache
    - create apache site file at /etc/apache2/sites-available/ from template
    - a2ensite SITENAME
    - reload apache
3. put files in /var/www/SITEDOMAIN/
4. Add entry in /etc/hosts
    - 127.0.0.1   mysitedomain.local