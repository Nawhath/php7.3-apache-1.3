FROM nawhath/php7.3-apache:1.2

RUN apt update && apt install -y libc-client-dev libkrb5-dev libpng-dev && rm -r /var/lib/apt/lists/*

RUN docker-php-ext-install pdo pdo_mysql

RUN docker-php-ext-install gd

RUN docker-php-ext-configure imap --with-imap --with-kerberos --with-imap-ssl

RUN docker-php-ext-install imap

RUN apt-get clean && a2enmod rewrite
