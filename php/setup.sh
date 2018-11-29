#!/bin/sh

# Install XDebug
pecl update-channels
pecl install xdebug

# Install Composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# Install global Composer packages
/usr/local/bin/composer global require laravel/installer