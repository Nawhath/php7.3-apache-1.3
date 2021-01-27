# Dockerfile for Perfex CRM 
# Image nawhath/php7.3-apache:1.3

FROM php:7.3-apache

RUN docker-php-ext-enable sodium

RUN apt-get update && apt-get install -y build-essential libpng-dev libzip-dev libjpeg62-turbo-dev libfreetype6-dev locales zip jpegoptim optipng pngquant gifsicle vim unzip git libc-client-dev libkrb5-dev curl

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-install mysqli pdo_mysql mbstring zip exif pcntl

RUN docker-php-ext-configure gd --with-gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/

RUN docker-php-ext-install gd

RUN docker-php-ext-enable mysqli

RUN docker-php-ext-configure imap --with-kerberos --with-imap-ssl

RUN docker-php-ext-install -j$(nproc) imap
