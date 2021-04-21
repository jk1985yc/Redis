FROM php:5.6.40-fpm
#FROM php:5.6.34-fpm

#install mcrypt、mysql Module
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
    && docker-php-ext-install -j$(nproc) iconv mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install mysql mysqli sysvsem bcmath
    
#install redis Module
RUN curl -L -o /tmp/redis.tar.gz https://github.com/phpredis/phpredis/archive/2.2.7.tar.gz \
    && tar xfz /tmp/redis.tar.gz \
    && rm -r /tmp/redis.tar.gz \
    && mkdir -p /usr/src/php/ext/ \
    && mv phpredis-2.2.7 /usr/src/php/ext/redis \
    && docker-php-ext-install redis
    
#RUN apt-get update \
#  && apt-get install -y --no-install-recommends libpq-dev \
#  && apt-get install -y php5-mcrypt libmcrypt4 libmcrypt-dev \
#  && apt-get install -y php5-mcrypt php5-dev \
#  && php5enmod mcrypt \
#  && apt-get install -y curl libcurl3 libcurl3-dev php5-curl \
#  && php5enmod curl \
#  && docker-php-ext-install pdo_pgsql pdo_mysql

# apcu
#RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y php-apcu 

# mod
#RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y php7.1-pgsql php7.1-mysql php7.1-curl php7.1-gd php7.1-intl php-pear php-imagick php7.1-imap php7.1-mcrypt php-memcache  php7.1-pspell php7.0-recode php7.1-sqlite3 php7.1-tidy php7.1-xmlrpc php7.1-xsl php7.1-mbstring php-gettext php-mongodb php-redis

#Set Session Path
RUN mkdir -p /var/lib/php/session && chown -R www-data:www-data /var/lib/php/session

#Time
ENV TW=Asia/Taipei
RUN ln -snf /usr/share/zoneinfo/$TW /etc/localtime && echo $TW > /etc/timezone

EXPOSE 9000
CMD ["php-fpm"]
