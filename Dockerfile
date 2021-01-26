FROM php:7.3-apache

RUN apt-get update &&  apt-get install -y libzip-dev zlib1g-dev && docker-php-ext-install zip pdo_mysql mysqli 

RUN apt update && apt install -y libc-client-dev libkrb5-dev libpng-dev && rm -r /var/lib/apt/lists/*

RUN docker-php-ext-install pdo

RUN docker-php-ext-install gd

RUN docker-php-ext-configure imap --with-imap --with-kerberos --with-imap-ssl

RUN docker-php-ext-install imap

RUN apt-get clean && a2enmod rewrite
