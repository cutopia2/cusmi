FROM php:5.4-apache
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
# ENV DEBIAN_FRONTEND noninteractive
# Backup and clean source.list file
RUN cp /etc/apt/sources.list /etc/apt/sources.list.old && \
cat /dev/null > /etc/apt/sources.list
COPY sources.list /etc/apt/sources.list
COPY php.ini /usr/local/etc/php/php.ini
RUN apt-get -y --allow-unauthenticated update && apt-get upgrade -y --allow-unauthenticated

# Install tools && libraries
RUN apt-get update && \
    apt-get -y install vim wget dialog build-essential git curl libcurl3 libcurl3-dev zip \
    libmcrypt-dev libsqlite3-dev libsqlite3-0 mysql-client zlib1g-dev libicu-dev \
    libfreetype6-dev libjpeg62-turbo-dev libpng-dev libapache2-mod-rpaf \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    && rm -rf /var/lib/apt/lists/*

# PHP5 Extensions
#docker-php-ext-install curl \
RUN docker-php-ext-install tokenizer \
    && docker-php-ext-install json \
    && docker-php-ext-install bcmath \
    && docker-php-ext-install mcrypt \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install pdo_sqlite \
    && docker-php-ext-install mysql \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install zip \
    && docker-php-ext-install intl \
    && docker-php-ext-install mbstring \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

RUN pecl install xdebug-2.4.0RC4 && docker-php-ext-enable xdebug \
    && echo "xdebug.remote_enable=1" >> /usr/local/etc/php/php.ini

# Insure an SSL directory exists
RUN mkdir -p /etc/apache2/ssl

# Enable SSL support
RUN a2enmod ssl && a2enmod rewrite

# Enable apache modules
RUN a2enmod rewrite headers
RUN a2enmod rewrite rpaf

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
